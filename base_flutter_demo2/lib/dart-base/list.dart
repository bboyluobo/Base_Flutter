// ignore_for_file: avoid_print
void main(List<String> args) {
  // baseUse();
  // test();
  // traverse();
}

baseUse() {
  List<String> languages = ['Java', 'Dart', 'Python', 'C++', 'Kotlin'];
  print(languages[1]); //Dart 访问索引为0的元素;
  languages.add('JavaScript'); //添加元素
  print(languages.length); //6 数组长度
  languages.removeAt(1); //移除第一个元素
  languages.insert(3, 'PHP'); // 定点插入
  print(languages);
  print(languages.getRange(0, 1)); //获取指定访问的元素
  print(languages.sublist(2, 4)); //截取
  print(languages.join('-'));
  print(languages.isEmpty); //false  获取指定访问的元素是否为空
  print(languages.contains("Ruby")); //false  是否包含
  languages.clear(); //清空
  print(languages);
}

test() {
  List<String> strNum = ['11', '23', '34', '24', '65'];
  print(strNum[0] + strNum[1]);
  var intNum = strNum.map((String str) => int.parse(str)).toList();
  print(intNum[0] + intNum[1]);

  var bigThan30 = intNum.where((int num) => num > 30).toList();
  print(bigThan30);

  var parser = [0, 100, ...intNum, 30];
  print(parser);

  bool flag = bigThan30.length >= 3;
  var chooseLi = [if (!flag) 666, ...parser, if (flag) 555 else 55];
  print(chooseLi);
}

traverse() {
  List<String> colorList = ['red', 'yellow', 'blue', 'green']; //for-i遍历
  for (var i = 0; i < colorList.length; i++) {
    //可以使用var或int
    print(colorList[i]);
  }

  //forEach遍历
  colorList.forEach((color) => print(color)); //forEach的参数为Function. =>使用了箭头函数

  //for-in遍历
  for (var color in colorList) {
    print(color);
  }

  //while+iterator迭代器遍历，类似Java中的iteator
  while (colorList.iterator.moveNext()) {
    print(colorList.iterator.current);
  }
}
