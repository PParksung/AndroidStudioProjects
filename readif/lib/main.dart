import 'package:flutter/material.dart';
import 'package:readif/bulletin_board_page.dart';
import 'login_page.dart';
import 'main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '동화책 읽기 앱',
      theme: ThemeData(
        fontFamily: 'Nanum',
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/main': (context) => MainPage(),
        '/board': (context) => BulletinBoardPage(),
        // 다른 페이지 라우트 추가 가능
      },
    );
  }
}
