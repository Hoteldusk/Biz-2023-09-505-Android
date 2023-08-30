import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My App",
          ),
        ),
        body: ListView(
          children: [
            Image.asset(
              "images/title_image.jpg",
              height: 250,
              fit: BoxFit.cover,
            ),
            titleSection,
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            textSection(),
          ],
        ),
      ),
    );
  }

  /// 컨테이너 위젯
  /// Container : padding, margin 을 부여하는 box
  /// Expanded : 부모 box를 가득 채우는 구조의 box
  /// Padding : padding 을 기본값으로 갖는 box

  /// 위젯 변수 선언하기
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              child: const Text(
                "안녕하세요",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(
              "우리나라 자랑",
              style: TextStyle(color: Color(0xffAAAAAA)),
            )
          ],
        )),
        const Icon(
          Icons.favorite,
          color: Colors.red,
          size: 25,
        ),
        const Text("50")
      ],
    ),
  );

  // 위젯 함수 선언하기
  Widget textSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      // margin: const EdgeInsets.all(20),
      child: const Text(
        "점심 나가서 먹을것 같아 "
        "점심 나가서 먹을것 같아 "
        "점심 나가서 먹을것 같아 "
        "점심 나가서 먹을것 같아 "
        "점심 나가서 먹을것 같아 "
        "점심 나가서 먹을것 같아 "
        "점심 나가서 먹을것 같아 "
        "점심 나가서 먹을것 같아 ",
        softWrap: true,
      ),
    );
  }

  Widget colMethod() {
    return const Column(
      children: [
        Text(
          "대한민국",
          style: TextStyle(
            fontSize: 30,
            color: Colors.red,
          ),
        ),
        Text(
          "우리나라만세",
          style: TextStyle(
            fontSize: 30,
            color: Colors.orange,
          ),
        ),
        Text(
          "Hello, World!",
          style: TextStyle(
            /// size는 단위가 없다 이 크기는 Pixel Ratio 값을 곱하여 Pixel 로 표현한다
            fontSize: 30,

            /// color 를 지정하면 MaterialApp 에 Theme 을 설정했을경우 실제 컬러와 다르게 보일수 있다
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
