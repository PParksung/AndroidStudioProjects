import 'package:flutter/material.dart';
import 'creative_story_reading_page.dart';

class StoryResultPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image3.png'), // 새로운 배경 이미지
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
                      Image.asset('assets/sub5.jpg', height: 200), // 예시 이미지 가운데 정렬
                      SizedBox(height: 16),
                      Text(
                        "심청이와 사랑에 빠진 용왕님",
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
                            "용왕은 심청이의 효심에 깊이 감동하여 그녀에게 용궁에 남아 살 것을 제안했어요.\n"
                            "심청이는 아버지를 생각하며 고민했지만, 용왕은 그녀에게 아버지를 위한 모든 도움을 약속했어요.\n"
                            "심청이는 아버지를 위해 용궁에 남기로 결심했어요. \n"
                            "용왕은 심청이의 마음을 이해하고, 그녀를 용궁의 딸로 삼아 따뜻하게 보살펴 주었어요.\n",
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
                            MaterialPageRoute(builder: (context) => CreativeStoryReadingPage(page: 10)),
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
