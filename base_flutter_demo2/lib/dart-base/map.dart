void main(List<String> args) {
  baseUse();
}

baseUse() {
  Map<String, num> dict = {"a": 1, "b": 30, "c": 70, "price": 40.0};
   print(dict); //{a: 1, b: 30, c: 70, price: 40.0}
  print(dict["price"]); //40.0
  dict["a"] = 2;//修改
  print(dict); //{a: 2, b: 30, c: 70, price: 40.0}
  print(dict.containsKey("price")); //true 是否包含键
  print(dict.containsValue("price")); //false 是否包含值
  print(dict.isEmpty); //false 是否为空
  print(dict.isNotEmpty); //true 是否不为空
  print(dict.length); //4 长度
  dict.remove("c");//移除
  print(dict); //{a: 2, b: 30, price: 40.0}
  print(dict.keys.toList());//[a, b, price] 将键转为数组
  print(dict.values.toList());//[2, 30, 40.0] 将值转为数组

  List<int> numLi = [1, 2, 3, 4, 5];
  List<String> numEN = ["one", "two", "three", "four", "five"];
  List<String> numCN = ["壹", "贰", "叁", "肆", "伍"];
  Map<int, String> mapEN = Map.fromIterables(numLi, numEN);
  Map<int, String> mapCN = Map.fromIterables(numLi, numCN);
  print(mapCN); //{1: 壹, 2: 贰, 3: 叁, 4: 肆, 5: 伍}
  print(mapEN); //{1: 壹, 2: 贰, 3: 叁, 4: 肆, 5: 伍}
  // {1: one, 2: two, 3: three, 4: four, 5: five}
  print(Map.fromIterables(mapEN.values, mapCN.values));
}
