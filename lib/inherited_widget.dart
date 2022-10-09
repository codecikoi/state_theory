import 'package:flutter/material.dart';

class InheritedWidgetType extends StatefulWidget {
  const InheritedWidgetType({Key? key}) : super(key: key);

  @override
  State<InheritedWidgetType> createState() => _InheritedWidgetTypeState();
}

class _InheritedWidgetTypeState extends State<InheritedWidgetType> {
  int _counter = 0;

  int get counterValue => _counter;

  void _incrementCounter() => setState(() => _counter++);
  void _decrementCounter() => setState(() => _counter--);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited Widget State'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          MyInheritedWidget(child: AppRootWidget(), myState: this),
        ],
      ),
    );
  }
}

class AppRootWidget extends StatelessWidget {
  const AppRootWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rootWidgetState = MyInheritedWidget.of(context)!.myState;

    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          Text('(Root Widget)', style: Theme.of(context).textTheme.headline4),
          Text('${rootWidgetState.counterValue}',
              style: Theme.of(context).textTheme.headline4),
          SizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Counter(),
              Counter(),
            ],
          )
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rootWidgetState = MyInheritedWidget.of(context)!.myState;

    return Card(
      margin: EdgeInsets.all(4.0).copyWith(bottom: 32.0),
      color: Colors.indigo[300],
      child: Column(
        children: [
          Text('(Child Widget)'),
          Text('${rootWidgetState.counterValue}', style: Theme.of(context).textTheme.headline4),
          ButtonBar(
            children: [
              IconButton(
                onPressed: () => rootWidgetState._decrementCounter(),
                icon: Icon(Icons.remove),
                color: Colors.red,
              ),
              IconButton(
                onPressed: () => rootWidgetState._incrementCounter(),
                icon: Icon(Icons.add),
                color: Colors.green,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final _InheritedWidgetTypeState myState;

  MyInheritedWidget({Key? key, required Widget child, required this.myState})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return myState.counterValue != oldWidget.myState.counterValue;
  }

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }
}
