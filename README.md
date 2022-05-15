# 一. 创建Flutter项目

> 创建Flutter项目有两种方式：`通过命令行创建` 和 `通过开发工具创建`

## 1.1. 通过命令行创建

通过命令行创建非常简单，在终端输入以下命令即可：

- **注意**: Flutter的名称不要包含特殊的字符，另外不可以使用驼峰标识
- 创建完之后使用自己喜欢的开发工具打开即可

```dart
flutter create learn_flutter
```

## 1.2. 通过开发工具创建

我这里也可以直接通过Android Studio来进行创建：

- 选择`Start a new Flutter project`，之后填写相关的信息即可，这里不再赘述

## 1.3. 默认程序分析

​	

默认项目分析：

- 我们之前已经分析过目录结构了，在目录下有一个`lib`文件夹，里面会存放我们编写的Flutter代码；
- 打开发现里面有一个`main.dart`，它是我们Flutter启动的`入口文件`，里面有`main函数`；

默认代码分析：

- 这是一个计数器的案例程序，点击右下角的 `+` 符号，上面显示的数字会递增；
- 但是我们第一次接触main.dart中的代码，可能会发现很多不认识的代码，不知道这个内容是如何编写出来的；

**作为初学者，我的建议是将其中所有的代码全部删除掉，从零去创建里面的代码，这样我们才能对Flutter应用程序的结构非常清晰；**

# 二. 开始Flutter代码

## 2.1. Hello World

### 2.1.1. Hello World的需求

做任何的开发，我们都是从祖传的`Hello World`开始，那么现在我们的需求来了：

- 在界面中心位置，显示一个Hello World；

### 2.1.2. Hello World的实现

下面，我们就动手开始编写Hello World：

```dart
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(Text("Hello World", textDirection: TextDirection.ltr));
}
```

当然，上面的代码我们已经实现了在界面上显示Hello World：

- 但是`没有居中，字体也有点小`；
- 这些问题，我们放到后面再来解决，先搞懂目前的几行代码；

​	当然，上面的代码我们已经实现了在界面上显示Hello World：

- 但是`没有居中，字体也有点小`；
- 这些问题，我们放到后面再来解决，先搞懂目前的几行代码；

下面，我们对不认识的代码进行一些分析。

## 2.2. 代码分析

### 2.2.1. runApp和Widget

**runApp**是Flutter内部提供的一个函数，当我们启动一个Flutter应用程序时就是从调用这个函数开始的

- 我们可以点到runApp的源码，查看到该函数
- 我们暂时不分析具体的源码（因为我发现过多的理论，对于初学者来说并不友好）

```dart
void runApp(Widget app) {
  ...省略代码
}
```

该函数让我们传入一个东西：**Widget**？

我们先说**Widget的翻译**：

Widget在国内有很多的翻译；

- 做过Android、iOS等开发的人群，喜欢将它翻译成**控件**；

- 做过Vue、React等开发的人群，喜欢将它翻译成**组件**；
- 如果我们使用Google，Widget翻译过来应该是**小部件**；
- 没有说哪种翻译一定是对的，或者一定是错的，但是我个人更倾向于**小部件或者组件**；

**Widget**到底什么东西呢？

- 我们学习Flutter，从一开始就可以有一个基本的认识：**Flutter中万物皆Widget（万物皆可盘）**；

- 在我们iOS或者Android开发中，我们的界面有很多种类的划分：应用（Application）、视图控制器（View Controller）、活动（Activity）、View（视图）、Button（按钮）等等；

- 但是在Flutter中，这些东西都是**不同的Widget而已**；

- 也就是我们整个应用程序中`所看到的内容`几乎都是Widget，甚至是`内边距的设置`，我们也需要使用一个叫`Padding的Widget`来做；

runApp函数让我们传入的就是一个Widget：

- 但是我们现在没有Widget，怎么办呢？
- 我们可以导入Flutter默认已经给我们提供的Material库，来使用其中的很多内置Widget；

### 2.2.2. Material设计风格

**material是什么呢？**

- material是Google公司推行的一套`设计风格`，或者叫设`计语言、设计规范`等；
- 里面有非常多的设计规范，比如颜色、文字的排版、响应动画与过度、填充等等；

- 在Flutter中高度集成了`Material风格的Widget`；
- 在我们的应用中，我们可以直接使用这些Widget来创建我们的应用（后面会用到很多）；

**Text小部件分析**：

- 我们可以使用Text小部件来完成文字的显示；
- 我们发现Text小部件继承自StatelessWidget，StatelessWidget继承自Widget；
- 所以我们可以将Text小部件传入到runApp函数中

- 属性非常多，但是我们已经学习了Dart语法，所以你会发现只有this.data属性是必须传入的。

```dart
class Text extends StatelessWidget {
  const Text(
    this.data, {
    Key key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
  });
}
```

**StatelessWidget简单介绍：**

- StatelessWidget继承自Widget；
- 后面我会更加详细的介绍它的用法；

```dart
abstract class StatelessWidget extends Widget {
	// ...省略代码
}
```

## 2.3. 代码改进

### 2.3.1. 改进界面样式

我们发现现在的代码并不是我们想要的最终结果：

- 我们可能希望文字居中显示，并且可以大一些；
- **居中显示**： 需要使用另外一个Widget，`Center`；
- **文字大一些**： 需要给Text文本设置一些样式；

我们修改代码如下：

- 我们在Text小部件外层包装了一个Center部件，让Text作为其child；
- 并且，我们给Text组件设置了一个属性：style，对应的值是TextStyle类型；

```dart
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(
    Center(
      child: Text(
        "Hello World",
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 36),
      ),
    )
  );
}
```

### 2.3.2. 改进界面结构

目前我们虽然可以显示HelloWorld，但是我们发现最底部的背景是黑色，并且我们的页面并不够结构化。

- 正常的App页面应该有一定的结构，比如通常都会有`导航栏`，会有一些`背景颜色`等

在开发当中，我们并不需要从零去搭建这种结构化的界面，我们可以使用Material库，直接使用其中的一些封装好的组件来完成一些结构的搭建。

我们通过下面的代码来实现：

```dart
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("CODERWHY"),
        ),
        body: Center(
          child: Text(
            "Hello World",
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 36),
          ),
        ),
      ),
    )
  );
}
```

在最外层包裹一个**MaterialApp**

- 这意味着整个应用我们都会采用MaterialApp风格的一些东西，方便我们对应用的设计，并且目前我们使用了其中两个属性；
- title：这个是定义在Android系统中打开多任务切换窗口时显示的标题；（暂时可以不写）

- home：是该应用启动时显示的页面，我们传入了一个Scaffold；

**Scaffold是什么呢？**

- 翻译过来是`脚手架`，脚手架的作用就是搭建页面的基本结构；
- 所以我们给MaterialApp的home属性传入了一个Scaffold对象，作为启动显示的Widget；

- Scaffold也有一些属性，比如`appBar`和`body`；
- appBar是用于设计导航栏的，我们传入了一个`title属性`；
- body是页面的内容部分，我们传入了之前已经创建好的Center中包裹的一个Text的Widget；

### 2.3.3. 进阶案例实现

我们可以让界面中存在更多的元素：

- 写到这里的时候，你可能已经发现嵌套太多了，不要着急，我们后面会对代码重构的

```dart
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("CODERWHY"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                value: true,
                onChanged: (value) => print("Hello World")),
              Text(
                "同意协议",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    )
  );
}
```

## 2.4. 代码重构

### 2.4.1. 创建自己的Widget

