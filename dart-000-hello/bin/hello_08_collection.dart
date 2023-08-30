// List(배열)
var nums = [1, 2, 3, 4, 5, 6, 7, 8, 9];
var nations = ["RoK", "USA", "BRI", "GER"];
List<String> names = ["홍길동", "이몽룡", "성춘향"];
void main(List<String> args) {
  print(nums);
  print(nations);
  nums.add(100);
  nations.add("SWS");
  names.add("임꺽정");

  // List(배열)에서 특정한 값을 제거하기
  nations.remove("USA");
  print(nations);
  // List 의 3번 index 요소를 제거하기
  nations.removeAt(3);
  print(nations);

  print(names.first);
  var result = names.first;
  print(result);

  print(names.last);
  result = names.last;

  print(names.reversed);
  var iter = names.reversed;
  print("$result, $iter");

  names.shuffle();
  print(names);
}
