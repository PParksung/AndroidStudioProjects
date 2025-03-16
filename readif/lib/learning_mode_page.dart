import 'package:flutter/material.dart';

class LearningModePage extends StatefulWidget {
  @override
  _LearningModePageState createState() => _LearningModePageState();
}

class _LearningModePageState extends State<LearningModePage> {
  // 질문과 답변 리스트
  final String question = "Q. 심청이를 도와준 인물은?";
  final List<String> options = [
    "1. 장성근",
    "2. 박성민",
    "3. 박경서",
    "4. 이가은",
    "5. 조은주",
    "6. 용왕님",
  ];

  // 정답
  final int correctAnswerIndex = 5; // "용왕님"

  // 사용자 선택
  int? selectedOption;

  // 결과 메시지
  String? resultMessage;

  // 힌트 상태 관리
  bool showHint = false;

  // 답변 제출 처리
  void submitAnswer() {
    setState(() {
      if (selectedOption == correctAnswerIndex) {
        resultMessage = "정답입니다!";
        _showResultDialog(resultMessage!, true); // 정답일 때 다이얼로그
      } else {
        resultMessage = "오답입니다!";
        _showResultDialog(resultMessage!, false); // 오답일 때 다이얼로그
      }
    });
  }

  // 결과를 표시하는 다이얼로그
  void _showResultDialog(String message, bool isCorrect) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("결과", style: TextStyle(fontFamily: 'Nanum', fontSize: 24)),
          content: Text(message, style: TextStyle(fontFamily: 'Nanum', fontSize: 22)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
                if (isCorrect) {
                  goToMainMenu(); // 정답이면 메인 화면으로 돌아가기
                }
              },
              child: Text("확인", style: TextStyle(fontFamily: 'Nanum', fontSize: 20)),
            ),
          ],
        );
      },
    );
  }

  // 메인 화면으로 돌아가는 함수
  void goToMainMenu() {
    Navigator.popUntil(context, (route) => route.isFirst); // 메인 화면으로 돌아감
  }

  // 힌트보기 버튼 클릭 시 동작
  void toggleHint() {
    setState(() {
      showHint = !showHint; // 힌트 상태를 토글
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("학습 모드", style: TextStyle(fontFamily: 'Nanum', fontSize: 28)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 1), // 왼쪽 여백
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 질문
                  Text(
                    question,
                    style: TextStyle(fontFamily: 'Nanum', fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  // 선택지
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(options.length, (index) {
                      return ListTile(
                        title: Text(
                          options[index],
                          style: TextStyle(fontFamily: 'Nanum', fontSize: 24),
                        ),
                        leading: Radio<int>(
                          value: index,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value;
                            });
                          },
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            Spacer(flex: 1), // 가운데 간격
            // 힌트 이미지와 힌트보기 버튼
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  showHint ? 'assets/clickhint.png' : 'assets/hintimage.png', // 힌트 상태에 따라 이미지 변경
                  width: 400,
                  height: 400,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: toggleHint,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    showHint ? "6. 용왕님" : "힌트 보기", // 힌트 상태에 따라 텍스트 변경
                    style: TextStyle(color: Colors.white, fontFamily: 'Nanum', fontSize: 24),
                  ),
                ),
              ],
            ),
            Spacer(flex: 1), // 오른쪽 여백
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 나가기 버튼 (검은색 배경에 흰색 글씨)
            TextButton(
              onPressed: goToMainMenu,
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                "나가기",
                style: TextStyle(color: Colors.white, fontFamily: 'Nanum', fontSize: 22),
              ),
            ),
            // 제출 버튼 (흰색 배경에 검정색 글씨와 테두리)
            ElevatedButton(
              onPressed: selectedOption != null ? submitAnswer : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.black),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                "다음",
                style: TextStyle(color: Colors.black, fontFamily: 'Nanum', fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