很多学习Flutter的人，都会被Flutter的嵌套劝退，当代码嵌套过多时，结构很容易看不清晰。

这里有两点我先说明一下：

- 1、Flutter整个开发过程中就是形成一个Widget树，所以形成嵌套是很正常的。
- 2、关于Flutter的代码缩进，更多开发中我们使用的是2个空格（前端开发2个空格居多，你喜欢4个也没问题）

但是，我们开发一个这么简单的程序就出现如此多的嵌套，如果应用程序更复杂呢？

- 我们可以对我们的代码进行封装，将它们封装到自己的Widget中，创建自己的Widget；

如何创建自己的Widget呢？

- 在Flutter开发中，我们可以继承自StatelessWidget或者StatefulWidget来创建自己的Widget类；
- **StatelessWidget**： 没有状态改变的Widget，通常这种Widget仅仅是做一些展示工作而已；

- **StatefulWidget**： 需要保存状态，并且可能出现状态改变的Widget；

在上面的案例中对代码的重构，我们使用StatelessWidget即可，所以我们接下来学习一下如果利用StatelessWidget来对我们的代码进行重构；

StatefulWidget我们放到后面的一个案例中来学习；

### 2.4.2. StatelessWidget

StatelessWidget通常是一些没有状态（State，也可以理解成data）需要维护的Widget：

- 它们的数据通常是直接写死（放在Widget中的数据，必须被定义为final，为什么呢？我在下一个章节讲解StatefulWidget会讲到）；
- 从parent widget中传入的而且一旦传入就不可以修改；

- 从InheritedWidget获取来使用的数据（这个放到后面会讲解）；

我们来看一下创建一个StatelessWidget的格式：

- 1、让自己创建的Widget继承自StatelessWidget；
- 2、StatelessWidget包含一个必须重写的方法：build方法；

```dart
class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return <返回我们的Widget要渲染的Widget，比如一个Text Widget>;
  }
}
```

**build方法的解析：**

- Flutter在拿到我们自己创建的StatelessWidget时，就会执行它的build方法；
- 我们需要在build方法中告诉Flutter，我们的Widget希望渲染什么元素，比如一个Text Widget；

- StatelessWidget没办法主动去执行build方法，当我们使用的数据发生改变时，build方法会被重新执行；

**build方法什么情况下被执行呢？**

- 1、当我们的StatelessWidget第一次被插入到Widget树中时（也就是第一次被创建时）；

- 2、当我们的父Widget（parent widget）发生改变时，子Widget会被重新构建；
- 3、如果我们的Widget依赖InheritedWidget的一些数据，InheritedWidget数据发生改变时；

### 2.4.3. 重构案例代码

现在我们就可以通过StatelessWidget来对我们的代码进行重构了

- 因为我们的整个代码都是一些数据展示，没有数据的改变，使用StatelessWidget即可；

- 另外，为了体现更好的封装性，我对代码进行了两层的拆分，让代码结构看起来更加清晰；（具体的拆分方式，我会在后面的案例中不断的体现出来，目前我们先拆分两层）

重构后的代码如下：

```dart
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("CODERWHY"),
        ),
        body: HomeContent(),
      ),
    )
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              value: true,
              onChanged: (value) => print("Hello World")),
          Text(
            "同意协议",
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
```

### 2.4.4. 必传参数和@required的区别

- 必传参数: 不传就报错, 编译通不过
- @required: 编译可以通过, 但会报警告

# 三. 案例练习

## 3.1. 案例最终效果

我们先来看一下案例的最终展示效果：

- 这个效果中我们会使用很多没有接触的Widget；
- 没有关系，后面这些常用的Widget我会一个个讲解；

- 这个案例最主要的目的还是让大家更加熟悉Flutter的开发模式以及自定义Widget的封装过程；

## 3.2. 自定义Widget

在我们的案例中，很明显一个产品的展示就是一个大的Widget，这个Widget包含如下Widget：

- 标题的Widget：使用一个Text Widget完成；
- 描述的Widget：使用一个Text Widget完成；
- 图片的Widget：使用一个Image Widget完成；

- 上面三个Widget要垂直排列，我们可以使用一个Column的Widget（上一个章节中我们使用了一次Row是水平排列的）

另外，三个展示的标题、描述、图片都是不一样的，所以我们可以让Parent Widget来决定内容：

- 创建三个成员变量保存父Widget传入的数据

```dart
class ProductItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;

  ProductItem(this.title, this.desc, this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(title, style: TextStyle(fontSize: 24)),
        Text(desc, style: TextStyle(fontSize: 18)),
        Image.network(imageURL)
      ],
    );
  }
}
```

## 3.3. 列表数据展示

现在我们就可以创建三个ProductItem来让他们展示了：

- MyApp和上一个章节是一致的，没有任何改变；
- HomeContent中，我们使用了一个Column，因为我们创建的三个ProductItem是垂直排列的

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("CODERWHY"),
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProductItem("Apple1", "Macbook Product1", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        ProductItem("Apple2", "Macbook Product2", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        ProductItem("Apple3", "Macbook Product3", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
      ],
    );
  }
}
```

- 错误信息：下面出现了**黄色的斑马线**;
- 这是因为在Flutter的布局中，内容是不能超出屏幕范围的，当超出时不会自动变成滚动效果，而是会报下面的错误；

如何可以解决这个问题呢？

- 我们将Column换成ListView即可；
- ListView可以让自己的子Widget变成滚动的效果；

## 3.4. 案例细节调整

### 3.4.1. 界面整体边距

如果我们希望整个内容距离屏幕的边缘有一定的间距，怎么做呢？

- 我们需要使用另外一个Widget：Padding，它有一个padding属性用于设置边距大小；
- 没错，设置内边距也是使用Widget，这个Widget就是Padding；

### 3.4.2. 商品内边距和边框

我们现在希望给所有的商品也添加一个内边距，并且还有边框，怎么做呢？

- 我们可以使用一个Container的Widget，它里面有padding属性，并且可以通过decoration来设置边框；

- Container我们也会在后面详细来讲，我们先用起来；

### 3.4.3. 文字图片的间距

我们希望给图片和文字之间添加一些间距，怎么做呢？

- 方式一：给图片或者文字添加一个向上的内边距或者向下的内边距；
- 方式二：使用SizedBox的Widget，设置一个height属性，可以增加一些距离；

## 3.5. 最终实现代码

最后，我给出最终实现代码：

```dart
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("CODERWHY"),
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          ProductItem("Apple1", "Macbook Product1", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
          ProductItem("Apple2", "Macbook Product2", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
          ProductItem("Apple3", "Macbook Product3", "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;

  ProductItem(this.title, this.desc, this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all()
      ),
      child: Column(
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 24)),
          Text(desc, style: TextStyle(fontSize: 18)),
          SizedBox(height: 10,),
          Image.network(imageURL)
        ],
      ),
    );
  }
}
```

# 一. StatefulWidget

```markdown
在开发中，某些Widget情况下我们展示的数据并不是一层不变的：
比如Flutter默认程序中的计数器案例，点击了+号按钮后，显示的数字需要+1；
比如在开发中，我们会进行下拉刷新、上拉加载更多，这时数据也会发生变化；
而StatelessWidget通常用来展示哪些数据固定不变的，如果数据会发生改变，我们使用StatefulWidget；
```

## 1.1. 认识StatefulWidget

### 1.1.1. StatefulWidget介绍

如果你有阅读过默认我们创建Flutter的示例程序，那么你会发现它创建的是一个StatefulWidget。

为什么选择StatefulWidget呢？

- 因为在示例代码中，当我们点击按钮时，界面上显示的数据会发生改变；
- 这时，我们需要一个`变量`来记录当前的状态，再把这个变量显示到某个Text Widget上；
- 并且每次`变量`发生改变时，我们对应的Text上显示的内容也要发生改变；

但是有一个问题，我之前说过定义到Widget中的数据都是不可变的，必须定义为final，为什么呢？

- 这次因为Flutter在设计的时候就决定了一旦Widget中展示的数据发生变化，就重新构建整个Widget；

- 下一个章节我会讲解Flutter的渲染原理，Flutter通过一些机制来限定定义到Widget中的`成员变量`必须是`final`的；

**Flutter如何做到我们在开发中定义到Widget中的数据一定是final的呢？**

我们来看一下Widget的源码：

```dart
@immutable
abstract class Widget extends DiagnosticableTree {
	// ...省略代码
}
```

这里有一个很关键的东西`@immutable`

- 我们似乎在Dart中没有见过这种语法，这实际上是一个 注解，这涉及到Dart的元编程，我们这里不展开讲；

- 这里我就说明一下这个@immutable是干什么的；

实际上官方有对@immutable进行说明：

- [**来源：**](https://api.flutter.dev/flutter/meta/immutable-constant.html)
- **说明：** 被@immutable注解标明的类或者子类都必须是不可变的

**结论：** 定义到Widget中的数据一定是不可变的，需要使用final来修饰

### 1.1.2. 如何存储Widget状态？

既然Widget是不可变，那么StatefulWidget如何来存储可变的状态呢？

- StatelessWidget无所谓，因为它里面的数据通常是直接定义完后就不修改的。
- 但StatefulWidget需要有状态（可以理解成变量）的改变，这如何做到呢？

Flutter将StatefulWidget设计成了两个类：

- 也就是你创建StatefulWidget时必须创建两个类：
- 一个类继承自StatefulWidget，作为Widget树的一部分；
- 一个类继承自State，用于记录StatefulWidget会变化的状态，并且根据状态的变化，构建出新的Widget；

创建一个StatefulWidget，我们通常会按照如下格式来做：

- 当Flutter在构建Widget Tree时，会获取`State的实例`，并且它调用build方法去获取StatefulWidget希望构建的Widget；
- 那么，我们就可以将需要保存的状态保存在MyState中，因为它是可变的；

```dart
class MyStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // 将创建的State返回
    return MyState();
  }
}

