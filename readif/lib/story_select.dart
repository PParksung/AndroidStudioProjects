import 'package:flutter/material.dart';
import 'creative_screen.dart'; // CreativeScreen을 import합니다.

class StorySelectScreen extends StatelessWidget {
  final double bottomPadding;

  StorySelectScreen({this.bottomPadding = 0.0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // 배경 이미지
            Image.asset(
              'assets/story_select.png',
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
            ),
            // 5p 이미지 클릭 영역
            Positioned(
              left: MediaQuery.of(context).size.width * 0.534,  // 적절한 x 위치 조정
              top: MediaQuery.of(context).size.height * 0.036,   // 적절한 y 위치 조정
              width: MediaQuery.of(context).size.width * 0.234,  // 적절한 너비 조정
              height: MediaQuery.of(context).size.height * 0.46, // 적절한 높이 조정
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreativeScreen(imagePath: 'assets/story_5p.png', page: 5)), // 5p 이미지 경로 전달
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2), // 경계선 추가
                  ),
                ),
              ),
            ),
            // 10p 이미지 클릭 영역
            Positioned(
              left: MediaQuery.of(context).size.width * 0.535,  // 적절한 x 위치 조정
              top: MediaQuery.of(context).size.height * 0.518,  // 적절한 y 위치 조정
              width: MediaQuery.of(context).size.width * 0.23,  // 적절한 너비 조정
              height: MediaQuery.of(context).size.height * 0.457, // 적절한 높이 조정
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreativeScreen(imagePath: 'assets/image3.png', page: 10)), // 10p 이미지 경로 전달
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2), // 경계선 추가
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
