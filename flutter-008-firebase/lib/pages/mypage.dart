import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyPage> {
  final _authUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () async {
          await FirebaseAuth.instance.signOut();
          setState(() {});
        },
        child: Center(
          child: Column(
            children: [
              Text("로그인한 사용자가 ${_authUser!.email}"),
              Text("로그인한 UserId ${_authUser!.uid}"),
            ],
          ),
        ),
      ),
    );
  }
}