class MyState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return <构建自己的Widget>;
  }
}
```

**思考：为什么Flutter要这样设计呢？**

这是因为在Flutter中，只要数据改变了Widget就需要重新构建（rebuild）

## 1.2. StatefulWidget案例

### 1.2.1. 案例效果和分析

我们通过一个案例来练习一下StatefulWidget，还是之前的计数器案例，但是我们按照自己的方式进行一些改进。

案例效果以及布局如下：

- 在这个案例中，有很多布局对于我们来说有些复杂，我们后面会详细学习，建议大家根据我的代码一步步写出来来熟悉Flutter开发模式；
- Column小部件：之前我们已经用过，当有垂直方向布局时，我们就使用它；
- Row小部件：之前也用过，当时水平方向布局时，我们就使用它；

- RaiseButton小部件：可以创建一个按钮，并且其中有一个onPress属性是传入一个回调函数，当按钮点击时被回调；

### 1.2.2. 创建StatefulWidget

下面我们来看看代码实现：

- 因为当点击按钮时，数字会发生变化，所以我们需要使用一个StatefulWidget，所以我们需要创建两个类；

- MyCounterWidget继承自StatefulWidget，里面需要实现createState方法；
- MyCounterState继承自State，里面实现build方法，并且可以定义一些成员变量；

```dart
class MyCounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // 将创建的State返回
    return MyCounterState();
  }
}

class MyCounterState extends State<MyCounterWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("当前计数：$counter", style: TextStyle(fontSize: 30),),
    );
  }
}
```

### 1.2.3. 实现按钮的布局

```dart
class MyCounterState extends State<MyCounterWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.redAccent,
                child: Text("+1", style: TextStyle(fontSize: 18, color: Colors.white),),
                onPressed: () {

                },
              ),
              RaisedButton(
                color: Colors.orangeAccent,
                child: Text("-1", style: TextStyle(fontSize: 18, color: Colors.white),),
                onPressed: () {

                },
              )
            ],
          ),
          Text("当前计数：$counter", style: TextStyle(fontSize: 30),)
        ],
      ),
    );
  }
}
```

### 1.2.4. 按钮点击状态改变

我们现在要监听状态的改变，当状态改变时要修改counter变量：

- 但是，直接修改变量可以改变界面吗？不可以。
- 这是因为Flutter并不知道我们的数据发生了改变，需要来重新构建我们界面中的Widget；

如何可以让Flutter知道我们的状态发生改变了，重新构建我们的Widget呢？

- 我们需要调用一个State中默认给我们提供的setState方法；
- 可以在其中的回调函数中修改我们的变量；

```dart
onPressed: () {
  setState(() {
    counter++;
  });
},
```

这样就可以实现想要的效果了：

## 1.3. StatefulWidget生命周期

### 1.3.1. 生命周期的理解

什么是生命周期呢？

- 客户端开发：iOS开发中我们需要知道UIViewController从创建到销毁的整个过程，Android开发中我们需要知道Activity从创建到销毁的整个过程。以便在不同的生命周期方法中完成不同的操作；

- 前端开发中：Vue、React开发中组件也都有自己的生命周期，在不同的生命周期中我们可以做不同的操作；

Flutter小部件的生命周期：

- StatelessWidget可以由父Widget直接传入值，调用build方法来构建，整个过程非常简单；
- 而StatefulWidget需要通过State来管理其数据，并且还要监控状态的改变决定是否重新build整个Widget；

- 所以，我们主要讨论StatefulWidget的生命周期，也就是它从创建到销毁的整个过程；

### 1.3.2. 生命周期的简单版

```
在这个版本中，我讲解那些常用的方法和回调，下一个版本中我解释一些比较复杂的方法和回调
```

那么StatefulWidget有哪些生命周期的回调呢？它们分别在什么情况下执行呢？

- 在下图中，灰色部分的内容是Flutter内部操作的，我们并不需要手动去设置它们；
- 白色部分表示我们可以去监听到或者可以手动调用的方法；

我们知道StatefulWidget本身由两个类组成的：`StatefulWidget`和`State`，我们分开进行分析

![在这里插入图片描述](https://img-blog.csdnimg.cn/20200423170902175.jpeg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3pob25nYWQwMDc=,size_16,color_FFFFFF,t_70)

首先，执行**StatefulWidget**中相关的方法：

- 1、执行StatefulWidget的构造函数（Constructor）来创建出StatefulWidget；

- 2、执行StatefulWidget的createState方法，来创建一个维护StatefulWidget的State对象；

其次，调用createState创建State对象时，执行State类的相关方法：

1、执行State类的构造方法（Constructor）来创建State对象；

2、执行initState，我们通常会在这个方法中执行一些数据初始化的操作，或者也可能会发送网络请求；

- 注意：这个方法是重写父类的方法，必须调用super，因为父类中会进行一些其他操作；

- 并且如果你阅读源码，你会发现这里有一个注解（annotation）：`@mustCallSuper`

3、执行didChangeDependencies方法，这个方法在两种情况下会调用

- 情况一：调用initState会调用；
- 情况二：从其他对象中依赖一些数据发生改变时，比如前面我们提到的InheritedWidget（这个后面会讲到）；

4、Flutter执行build方法，来看一下我们当前的Widget需要渲染哪些Widget；

5、当前的Widget不再使用时，会调用dispose进行销毁；

6、手动调用setState方法，会根据最新的状态（数据）来重新调用build方法，构建对应的Widgets；

7、执行didUpdateWidget方法是在当父Widget触发重建（rebuild）时，系统会调用didUpdateWidget方法；

我们来通过代码进行演示：

```dart
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("HelloWorld"),
        ),
        body: HomeBody(),
      ),
    );
  }
}


