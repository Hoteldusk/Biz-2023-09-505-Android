import 'package:dart_hello/module_01.dart';

void main(List<String> arguments) {
  var num1 = 30;
  var num2 = 40;
  var korea = "대한민국";
  var nums = [2, 2, 34, 5, 23, 4, 24, 23, 43, 2];

  print(nations(korea));
  var result = addNums(num1, num2);
  print("결과 : $result");

  result = sumNums(nums);
  print("결과 : $result");
}
