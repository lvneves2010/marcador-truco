import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placar de Truco',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Placar de truco'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _counter2 = 0;

  void _incrementCounterUs() {
    setState(() {
      _counter++;
    });
  }
  void _incrementCounterThem() {
    setState(() {
      _counter2++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _counter2 = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nós',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              onPressed: _incrementCounterUs,
              child: Icon(Icons.add),
            ),
            Text(
              'Eles',
            ),
            Text(
              '$_counter2',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              onPressed: _incrementCounterThem,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _resetCounter,
        tooltip: 'novo jogo',
        child: Icon(Icons.autorenew),
      ), 
    );
  }
}