class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("HomeBody build");
    return MyCounterWidget();
  }
}


class MyCounterWidget extends StatefulWidget {
  
  MyCounterWidget() {
    print("执行了MyCounterWidget的构造方法");
  }
  
  @override
  State<StatefulWidget> createState() {
    // 将创建的State返回
    return MyCounterState();
  }
}

class MyCounterState extends State<MyCounterWidget> {
  int counter = 0;
  
  MyCounterState() {
    print("执行MyCounterState的构造方法");
  }

  @override
  void initState() {
    super.initState();
    print("执行MyCounterState的init方法");
  }
  
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("执行MyCounterState的didChangeDependencies方法");
  }

  @override
  Widget build(BuildContext context) {
    print("执行执行MyCounterState的build方法");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.redAccent,
                child: Text("+1", style: TextStyle(fontSize: 18, color: Colors.white),),
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
              ),
              RaisedButton(
                color: Colors.orangeAccent,
                child: Text("-1", style: TextStyle(fontSize: 18, color: Colors.white),),
                onPressed: () {
                  setState(() {
                    counter--;
                  });
                },
              )
            ],
          ),
          Text("当前计数：$counter", style: TextStyle(fontSize: 30),)
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(MyCounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("执行MyCounterState的didUpdateWidget方法");
  }

  @override
  void dispose() {
    super.dispose();
    print("执行MyCounterState的dispose方法");
  }
}
```

打印结果如下：

```dart
flutter: HomeBody build
flutter: 执行了MyCounterWidget的构造方法
flutter: 执行了MyCounterWidget的createState方法
flutter: 执行MyCounterState的构造方法
flutter: 执行MyCounterState的init方法
flutter: 执行MyCounterState的didChangeDependencies方法
flutter: 执行执行MyCounterState的build方法

// 注意：Flutter会build所有的组件两次（查了GitHub、Stack Overflow，目前没查到原因）
flutter: HomeBody build
flutter: 执行了MyCounterWidget的构造方法
flutter: 执行MyCounterState的didUpdateWidget方法
flutter: 执行执行MyCounterState的build方法
```

当我们改变状态，手动执行setState方法后会打印如下结果：

```dart
flutter: 执行执行MyCounterState的build方法
```

### 1.3.3. 生命周期的复杂版（选读）

我们来学习几个前面生命周期图中提到的属性，但是没有详细讲解的

1、mounted是State内部设置的一个属性，事实上我们不了解它也可以，但是如果你想深入了解它，会对State的机制理解更加清晰；

- 很多资料没有提到这个属性，但是我这里把它列出来，是内部设置的，不需要我们手动进行修改；

2、dirty state的含义是脏的State

- 它实际是通过一个Element的东西（我们还没有讲到Flutter绘制原理）的属性来标记的；
- 将它标记为dirty会等待下一次的重绘检查，强制调用build方法来构建我们的Widget；
- 有机会我专门写一篇关于StatelessWidget和StatefulWidget的区别，讲解一些它们开发中的选择问题）；

clean state的含义是干净的State

- 它表示当前build出来的Widget，下一次重绘检查时不需要重新build；

# 二. Flutter的编程范式

## 2.1. 编程范式的理解

**编程范式**对于初学编程的人来说是一个虚无缥缈的东西，但是却是我们日常开发中都在默认遵循的**一些模式和方法**；

比如我们最为熟悉的 面向对象编程就是一种编程范式，与之对应或者结合开发的包括：面向过程编程、函数式编程、面向协议编程；

另外还有两个对应的编程范式：命令式编程 和 声明式编程

-  命令式编程非常好理解，就是一步步给计算机命令，告诉它我们想做什么事情；
- **声明式编程：** 声明式编程通常是描述目标的性质，你应该是什么样的，依赖哪些状态，并且当依赖的状态发生改变时，我们通过某些方式通知目标作出相应；

上面的描述还是太笼统了，我们来看一些具体点的例子；

## 2.3. Flutter的编程范式

从2009年开始（数据来自维基百科），声明式编程就开始流行起来，并且目前在Vue、React、包括iOS中的SwiftUI中以及Flutter目前都采用了声明式编程。

现在我们来开发一个需求：显示一个Hello World，之后又修改成了Hello Flutter

如果是传统的命令式编程，我们开发Flutter的模式很可能是这样的：（注意是想象中的伪代码）

- 整个过程，我们需要一步步告诉Flutter它需要做什么；

```dart
final text = new Text();
var title = "Hello World";
text.setContent(title);

// 修改数据
title = "Hello Flutter";
text.setContent(title);
```

如果是声明式编程，我们通常会维护一套数据集：

- 这个数据集可能来自己父类、来自自身State管理、来自InheritedWidget、来自统一的状态管理的地方；
- 总之，我们知道有这么一个数据集，并且告诉Flutter这些数据集在哪里使用；

```dart
var title = "Hello World";

Text(title); // 告诉Text内部显示的是title

// 数据改变
title = "Hello Flutter";
setState(() => null); // 通知重新build Widget即可
```

# 一. 文本Widget

在Android中，我们使用TextView，iOS中我们使用UILabel来显示文本；

Flutter中，我们使用Text组件控制文本如何展示；

## 1.1. 普通文本展示

在Flutter中，我们可以将文本的控制显示分成两类：

- **控制文本布局的参数：** 如文本对齐方式 textAlign、文本排版方向 textDirection，文本显示最大行数 maxLines、文本截断规则 overflow 等等，这些都是构造函数中的参数；
- **控制文本样式的参数：** 如字体名称 fontFamily、字体大小 fontSize、文本颜色 color、文本阴影 shadows 等等，这些参数被统一封装到了构造函数中的参数 style 中；

下面我们来看一下其中一些属性的使用：

```dart
	class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "《定风波》 苏轼 \n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
      style: TextStyle(
        fontSize: 20,
        color: Colors.purple
      ),
    );
  }
}
```

我们可以通过一些属性来改变Text的布局：

- textAlign：文本对齐方式，比如TextAlign.center
- maxLines：最大显示行数，比如1
- overflow：超出部分显示方式，比如TextOverflow.ellipsis
- textScaleFactor：控制文本缩放，比如1.24

代码如下：

```dart
class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "《定风波》 苏轼 \n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
      textAlign: TextAlign.center, // 所有内容都居中对齐
      maxLines: 3, // 显然 "生。" 被删除了
      overflow: TextOverflow.ellipsis, // 超出部分显示...
