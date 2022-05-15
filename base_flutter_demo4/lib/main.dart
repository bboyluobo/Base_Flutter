import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MyAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      child: Icon(Icons.pets, size: 44, color: Colors.red),
      alignment: Alignment.center,
      widthFactor: 4,
      heightFactor: 10,
    );
  }
}

class MyCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // ignore: prefer_const_constructors
    return Center(
      child: Icon(Icons.pets, size: 44, color: Colors.red),
      // alignment: Alignment.center,
      widthFactor: 4,
      heightFactor: 10,
    );
  }
}

class MyPadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        "莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
        style: TextStyle(color: Colors.redAccent, fontSize: 18),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        color: Colors.amber,
        width: 110,
        height: 110,
        child: Icon(Icons.pets, size: 32, color: Colors.white),
      ),
    );
  }
}

class MyBoxDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        width: 150,
        height: 150,
        child: Icon(Icons.pets, size: 32, color: Colors.white),
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(
              width: 3, color: Colors.redAccent, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(offset: Offset(5, 5), color: Colors.purple, blurRadius: 5)
          ],
          gradient: LinearGradient(colors: [Colors.green, Colors.red]),
          image: DecorationImage(
            image: NetworkImage(
                "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg"),
          ),
        ),
      ),
    );
  }
}

class MyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.lightGreen,
              width: 60,
              height: 60,
            )),
        Container(color: Colors.red, width: 60, height: 60),
        Container(color: Colors.blue, width: 60, height: 60),
        Container(color: Colors.green, width: 60, height: 60),
        Container(color: Colors.orange, width: 60, height: 60),
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.lightGreen,
              width: 60,
              height: 60,
            )),
      ],
    );
  }
}

class MyColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.lightGreen,
              width: 60,
              height: 60,
            )),
        Container(color: Colors.red, width: 60, height: 60),
        Container(color: Colors.blue, width: 60, height: 60),
        Container(color: Colors.green, width: 60, height: 60),
        Container(color: Colors.orange, width: 60, height: 60),
        Expanded(
            flex: 1,
            child: Container(
              color: Colors.lightGreen,
              width: 60,
              height: 60,
            )),
      ],
    );
  }
}

class MyStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.orange,
          width: 300,
          height: 300,
        ),
        Positioned(
            left: 20,
            top: 20,
            child: Icon(
              Icons.favorite,
              size: 50,
              color: Colors.white,
            )),
        Positioned(
            top: 70,
            left: 20,
            child: Text(
              "撒大代卡视角",
              style: TextStyle(fontSize: 20, color: Colors.purple),
            ))
      ],
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: MyStack(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
