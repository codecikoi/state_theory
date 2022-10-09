import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MyScopedModel extends StatefulWidget {
  const MyScopedModel({Key? key}) : super(key: key);

  @override
  State<MyScopedModel> createState() => _MyScopedModelState();
}

class _MyScopedModelState extends State<MyScopedModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScopedModel Widget'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ScopedModel(
            model: MyModel(),
            child: _AppRootWidget(),
          ),
        ],
      ),
    );
  }
}

class _AppRootWidget extends StatelessWidget {
  const _AppRootWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myStyle = Theme.of(context).textTheme.headline4;

    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          Text('(Root Widget)', style: myStyle),
          SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _Counter(),
              _Counter(),
            ],
          )
        ],
      ),
    );
  }
}

class _Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myStyle = Theme.of(context).textTheme.headline4;

    return ScopedModelDescendant<MyModel>(
      rebuildOnChange: true,
      builder: (context, child, model) => Card(
        margin: EdgeInsets.all(4.0).copyWith(bottom: 32.0),
        color: Colors.yellowAccent,
        child: Column(
          children: [
            Text('(Child Widget)'),
            Text('${model.counterValue}', style: myStyle),
            ButtonBar(
              children: [
                IconButton(
                    onPressed: () => model._decrementCounter(),
                    icon: Icon(Icons.remove),
                    color: Colors.red),
                IconButton(
                    onPressed: () => model._incrementCounter(),
                    icon: Icon(Icons.add),
                    color: Colors.green),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyModel extends Model {
  int _counter = 0;

  int get counterValue => _counter;

  void _incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void _decrementCounter() {
    _counter--;
    notifyListeners();
  }
}