//      textScaleFactor: 1.25,
      style: TextStyle(
        fontSize: 20,
        color: Colors.purple
      ),
    );
  }
}
```

## 1.2. 富文本展示

前面展示的文本，我们都应用了相同的样式，如果我们希望给他们不同的样式呢？

- 比如《定风波》我希望字体更大一点，并且是黑色字体，并且有加粗效果；
- 比如 苏轼 我希望是红色字体；

如果希望展示这种混合样式，那么我们可以利用分片来进行操作（在Android中，我们可以使用SpannableString，在iOS中，我们可以使用NSAttributedString完成，了解即可）

代码如下：

```dart
class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "《定风波》", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
          TextSpan(text: "苏轼", style: TextStyle(fontSize: 18, color: Colors.redAccent)),
          TextSpan(text: "\n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。")
        ],
      ),
      style: TextStyle(fontSize: 20, color: Colors.purple),
      textAlign: TextAlign.center,
    );
  }
}
```

# 二. 按钮Widget

## 2.1. 按钮的基础

Material widget库中提供了多种按钮Widget如FloatingActionButton、RaisedButton、FlatButton、OutlineButton等

我们直接来对他们进行一个展示：

```dart
class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FloatingActionButton(
          child: Text("FloatingActionButton"),
          onPressed: () {
            print("FloatingActionButton Click");
          },
        ),
        RaisedButton(
          child: Text("RaisedButton"),
          onPressed: () {
            print("RaisedButton Click");
          },
        ),
        FlatButton(
          child: Text("FlatButton"),
          onPressed: () {
            print("FlatButton Click");
          },
        ),
        OutlineButton(
          child: Text("OutlineButton"),
          onPressed: () {
            print("OutlineButton Click");
          },
        )
      ],
    );
  }
}
```

## 2.2. 自定义样式

前面的按钮我们使用的都是默认样式，我们可以通过一些属性来改变按钮的样式

```dart
RaisedButton(
  child: Text("同意协议", style: TextStyle(color: Colors.white)),
  color: Colors.orange, // 按钮的颜色
  highlightColor: Colors.orange[700], // 按下去高亮颜色
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // 圆角的实现
  onPressed: () {
    print("同意协议");
  },
)
```

事实上这里还有一个比较常见的属性：elevation，用于控制阴影的大小，很多地方都会有这个属性，大家可以自行演示一下

# 三. 图片Widget

图片可以让我们的应用更加丰富多彩，Flutter中使用Image组件

Image组件有很多的构造函数，我们这里主要学习两个：

- Image.assets：加载本地资源图片；
- Image.network：加载网络中的图片；

## 3.1. 加载网络图片

相对来讲，Flutter中加载网络图片会更加简单，直接传入URL并不需要什么配置，所以我们先来看一下Flutter中如何加载网络图片。

我们先来看看Image有哪些属性可以设置：

```dart
const Image({
  ...
  this.width, //图片的宽
  this.height, //图片高度
  this.color, //图片的混合色值
  this.colorBlendMode, //混合模式
  this.fit,//缩放模式
  this.alignment = Alignment.center, //对齐方式
  this.repeat = ImageRepeat.noRepeat, //重复方式
  ...
})
```

- `width`、`height`：用于设置图片的宽、高，当不指定宽高时，图片会根据当前父容器的限制，尽可能的显示其原始大小，如果只设置`width`、`height`的其中一个，那么另一个属性默认会按比例缩放，但可以通过下面介绍的`fit`属性来指定适应规则。
- `fit`：该属性用于在图片的显示空间和图片本身大小不同时指定图片的适应模式。适应模式是在BoxFit中定义，它是一个枚举类型，有如下值：

`fill`：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。

- `cover`：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。
- `contain`：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。
- `fitWidth`：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
- `fitHeight`：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。

- - `none`：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。
- `color`和 `colorBlendMode`：在图片绘制时可以对每一个像素进行颜色混合处理，`color`指定混合色，而`colorBlendMode`指定混合模式；
- `repeat`：当图片本身大小小于显示空间时，指定图片的重复规则。

我们对其中某些属性做一个演练：

- 注意，这里我用了一个Container，大家可以把它理解成一个UIView或者View，就是一个容器；
- 后面我会专门讲到这个组件的使用；

```dart
class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
```

## 3.2. 加载本地图片

加载本地图片稍微麻烦一点，需要将图片引入，并且进行配置

```dart
class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: Colors.yellow,
        child: Image.asset("images/test.jpeg"),
      ),
    );
  }
}
```

## 3.3. 实现圆角图像

> 在Flutter中实现圆角效果也是使用一些Widget来实现的。

### 3.3.1. 实现圆角头像

**方式一：CircleAvatar**

CircleAvatar可以实现圆角头像，也可以添加一个子Widget：

```dart
const CircleAvatar({
  Key key,
  this.child, // 子Widget
  this.backgroundColor, // 背景颜色
  this.backgroundImage, // 背景图像
  this.foregroundColor, // 前景颜色
  this.radius, // 半径
  this.minRadius, // 最小半径
  this.maxRadius, // 最大半径
})
```

我们来实现一个圆形头像：

- 注意一：这里我们使用的是NetworkImage，因为backgroundImage要求我们传入一个ImageProvider；
  - ImageProvider是一个抽象类，事实上所有我们前面创建的Image对象都有包含`image`属性，该属性就是一个ImageProvider
- 注意二：这里我还在里面添加了一个文字，但是我在文字外层包裹了一个Container；
  - 这里Container的作用是为了可以控制文字在其中的位置调整；

```dart
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 100,
        backgroundImage: NetworkImage("https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg"),
        child: Container(
          alignment: Alignment(0, .5),
          width: 200,
          height: 200,
          child: Text("兵长利威尔")
        ),
      ),
    );
  }
}
```

**方式二：ClipOval**

ClipOval也可以实现圆角头像，而且通常是在只有头像时使用

```dart
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.network(
          "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
```

**实现方式三：Container + BoxDecoration**

这种方式我们放在讲解[Container](https://so.csdn.net/so/search?q=Container&spm=1001.2101.3001.7020)时来讲这种方式

### 3.3.2. 实现圆角图片

**方式一：ClipRRect**

ClipRRect用于实现圆角效果，可以设置圆角的大小。

实现代码如下，非常简单：

```dart
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
```

**方式二：Container+BoxDecoration**

这个也放到后面讲解Container时讲解

# 四. [表单](https://so.csdn.net/so/search?q=表单&spm=1001.2101.3001.7020)Widget

> 和用户交互的其中一种就是输入框，比如注册、登录、搜索，我们收集用户输入的内容将其提交到服务器。

## 4.1. TextField的使用

### 4.1.1. TextField的介绍

TextField用于接收用户的文本输入，它提供了非常多的属性，我们来看一下源码：

- 但是我们没必要一个个去学习，很多时候用到某个功能时去查看是否包含某个属性即可

```dart
const TextField({
  Key key,
  this.controller,
  this.focusNode,
  this.decoration = const InputDecoration(),
  TextInputType keyboardType,
  this.textInputAction,
  this.textCapitalization = TextCapitalization.none,
  this.style,
  this.strutStyle,
  this.textAlign = TextAlign.start,
  this.textAlignVertical,
  this.textDirection,
  this.readOnly = false,
  ToolbarOptions toolbarOptions,
  this.showCursor,
  this.autofocus = false,
  this.obscureText = false,
  this.autocorrect = true,
  this.maxLines = 1,
  this.minLines,
  this.expands = false,
  this.maxLength,
  this.maxLengthEnforced = true,
  this.onChanged,
  this.onEditingComplete,
  this.onSubmitted,
  this.inputFormatters,
  this.enabled,
  this.cursorWidth = 2.0,
  this.cursorRadius,
  this.cursorColor,
  this.keyboardAppearance,
  this.scrollPadding = const EdgeInsets.all(20.0),
  this.dragStartBehavior = DragStartBehavior.start,
  this.enableInteractiveSelection = true,
  this.onTap,
  this.buildCounter,
  this.scrollController,
  this.scrollPhysics,
})
```

我们来学习几个比较常见的属性：

- 一些属性比较简单：keyboardType键盘的类型，style设置样式，textAlign文本对齐方式，maxLength最大显示行数等等；
- decoration：用于设置输入框相关的样式
- icon：设置左边显示的图标
- labelText：在输入框上面显示一个提示的文本
- hintText：显示提示的占位文字
- border：输入框的边框，默认底部有一个边框，可以通过InputBorder.none删除掉
- filled：是否填充输入框，默认为false
- fillColor：输入框填充的颜色
- controller：
- onChanged：监听输入框内容的改变，传入一个回调函数
- onSubmitted：点击键盘中右下角的down时，会回调的一个函数

### 4.1.2. TextField的样式以及监听

我们来演示一下TextField的decoration属性以及监听：

```dart
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFieldDemo()
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        icon: Icon(Icons.people),
        labelText: "username",
        hintText: "请输入用户名",
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.lightGreen
      ),
      onChanged: (value) {
        print("onChanged:$value");
      },
      onSubmitted: (value) {
        print("onSubmitted:$value");
      },
    );
  }
}
```

### 4.1.3. TextField的controller

我们可以给TextField添加一个控制器（Controller），可以使用它设置文本的初始值，也可以使用它来监听文本的改变；

事实上，如果我们没有为TextField提供一个Controller，那么会Flutter会默认创建一个TextEditingController的，这个结论可以通过阅读源码得到：

```dart
@override
  void initState() {
    super.initState();
    // ...其他代码
    if (widget.controller == null)
      _controller = TextEditingController();
  }
