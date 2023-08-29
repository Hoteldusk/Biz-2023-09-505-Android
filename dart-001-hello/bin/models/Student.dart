// ignore: file_names
// data 클래스 작성하기
class Student {
  int stNum = 0; // none-nullerble
  String? stName; //null 값이 저장될수 있도록 허용하는 변수
  String? stDept;
  int? stGrade;

// Student ({stNum, stName. stDept, stGrade}) {
//   this.stNum = stNum;
//   this.stName = stName;
//   this.stDept = stDept;
//   this.stGrade = stGrade;

// }
// 아래와 같은 코드를 작성하여 매개변수로 받은 데이터를
// 내부변수 (this.*) 에 setting 하는 코드를 작성한다
// 현재ㅐ버전의 dart 에서는 아래와 같은 단순화된 코드를 작성한다
  Student({this.stNum = 0, this.stName, this.stDept, this.stGrade});

  set setStNum(int num) => stNum = num;
  int get getStNum => stNum;

  @override
  String toString() {
    String str = "이름 : $stName, 학번 : $stNum, 학과 : $stDept, 학년 : $stGrade";
    return str;
  }
}
