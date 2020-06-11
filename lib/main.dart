import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  //Loading counter value on start
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
      _counter2 = (prefs.getInt('counter2') ?? 0);
    });
  }

  void _incrementCounterUs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_counter < 12) {
        _counter = (prefs.getInt('counter') ?? 0) + 1;
        prefs.setInt('counter', _counter);
      }
    });
  }

  void _incrementTrucoUs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_counter < 12) {
        _counter = (prefs.getInt('counter') ?? 0) + 3;
        prefs.setInt('counter', _counter);
      }
      if (_counter >= 12) {
       _counter = 12;
       prefs.setInt('counter', _counter);
       nosGanhamos = true; 
      }
    });
  }

  void _decrementCounterUs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_counter > 0) {
        _counter = (prefs.getInt('counter') ?? 0) - 1;
        prefs.setInt('counter', _counter);
      }
    });
  }

  void _incrementCounterThem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_counter2 < 12) {
        _counter2 = (prefs.getInt('counter2') ?? 0) + 1;
        prefs.setInt('counter2', _counter2);
      }
    });
  }

  void _incrementTrucoThem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_counter2 < 12) {
        _counter2 = (prefs.getInt('counter2') ?? 0) + 3;
        prefs.setInt('counter2', _counter2);
      }
      if (_counter2 >= 12) {
       _counter2 = 12;
       prefs.setInt('counter2', _counter2);
       nosGanhamos = true; 
      }
    });
  }

  void _decrementCounterThem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_counter2 > 0) {
        _counter2 = (prefs.getInt('counter2') ?? 0) - 1;
        prefs.setInt('counter2', _counter2);
      }
    });
  }


  void _resetCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = 0;
      _counter2 = 0;
      prefs.setInt('counter', _counter);
      prefs.setInt('counter2', _counter2);
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