```

我们也可以自己来创建一个Controller控制一些内容：

```dart
class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // 1.设置默认值
    textEditingController.text = "Hello World";

    // 2.监听文本框
    textEditingController.addListener(() {
      print("textEditingController:${textEditingController.text}");
    });
  }
	
  // ...省略build方法
}
```

## 4.2. Form表单的使用

> 在我们开发注册、登录页面时，通常会有多个表单需要同时获取内容或者进行一些验证，如果对每一个TextField都分别进行验证，是一件比较麻烦的事情。
>
> 做过前端的开发知道，我们可以将多个input标签放在一个form里面，Flutter也借鉴了这样的思想：我们可以通过Form对输入框进行分组，统一进行一些操作。

### 4.2.1. Form表单的基本使用

Form表单也是一个Widget，可以在里面放入我们的输入框。

但是Form表单中输入框必须是FormField类型的

- 我们查看刚刚学过的TextField是继承自StatefulWidget，并不是一个FormField类型；
- 我们可以使用TextFormField，它的使用类似于TextField，并且是继承自FormField的；

我们通过Form的包裹，来实现一个注册的页面：

```dart
class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.people),
              labelText: "用户名或手机号"
            ),
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: "密码"
            ),
          ),
          SizedBox(height: 16,),
          Container(
            width: double.infinity,
            height: 44,
            child: RaisedButton(
              color: Colors.lightGreen,
              child: Text("注 册", style: TextStyle(fontSize: 20, color: Colors.white),),
              onPressed: () {
                print("点击了注册按钮");
              },
            ),
          )
        ],
      ),
    );
  }
}
```

### 4.2.2. 保存和获取表单数据

有了表单后，我们需要在点击注册时，可以同时获取和保存表单中的数据，怎么可以做到呢？

- 1、需要监听注册按钮的点击，在之前我们已经监听的onPressed传入的回调中来做即可。（当然，如果嵌套太多，我们待会儿可以将它抽取到一个单独的方法中）
- 2、监听到按钮点击时，同时获取`用户名`和`密码`的表单信息。

如何同时获取`用户名`和`密码`的表单信息？

- 如果我们调用`Form`的`State对象`的save方法，就会调用Form中放入的TextFormField的onSave回调：

```dart
TextFormField(
  decoration: InputDecoration(
    icon: Icon(Icons.people),
    labelText: "用户名或手机号"
  ),
  onSaved: (value) {
    print("用户名：$value");
  },
),
```

- 但是，我们有没有办法可以在点击按钮时，拿到 Form对象 来调用它的save方法呢？

**知识点：在Flutter如何可以获取一个通过一个引用获取一个StatefulWidget的State对象呢？**

答案：通过绑定一个GlobalKey即可。

案例代码演练：

```dart
class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;

  void registerForm() {
    registerFormKey.currentState.save();

    print("username:$username password:$password");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.people),
              labelText: "用户名或手机号"
            ),
            onSaved: (value) {
              this.username = value;
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: "密码"
            ),
            onSaved: (value) {
              this.password = value;
            },
          ),
          SizedBox(height: 16,),
          Container(
            width: double.infinity,
            height: 44,
            child: RaisedButton(
              color: Colors.lightGreen,
              child: Text("注 册", style: TextStyle(fontSize: 20, color: Colors.white),),
              onPressed: registerForm,
            ),
          )
        ],
      ),
    );
  }
}
```

### 4.2.3. 验证填写的表单数据

在表单中，我们可以添加`验证器`，如果不符合某些特定的规则，那么给用户一定的提示信息

比如我们需要账号和密码有这样的规则：账号和密码都不能为空。

按照如下步骤就可以完成整个验证过程：

- 1、为TextFormField添加validator的回调函数；
- 2、调用Form的State对象的validate方法，就会回调validator传入的函数；

也可以为TextFormField添加一个属性：autovalidate

- 不需要调用validate方法，会自动验证是否符合要求；

# 五、Align-Padding-Container

## 5.1 Align

```dart
Container(
  color: Colors.black26,
  child: Align(
    // (x, y), 单位1 分别代表长/宽的一半
    alignment: Alignment(-0.5, 2),
    widthFactor: 5, // 子类尺寸宽度的五倍
    heightFactor: 2, // 子类尺寸高度的两倍
    child: Icon(
      Icons.pets,
      size: 50,
    ),
  ),
);
```

- alignment

![image-20220428103429224](/Users/luobo/Library/Application Support/typora-user-images/image-20220428103429224.png)

## 5.2 Padding

```dart
Column(
  children: <Widget>[
    Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        "你好啊,李银河",
        style: TextStyle(fontSize: 30, backgroundColor: Colors.red),
      ),
    ),
    Container(
      color: Colors.green,
      child: Text(
        "你好啊, Flutter",
        style: TextStyle(fontSize: 30, backgroundColor: Colors.red),
      ),
    ),
  ],
);
```

## 5.3 Container

**注意:**

- 如果Container设置了alignment属性, 那么Container的子类就是Align
- 如果Container没有设置alignment属性, 那么Container的子类就是child属性的Widget
- Container中的build方法中有这么一句话

```dart
Widget current = child;
// ...
if (alignment != null)
      current = Align(alignment: alignment, child: current);
