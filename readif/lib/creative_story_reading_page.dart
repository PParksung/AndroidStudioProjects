import 'package:flutter/material.dart';
import 'main_page.dart';

class CreativeStoryReadingPage extends StatefulWidget {
  final int page;

  // 페이지 인자를 받는 생성자 추가
  CreativeStoryReadingPage({required this.page});

  @override
  _CreativeStoryReadingPageState createState() => _CreativeStoryReadingPageState();
}

class _CreativeStoryReadingPageState extends State<CreativeStoryReadingPage> {
  int currentPage = 0;
  List<String> imagePaths = [];

  @override
  void initState() {
    super.initState();

    // page 인자에 따라 imagePaths 초기화
    if (widget.page == 5) {
      imagePaths = [
        'assets/creative_image1.png',
        'assets/creative_image2.png',
        'assets/creative_image3.png',
      ];
    } else if (widget.page == 10) {
      imagePaths = [
        'assets/creative_image4.png',
        'assets/creative_image5.png',
        'assets/creative_image6.png',
      ];
    }
  }

  void goToNextPage() {
    if (currentPage < imagePaths.length - 1) {
      setState(() {
        currentPage++;
      });
    } else {
      // 마지막 페이지에서 모달 창 띄우기
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "내가 만든 이야기가 모두 끝났어요!",
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            content: Text(
              "게시판에서 내가 만든 이야기를 자랑해볼까요?",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // 모달 창 닫기
                  Navigator.popUntil(context, (route) => route.isFirst); // 홈으로 돌아가기
                },
                child: Text(
                  "홈으로 돌아가기",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // 모달 창 닫기
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(initialTabIndex: 1), // 게시판 탭으로 이동
                    ),
                        (route) => route.isFirst, // 루트 페이지까지 pop
                  );
                },
                child: Text(
                  "자랑하러 가기",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          );
        },
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
