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
  bool nosGanhamos = false;

  void _incrementCounterUs() {
    setState(() {
      if (_counter < 12) {
      _counter++;
      }
    });
  }

  void _incrementTrucoUs() {
    setState(() {
      if (_counter < 12) {
      _counter = _counter + 3;
      }
      if (_counter >= 12) {
       _counter = 12;
       nosGanhamos = true; 
      }
    });
  }

  void _decrementCounterUs() {
    setState(() {
      if (_counter > 0) {
      _counter--;
      }
    });
  }

  void _incrementCounterThem() {
    setState(() {
      if (_counter2 < 12) {
      _counter2++;
      }
    });
  }

  void _incrementTrucoThem() {
    setState(() {
      if (_counter2 < 12) {
      _counter2 = _counter2 + 3;
      }
      if (_counter2 >= 12) {
       _counter2 = 12;
       nosGanhamos = true; 
      }
    });
  }

  void _decrementCounterThem() {
    setState(() {
      if (_counter2 > 0) {
      _counter2--;
      }
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
            Spacer(),
            Text(
              'Nós',
              style: TextStyle(fontWeight: FontWeight.bold)
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(children: <Widget>[
            Spacer(),
              FloatingActionButton(
                onPressed: _incrementCounterUs,
                child: Icon(Icons.arrow_upward),
              ),
              FloatingActionButton(
                onPressed: _incrementTrucoUs,
                child: Text('Truco'),
              ),
              FloatingActionButton(
                onPressed: _decrementCounterUs,
                child: Icon(Icons.arrow_downward),
              ),
            Spacer(),
            ],),
            Spacer(),
            Text(
              'Eles',
              style: TextStyle(fontWeight: FontWeight.bold)
            ),
            Text(
              '$_counter2',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(children: <Widget>[
            Spacer(),
              FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: _incrementCounterThem,
                child: Icon(Icons.arrow_upward),
              ),
              FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: _incrementTrucoThem,
                child: Text('Truco'),
              ),
              FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: _decrementCounterThem,
                child: Icon(Icons.arrow_downward),
              ),
            Spacer(),
            ],),
            Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: _resetCounter,
        tooltip: 'novo jogo',
        child: Icon(Icons.autorenew),
      ), 
    );
  }
}