```

- Container

```dart
Container(
// color: Colors.red,
  width: 200,
  height: 200,
  alignment: Alignment.center,
  child: Text("Hello World"),
// transform: Matrix4.rotationZ(145),
  decoration: BoxDecoration(
    // decoration的color和Container的color不能同时设置
      color: Colors.green,
      border: Border.all(
          width: 5,
          color: Colors.red
      ),
      borderRadius: BorderRadius.circular(100),
      boxShadow: [
        BoxShadow(color: Colors.orange, offset: Offset(10, 10), spreadRadius: 5, blurRadius: 10),
        BoxShadow(color: Colors.lightBlueAccent, offset: Offset(-10, -10), spreadRadius: 5, blurRadius: 10),
      ]
  ),
);
```

> Flutter将布局组件分成了 单子布局组件（Single-child layout widgets） 和 多子布局组件（Multi-child layout widgets）

# 一. 单子布局组件

> 单子布局组件的含义是其只有一个子组件，可以通过设置一些属性设置该子组件所在的位置信息等。
>
> 比较常用的单子布局组件有：Align、Center、Padding、Container。

## 1.1. Align组件

### 1.1.1. Align介绍

> 看到`Align`这个词，我们就知道它有我们的对齐方式有关。
>
> 在其他端的开发中（iOS、Android、前端）Align通常只是一个属性而已，但是Flutter中Align也是一个组件。

我们可以通过源码来看一下Align有哪些属性：

```dart
const Align({
  Key key,
  this.alignment: Alignment.center, // 对齐方式，默认居中对齐
  this.widthFactor, // 宽度因子，不设置的情况，会尽可能大
  this.heightFactor, // 高度因子，不设置的情况，会尽可能大
  Widget child // 要布局的子Widget
})
```

这里我们特别解释一下`widthFactor`和`heightFactor`作用：

- 因为子组件在父组件中的对齐方式必须有一个前提，就是父组件得知道自己的范围（宽度和高度）；

- 如果`widthFactor`和`heightFactor`不设置，那么默认Align会尽可能的大（尽可能占据自己所在的父组件）；
- 我们也可以对他们进行设置，比如widthFactor设置为3，那么相对于Align的宽度是子组件跨度的3倍；

### 1.1.2. Align演练

我们简单演练一下Align

```dart
class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Icon(Icons.pets, size: 36, color: Colors.red),
      alignment: Alignment.bottomRight,
      widthFactor: 3,
      heightFactor: 3,
    );
  }
}
```

## 1.2. Center组件

### 1.2.1. Center介绍

Center组件我们在前面已经用过很多次了。

事实上Center组件继承自Align，只是将alignment设置为Alignment.center。

源码分析：

```dart
class Center extends Align {
  const Center({
    Key key,
    double widthFactor,
    double heightFactor,
    Widget child
  }) : super(key: key, widthFactor: widthFactor, heightFactor: heightFactor, child: child);
}
```

### 1.2.2. Center演练

我们将上面的代码Align换成Center

```dart
class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.pets, size: 36, color: Colors.red),
      widthFactor: 3,
      heightFactor: 3,
    );
  }
}
```

## 1.3. Padding组件

### 1.3.1. Padding介绍

> Padding组件在其他端也是一个属性而已，但是在Flutter中是一个Widget，但是Flutter中没有Margin这样一个Widget，这是因为外边距也可以通过Padding来完成。
>
> Padding通常用于设置子Widget到父Widget的边距（你可以称之为是父组件的内边距或子Widget的外边距）。

源码分析：

```dart
const Padding({
  Key key,
  @requiredthis.padding, // EdgeInsetsGeometry类型（抽象类），使用EdgeInsets
  Widget child,
})
```

### 1.3.2. Padding演练

代码演练：

```dart
class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        "莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 18
        ),
      ),
    );
  }
}
```

## 1.4. Container组件

> Container组件类似于其他Android中的View，iOS中的UIView。
>
> 如果你需要一个视图，有一个背景颜色、图像、有固定的尺寸、需要一个边框、圆角等效果，那么就可以使用Container组件。

### 1.4.1. Container介绍

Container在开发中被使用的频率是非常高的，特别是我们经常会将其作为容器组件。

下面我们来看一下Container有哪些属性：

```dart
Container({
  this.alignment,
  this.padding, //容器内补白，属于decoration的装饰范围
  Color color, // 背景色
  Decoration decoration, // 背景装饰
  Decoration foregroundDecoration, //前景装饰
  double width,//容器的宽度
  double height, //容器的高度
  BoxConstraints constraints, //容器大小的限制条件
  this.margin,//容器外补白，不属于decoration的装饰范围
  this.transform, //变换
  this.child,
})
```

大多数属性在介绍其它容器时都已经介绍过了，不再赘述，但有两点需要说明：

- 容器的大小可以通过`width`、`height`属性来指定，也可以通过`constraints`来指定，如果同时存在时，`width`、`height`优先。实际上Container内部会根据`width`、`height`来生成一个`constraints`；

- `color`和`decoration`是互斥的，实际上，当指定color时，Container内会自动创建一个decoration；
- `decoration`属性稍后我们详细学习；

### 1.4.2. Container演练

简单进行一个演示：

```dart
class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromRGBO(3, 3, 255, .5),
        width: 100,
        height: 100,
        child: Icon(Icons.pets, size: 32, color: Colors.white),
      ),
    );
  }
}
```

### 1.4.3. BoxDecoration

Container有一个非常重要的属性 `decoration`：

- 他对应的类型是Decoration类型，但是它是一个抽象类。
- 在开发中，我们经常使用它的实现类BoxDecoration来进行实例化。

BoxDecoration常见属性：

```dart
const BoxDecoration({
    this.color, // 颜色，会和Container中的color属性冲突
    this.image, // 背景图片
    this.border, // 边框，对应类型是Border类型，里面每一个边框使用BorderSide
    this.borderRadius, // 圆角效果
    this.boxShadow, // 阴影效果
    this.gradient, // 渐变效果
    this.backgroundBlendMode, // 背景混合
    this.shape = BoxShape.rectangle, // 形变
  })
```

部分效果演示：

```dart
class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
//        color: Color.fromRGBO(3, 3, 255, .5),
        width: 150,
        height: 150,
        child: Icon(Icons.pets, size: 32, color: Colors.white),
        decoration: BoxDecoration(
          color: Colors.amber, // 背景颜色
          border: Border.all(
            color: Colors.redAccent,
            width: 3,
            style: BorderStyle.solid
          ), // 这里也可以使用Border.all统一设置
//            top: BorderSide(
//              color: Colors.redAccent,
//              width: 3,
//              style: BorderStyle.solid
//            ),
          borderRadius: BorderRadius.circular(20), // 这里也可以使用.only分别设置
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 5),
              color: Colors.purple,
              blurRadius: 5
            )
          ],
