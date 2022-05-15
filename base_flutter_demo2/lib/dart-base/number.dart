void main(List<String> args) {
  num age = 19; //num数据类型
  int height = 190; //int整型
  double weight = 55.5;
  print(height / weight is double);
  print(height / age is double); //两个int类型相除是double类型小数，而不是整除后的整数。
  print(age * height is double);
  print(height ~/ age is double); //注意: 这才是dart整除正确姿势

// 字符串和数字转化
// 1.字符串转数字
  var one = int.parse('111');
  var two = double.parse('12.22');
  print('${one} ${one.runtimeType}'); // 111 int
  print('${two} ${two.runtimeType}'); // 12.22 double

// 2.数字转字符串
  var num1 = 123;
  var num2 = 123.456;
  var num1Str = num1.toString();
  var num2Str = num2.toString();
  var num2StrD = num2.toStringAsFixed(2); // 保留两位小数
  print('${num1Str} ${num1Str.runtimeType}'); // 123 String
  print('${num2Str} ${num2Str.runtimeType}'); // 123.456 String
  print('${num2StrD} ${num2StrD.runtimeType}'); // 123.46 String
}
