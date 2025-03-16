import 'package:flutter/material.dart';
import 'story_result_page.dart'; // StoryResultPage를 import합니다.
import 'story_result_page2.dart';
class CreativeScreen extends StatelessWidget {
  final double verticalPadding;
  final String imagePath; // 이미지 경로를 추가합니다.
  final int page;
  CreativeScreen({this.verticalPadding = 0, required this.imagePath, required this.page}); // 이미지 경로를 필수로 설정

  // 버튼 위치 및 크기를 조정하기 위한 변수
  final double buttonWidth = 300.0; // 버튼 너비
  final double buttonHeight = 60.0; // 버튼 높이
  final double rightMargin = 80.0; // 오른쪽 여백
  final double bottomMargin = 50.0; // 아래 여백

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: verticalPadding), // 위, 아래 마진을 설정
              child: Image.asset(
                imagePath, // 전달받은 이미지 경로를 사용
                fit: BoxFit.contain, // 이미지가 잘리지 않도록 설정
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Positioned(
            right: rightMargin,
            bottom: bottomMargin,
            child: GestureDetector(
              onTap: () {
                // "이야기 바꾸기" 버튼 클릭 시 창의 모드 질문 다이얼로그 표시
                _showCreativeModeModal(context);
              },
              child: Container(
                width: buttonWidth,
                height: buttonHeight,
                color: Colors.transparent, // 투명하게 설정
                alignment: Alignment.center,
                child: Text(
                  '', // 버튼 텍스트 추가
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.white.withOpacity(0.3), // 버튼 배경을 약간 투명하게
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCreativeModeModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "if 만약에? 이렇다면?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Nanum'),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: "여기에 써보세요!",
                  hintStyle: TextStyle(fontFamily: 'Nanum'),
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  if(page == 5){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StoryResultPage()),
                    );
                  }
                  else{
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StoryResultPage2()),
                    );
                  }
                },
                child: Text("이야기 시작!", style: TextStyle(fontFamily: 'Nanum')),
              ),
            ],
          ),
        );
      },
    );
  }
}
