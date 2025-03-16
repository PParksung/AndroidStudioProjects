import 'package:flutter/material.dart';
import 'creative_story_reading_page.dart';

class StoryMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // 배경 이미지
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/story_map_background.png'), // 배경 이미지 경로
                fit: BoxFit.cover, // 배경 이미지 비율 유지
              ),
            ),
          ),
          // 스토리 맵 위젯들
          Positioned.fill(
            child: Stack(
              children: [
                // 첫 번째 박스
                Positioned(
                  left: screenWidth * 0.6387,
                  top: screenHeight * 0.151,
                  child: GestureDetector(
                    onTap: () {
                      // Page1으로 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreativeStoryReadingPage(page: 5)),
                      );
                    },
                    child: Container(
                      width: screenWidth * 0.1713,
                      height: screenHeight * 0.184,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.0), // 완전 투명
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                // 두 번째 박스
                Positioned(
                  left: screenWidth * 0.69,
                  top: screenHeight * 0.631,
                  child: GestureDetector(
                    onTap: () {
                      // Page2로 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreativeStoryReadingPage(page: 10)),
                      );
                    },
                    child: Container(
                      width: screenWidth * 0.1567,
                      height: screenHeight * 0.241,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.withOpacity(0.0), // 완전 투명
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 뒤로가기 버튼
        ],
      ),
    );
  }
}