//          shape: BoxShape.circle, // 会和borderRadius冲突
          gradient: LinearGradient(
            colors: [
              Colors.green,
              Colors.red
            ]
          )
        ),
      ),
    );
  }
}
```

### 1.4.4. 实现圆角图像

上一个章节我们提到可以通过 `Container+BoxDecoration`来实现圆角图像。

实现代码如下:

```dart
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage("https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg"),
          )
        ),
      ),
    );
  }
}
```

# 二. 多子布局组件

> 在开发中，我们经常需要将多个Widget放在一起进行布局，比如水平方向、垂直方向排列，甚至有时候需要他们进行层叠，比如图片上面放一段文字等；
>
> 这个时候我们需要使用多子布局组件（Multi-child layout widgets）。
>
> 比较常用的多子布局组件是Row、Column、Stack，我们来学习一下他们的使用。

## 2.1. Flex组件

事实上，我们即将学习的Row组件和Column组件都继承自Flex组件。

- Flex组件和Row、Column属性主要的区别就是多一个direction。
- 当direction的值为Axis.horizontal的时候，则是Row。
- 当direction的值为Axis.vertical的时候，则是Column。

在学习Row和Column之前，我们先学习主轴和交叉轴的概念。

因为Row是一行排布，Column是一列排布，那么它们都存在两个方向，并且两个Widget排列的方向应该是对立的。

它们之中都有主轴（MainAxis）和交叉轴（CrossAxis）的概念：

- 对于Row来说，主轴（MainAxis）和交叉轴（CrossAxis）分别是下图
- 对于Column来说，主轴（MainAxis）和交叉轴（CrossAxis）分别是下图

## 2.1. Row组件

### 2.1.1. Row介绍

> Row组件用于将所有的子Widget排成一行，实际上这种布局应该是借鉴于Web的Flex布局。
>
> 如果熟悉Flex布局，会发现非常简单。

从源码中查看Row的属性：

```dart
Row({
  Key key,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start, // 主轴对齐方式
  MainAxisSize mainAxisSize = MainAxisSize.max, // 水平方向尽可能大
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center, // 交叉处对齐方式
  TextDirection textDirection, // 水平方向子widget的布局顺序（默认为系统当前Locale环境的文本方向(如中文、英语都是从左往右，而阿拉伯语是从右往左））
  VerticalDirection verticalDirection = VerticalDirection.down, // 表示Row纵轴（垂直）的对齐方向
  TextBaseline textBaseline, // 如果上面是baseline对齐方式，那么选择什么模式（有两种可选）
  List<Widget> children = const <Widget>[],
})
```

**部分属性详细解析：（不过文字是真的难描述，后续推出视频学习较差）**

**mainAxisSize**：

- 表示Row在主轴(水平)方向占用的空间，默认是`MainAxisSize.max`，表示尽可能多的占用水平方向的空间，此时无论子widgets实际占用多少水平空间，Row的宽度始终等于水平方向的最大宽度

- 而`MainAxisSize.min`表示尽可能少的占用水平空间，当子widgets没有占满水平剩余空间，则Row的实际宽度等于所有子widgets占用的的水平空间；

**mainAxisAlignment**：表示子Widgets在Row所占用的水平空间内对齐方式

- 如果mainAxisSize值为`MainAxisSize.min`，则此属性无意义，因为子widgets的宽度等于Row的宽度

- 只有当mainAxisSize的值为`MainAxisSize.max`时，此属性才有意义
- `MainAxisAlignment.start`表示沿textDirection的初始方向对齐，

- 如textDirection取值为`TextDirection.ltr`时，则`MainAxisAlignment.start`表示左对齐，textDirection取值为`TextDirection.rtl`时表示从右对齐。

- 而`MainAxisAlignment.end`和`MainAxisAlignment.start`正好相反；
- MainAxisAlignment.center表示居中对齐。

**crossAxisAlignment**：表示子Widgets在纵轴方向的对齐方式

- Row的高度等于子Widgets中最高的子元素高度

- 它的取值和MainAxisAlignment一样(包含`start`、`end`、 `center`三个值)
- 不同的是crossAxisAlignment的参考系是verticalDirection，即verticalDirection值为`VerticalDirection.down`时`crossAxisAlignment.start`指顶部对齐，verticalDirection值为`VerticalDirection.up`时，`crossAxisAlignment.start`指底部对齐；而`crossAxisAlignment.end`和`crossAxisAlignment.start`正好相反；

### 2.1.2. Row演练

我们来对部分属性进行简单的代码演练，其他一些属性大家自己学习一下

```dart
class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(color: Colors.red, width: 60, height: 60),
        Container(color: Colors.blue, width: 80, height: 80),
        Container(color: Colors.green, width: 70, height: 70),
        Container(color: Colors.orange, width: 100, height: 100),
      ],
    );
  }
}
```

### 2.1.3. mainAxisSize

默认情况下，Row会尽可能占据多的宽度，让子Widget在其中进行排布，这是因为mainAxisSize属性默认值是MainAxisSize.max。

我们来看一下，如果这个值被修改为MainAxisSize.max会什么变化：

### 2.1.4. TextBaseline

关于TextBaseline的取值解析

![image-20220429141714414](/Users/luobo/Library/Application Support/typora-user-images/image-20220429141714414.png)

ideographic: 以汉字为基线

alphabetic: 以字母为基线

line-height(行高): 是指bottom到top的距离

text-height(文本的高度): 文字的高度

行距: (行高 - 文本的高度) / 2

### 2.1.5. Expanded

如果我们希望红色和黄色的Container Widget不要设置固定的宽度，而是占据剩余的部分，这个时候应该如何处理呢？

这个时候我们可以使用 `Expanded` 来包裹 Container Widget，并且将它的宽度不设置值；

- flex属性，弹性系数，Row会根据两个Expanded的弹性系数来决定它们占据剩下空间的比例

```dart
class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(color: Colors.red, height: 60),
        ),
        Container(color: Colors.blue, width: 80, height: 80),
        Container(color: Colors.green, width: 70, height: 70),
        Expanded(
          flex: 1,
          child: Container(color: Colors.orange, height: 100),
        )
      ],
    );
  }
}
```

## 2.2. Column组件

> Column组件用于将所有的子Widget排成一列，学会了前面的Row后，Column只是和row的方向不同而已。

### 2.2.1. Column介绍

我们直接看它的源码：我们发现和Row属性是一致的，不再解释	

```dart
 Column({
    Key key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline textBaseline,
    List<Widget> children = const <Widget>[],
  })
```

### 2.2.2. Column演练

我们直接将Row的代码中Row改为Column，查看代码运行效果：

**注意**

- `Column的宽度是由子Widget的最大宽度决定的`
- Column的所有子Widget必须有一个`明确的高度`, 不然就会报`hasSize`的错误

```dart
class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(color: Colors.red, width: 60),
        ),
        Container(color: Colors.blue, width: 80, height: 80),
        Container(color: Colors.green, width: 70, height: 70),
        Expanded(
          flex: 1,
          child: Container(color: Colors.orange, width: 100),
        )
      ],
    );
  }
}
```

## 2.3. Stack组件

> 在开发中，我们多个组件很有可能需要重叠显示，比如在一张图片上显示文字或者一个按钮等。
>
> 在Android中可以使用Frame来实现，在Web端可以使用绝对定位，在Flutter中我们需要使用层叠布局Stack。

### 2.3.1. Stack介绍

我们还是通过源码来看一下Stack有哪些属性：

```dart
Stack({
  Key key,
  this.alignment = AlignmentDirectional.topStart,
  this.textDirection,
  this.fit = StackFit.loose,
  this.overflow = Overflow.clip,
  List<Widget> children = const <Widget>[],
})
```

参数解析：

- **alignment**：此参数决定如何去对齐**没有定位**（没有使用Positioned）或部分定位的子widget。所谓部分定位，在这里**特指没有在某一个轴上定位**. left、right为横轴，top、bottom为纵轴，只要包含某个轴上的一个定位属性就算在该轴上有定位。
- **textDirection**：和Row、Wrap的textDirection功能一样，都用于决定alignment对齐的参考系即：textDirection的值为`TextDirection.ltr`，则alignment的`start`代表左，`end`代表右；textDirection的值为`TextDirection.rtl`，则alignment的`start`代表右，`end`代表左。

- **fit**：此参数用于决定 **没有定位** 的子widget如何去适应Stack的大小。`StackFit.loose`表示使用子widget的大小，`StackFit.expand`表示扩伸到Stack的大小。

- **overflow**：此属性决定如何显示超出Stack显示空间的子widget，值为`Overflow.clip`时，超出部分会被剪裁（隐藏），值为`Overflow.visible` 时则不会。

### 2.3.2. Stack演练

Stack会经常和Positioned一起来使用，Positioned可以决定组件在Stack中的位置，用于实现类似于Web中的绝对定位效果。

我们来看一个简单的演练：

```dart
class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.purple,
          width: 300,
          height: 300,
        ),
        Positioned(
          left: 20,
          top: 20,
          child: Icon(Icons.favorite, size: 50, color: Colors.white)
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Text("你好啊，李银河", style: TextStyle(fontSize: 20, color: Colors.white)),
        )
      ],
    );
  }
}
```

**注意:** Positioned组件只能在Stack中使用。
