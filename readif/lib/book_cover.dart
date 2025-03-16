import 'package:flutter/material.dart';
import 'package:readif/story_select.dart';
import 'story_reading_page.dart';
class StoryMode extends StatefulWidget {
  bool isCreativeMode = false; // false가 일반모드
  StoryMode({Key? key, required this.isCreativeMode}) : super(key: key);
  @override
  StoryModeState createState() => StoryModeState();
}

class StoryModeState extends State<StoryMode> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              widget.isCreativeMode ? 'assets/creative_mode.png' : 'assets/normal_mode.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: screenHeight * 0.05,
            left: screenWidth * 0.02,
            child: Text(
              widget.isCreativeMode ? '창의모드' : '학습모드',
              style: TextStyle(
                fontSize: screenHeight * 0.03,
                color: Colors.white,
                fontFamily: 'Nanum',
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                bottom: screenHeight * 0.08,
              ),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      minimumSize: Size(
                        screenWidth * 0.1,
                        screenHeight * 0.08,
                      ),
                      textStyle: TextStyle(
                        fontFamily: 'Nanum',
                        fontSize: screenHeight * 0.025,
                      ),
                    ),
                    child: Text('나가기'),
                  ),
                  SizedBox(width: screenWidth * 0.02), // Spacing between buttons
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the appropriate page based on the mode
                      if (widget.isCreativeMode) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StorySelectScreen()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StoryReadingPage(mode: "일반 모드")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      minimumSize: Size(
                        screenWidth * 0.1,
                        screenHeight * 0.08,
                      ),
                      textStyle: TextStyle(
                        fontFamily: 'Nanum',
                        fontSize: screenHeight * 0.025,
                      ),
                    ),
                    child: Text('시작!'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
