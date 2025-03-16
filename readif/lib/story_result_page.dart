import 'package:flutter/material.dart';
import 'creative_story_reading_page.dart';

class StoryResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/story_5p.png'), // 새로운 배경 이미지
              fit: BoxFit.contain,
            ),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8), // 배경과 텍스트의 가시성 향상
                borderRadius: BorderRadius.circular(16),
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center, // Column 내의 자식 위젯을 수직으로 가운데 정렬
                crossAxisAlignment: CrossAxisAlignment.center, // Column 내의 자식 위젯을 수평으로 가운데 정렬
                children: [
                  Text(
                    "이야기 생성 완료",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nanum', // Nanum 폰트
                    ),
                    textAlign: TextAlign.center, // 텍스트 가운데 정렬
                  ),
                  SizedBox(height: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/sub2.jpg', height: 200), // 예시 이미지 가운데 정렬
                      SizedBox(height: 16),
                      Text(
                        "다정한 마을 사람들",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nanum', // Nanum 폰트
                        ),
                        textAlign: TextAlign.center, // 텍스트 가운데 정렬
                      ),
                      SizedBox(height: 8),
                      Text(
                        "[ 새로운 이야기 ]\n"
                            "심 봉사는 딸의 희생을 막으려고 마음을 굳혔어요. 아버지는 심청이가 몰래 떠나기 전날 밤, 딸의 방으로 찾아갔어요.\n"
                            "\"청아, 나는 네가 이렇게 희생하는 것을 절대 원하지 않는다. 우리 같이 어려움을 이겨내 보자.\"\n"
                            "심청이는 아버지의 말을 듣고 눈물을 흘렸어요.\n"
                            "\"아버지, 저는 아버지를 위해 무엇이든 할 수 있어요. 하지만 아버지의 마음을 알겠어요. 저도 아버지와 함께 이겨내고 싶어요.\"\n"
                        "...",
                        textAlign: TextAlign.center, // 텍스트 가운데 정렬
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Nanum', // Nanum 폰트
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.white, // 버튼 글씨 색상을 흰색으로 변경
                        ),
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst); // 홈 화면으로 돌아가기
                        },
                        child: Text("나중에 이어읽기",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Nanum', // Nanum 폰트

                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white, // 버튼 글씨 색상을 흰색으로 변경
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CreativeStoryReadingPage(page: 5)),
                          ); // 창의 동화책 읽기 페이지로 이동
                        },
                        child: Text("이어 읽기",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Nanum', // Nanum 폰트

                          ),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
