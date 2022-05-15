import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: MyHomeBody(),
    );
  }
}

class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyTextFormField();
  }
}

class MyTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      "《定风波,》 苏轼 \n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
      style: TextStyle(fontSize: 20, color: Colors.purple),
      textAlign: TextAlign.center,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class MyAttributedText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: "《定风波》",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          TextSpan(
              text: "苏轼", style: TextStyle(fontSize: 18, color: Colors.red)),
          TextSpan(text: "\n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。")
        ],
      ),
      style: TextStyle(fontSize: 20, color: Colors.purple),
      textAlign: TextAlign.center,
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        FloatingActionButton(
          child: Text("FloatingActionButton",
              style: TextStyle(color: Colors.white)),
          onPressed: () {
            print("FloatingActionButton");
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        RaisedButton(
          child: Text("RaisedButton"),
          onPressed: () {
            print("RaisedButton");
          },
        ),
        FlatButton(
          child: Text("RaisedButton"),
          onPressed: () {
            print("RaisedButton");
          },
        ),
        OutlineButton(
          child: Text("RaisedButton"),
          onPressed: () {
            print("RaisedButton");
          },
        )
      ],
    );
  }
}

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        child: Image.network(
          "http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg",
          alignment: Alignment.topCenter,
          repeat: ImageRepeat.repeatY,
          color: Colors.red,
          colorBlendMode: BlendMode.colorDodge,
        ),
        width: 300,
        height: 300,
        color: Colors.yellow,
      ),
    );
  }
}

class MyCircleAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: CircleAvatar(
        radius: 100,
        backgroundImage: NetworkImage(
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg"),
        child: Container(
          alignment: Alignment(0, 5),
          width: 200,
          height: 200,
          child: Text("2022年04月28日14:08:31"),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[TextFieldDemo()],
      ),
    );
    // Container(
    //   padding: EdgeInsets.all(20),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[TextFieldDemo()],
    //   ),
    // );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextFieldDemoState();
  }
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    //已废弃
    textEditingController.text = "Hello World";

    textEditingController.addListener(() {
      print("初始值：${textEditingController.text}");
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      controller: TextEditingController.fromValue(TextEditingValue(
          text: "我是初始值",
          selection: TextSelection.fromPosition(
              TextPosition(affinity: TextAffinity.downstream, offset: 5)))),
      decoration: InputDecoration(
          icon: Icon(Icons.people),
          labelText: "userName",
          hintText: "请输入用户名",
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.lightGreen),
      onChanged: (value) {
        print("onChanged:$value");
      },
      onSubmitted: (value) {
        print("onSubmitted:$value");
      },
    );
  }
}

class MyTextFormField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyTextFormFieldState();
  }
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  final registerForKey = GlobalKey<FormState>();
  String? userName, passWord;

  void registerForm() {
    registerForKey.currentState?.save();
    print("username:$userName  password:$passWord");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Form(
            /*Form组件是一个容器类控件，可以包含多个FormField表单控件，这样的好处是统一管理。
在使用Form的时候需要设置其key，通过key获取当前的FormState，然后可以调用FormState的save、validate、reset等方法，一般通过如下方法设置*/
            key: registerForKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.people), labelText: "用户名或手机号"),
                  onSaved: (newValue) {
                    print("用户名或手机号：$newValue");
                    this.userName = newValue;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(icon: Icon(Icons.lock)),
                  onSaved: (newValue) {
                    print("密码：$newValue");
                    this.passWord = newValue;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    width: double.infinity,
                    height: 44,
                    child: RaisedButton(
                        color: Colors.lightBlue,
                        child: Text(
                          "注册",
                          style: TextStyle(fontSize: 20, color: Colors.yellow),
                        ),
                        onPressed: () {
                          print("点击了注册按钮");
                          registerForm();
                        }))
              ],
            )));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
