import 'package:flutter/material.dart';
import 'main_page.dart';
import 'story_map.dart';

class MyStoryPage extends StatelessWidget {
  final List<Map<String, String>> myBooks = [
    {
      "title": "심청전",
      "imagePath": "assets/simcheong.png",
    },
    {
      "title": "신데렐라",
      "imagePath": "assets/cinderella.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 한 줄에 두 개의 카드 표시
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1300/1600, // 카드의 세로 길이 비율
          ),
          itemCount: myBooks.length,
          itemBuilder: (context, index) {
            final book = myBooks[index];
            return BookCard(
              title: book["title"]!,
              imagePath: book["imagePath"]!,
              onTap: () {
                // 심청전 선택 시 스토리맵 페이지로 이동하도록 설정
                if (book["title"] == "심청전") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StoryMapPage()),
                  );
                }
                // 신데렐라 선택 시 다른 동작을 설정하거나 추가할 수 있음
              },
            );
          },
        ),
      ),
    );
  }
}