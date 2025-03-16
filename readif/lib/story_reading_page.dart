import 'package:flutter/material.dart';
import 'package:readif/story_learning_intro.dart';

class StoryReadingPage extends StatefulWidget {
  final String mode;

  StoryReadingPage({required this.mode});

  @override
  _StoryReadingPageState createState() => _StoryReadingPageState();
}

class _StoryReadingPageState extends State<StoryReadingPage> {
  int currentPage = 0;
  final List<String> imagePaths = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
    'assets/image4.png',
  ];

  void goToNextPage() {
    if (currentPage < imagePaths.length - 1) {
      setState(() {
        currentPage++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StoryLearningIntro()),
      );
    }
  }

  void goToPreviousPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // 화면 전체에 이미지 표시
          Positioned.fill(
            child: Image.asset(
              imagePaths[currentPage],
              fit: BoxFit.fitHeight, // 세로폭을 화면에 맞춤
            ),
          ),
          // 왼쪽 아래 투명 버튼
          Positioned(
            left: screenWidth * 0.0627,
            top: screenHeight * 0.901,
            child: GestureDetector(
              onTap: goToPreviousPage,
              child: Container(
                width: screenWidth * 0.046,
                height: screenHeight * 0.06,
                color: Colors.transparent, // 버튼을 투명하게 설정
              ),
            ),
          ),
          // 오른쪽 아래 투명 버튼
          Positioned(
            left: screenWidth * 0.88,
            top: screenHeight * 0.883,
            child: GestureDetector(
              onTap: goToNextPage,
              child: Container(
                width: screenWidth * 0.046,
                height: screenHeight * 0.06,
                color: Colors.transparent, // 버튼을 투명하게 설정
              ),
            ),
          ),
          // 페이지 번호 표시
          Positioned(
            bottom: 20,
            left: screenWidth / 2 - 30,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              color: Colors.black.withOpacity(0.5),
              child: Text(
                '${currentPage + 1} / ${imagePaths.length}',
                style: TextStyle(fontFamily: 'Nanum', color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
