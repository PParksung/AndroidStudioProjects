import 'package:flutter/material.dart';
import 'learning_mode_page.dart';

class StoryLearningIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 화면의 너비와 높이를 가져옴
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // 배경 이미지
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/learning.png'),
                fit: BoxFit.contain, // 비율 유지하여 이미지를 전체 화면에 맞춤
              ),
            ),
          ),
          Positioned(
            left: screenWidth * 0.0627,
            top: screenHeight * 0.901,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: screenWidth * 0.046,
                height: screenHeight * 0.06,
                color: Colors.transparent, // 버튼을 투명하게 설정
              ),
            ),
          ),
          // 기존 '시작' 버튼 위치
          Positioned(
            left: screenWidth * 0.6807, // 상대적인 x 좌표
            top: screenHeight * 0.564,   // 상대적인 y 좌표
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LearningModePage()),
                );
              },
              child: Container(
                width: screenWidth * 0.1267,  // 상대적인 버튼 너비
                height: screenHeight * 0.077, // 상대적인 버튼 높이
                decoration: BoxDecoration(
                  color: Colors.transparent, // 버튼을 투명하게 설정
                ),
              ),
            ),
          ),
          // 새로운 투명 버튼 추가 위치
          Positioned(
            left: screenWidth * 0.1, // 상대적인 x 좌표
            top: screenHeight * 0.789,   // 상대적인 y 좌표
            child: GestureDetector(
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Container(
                width: screenWidth * 0.1267,  // 상대적인 버튼 너비
                height: screenHeight * 0.077, // 상대적인 버튼 높이
                decoration: BoxDecoration(
                  color: Colors.transparent, // 버튼을 투명하게 설정
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
