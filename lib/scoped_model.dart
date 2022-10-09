import 'package:flutter/material.dart';


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
          _AppRootWidget(),
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
  const _Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final myStyle = Theme.of(context).textTheme.headline4;

    return Card(
      margin: EdgeInsets.all(4.0).copyWith(bottom: 32.0),
      color: Colors.yellowAccent,
      child: Column(
        children: [
          Text('(Child Widget)'),
          Text('0', style: myStyle),
          ButtonBar(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.remove), color: Colors.red),
              IconButton(onPressed: () {}, icon: Icon(Icons.add), color: Colors.green),
            ],
          )
        ],
      ),
    );
  }
}
