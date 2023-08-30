import 'dart:math';

void main(List<String> args) {
  List<int> nums = [];

  // 1 ~ 100 까지 범위의 난수를 만들어 20개의 배열을 생성했다
  for (int i = 0; i < 20; i++) {
    var num = Random().nextInt(100) + 1;
    nums.add(num);
  }

  // 배열에 저장된 요소들중에 소수를 구하여 출력하시오 (플래그 변수사용)
  // List<int> primeNums = [];
  // for (var i = 0; i < nums.length; i++) {
  //   bool isPrime = true;
  //   for (var j = 2; j < nums[i]; j++) {
  //     if (nums[i] % j == 0) {
  //       isPrime = false;
  //       break;
  //     }
  //   }
  //   if (isPrime) {
  //     primeNums.add(nums[i]);
  //   }
  // }

// 배열에 저장된 요소들중에 소수를 구하여 출력하시오 (플래그 변수미사용)
  List<int> primeNums = [];
  for (var i = 0; i < nums.length; i++) {
    var j = 2;
    for (j = 2; j < nums[i]; j++) {
      if (nums[i] % j == 0) {
        break;
      }
    }
    if (j == nums[i]) {
      primeNums.add(nums[i]);
    }
  }

  for (int i = 0; i < primeNums.length; i++) {
    print(primeNums[i]);
  }
}
