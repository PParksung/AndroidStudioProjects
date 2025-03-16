import 'package:flutter/material.dart';
import 'package:readif/bulletin_board_page.dart';
import 'mode_selection_modal.dart';
import 'my_story.dart';

class MainPage extends StatelessWidget {
  final int initialTabIndex;

  MainPage({this.initialTabIndex = 0}); // 기본값을 0으로 설정하여 추천 도서 탭에서 시작

  final List<Map<String, String>> books = [
    {
      "title": "심청전",
      "description": "7세 아이들이 가장 많이 읽었어요",
      "imagePath": "assets/simcheong.png",
      "popular": "true",
    },
    {
      "title": "백설공주",
      "description": "서양의 전래동화",
      "imagePath":  "assets/snow_white.png",
    },
    {
      "title": "강아지똥",
      "description": "저자 권정생",
      "imagePath": "assets/dog.png",
    },
    {
      "title": "신데렐라",
      "description": "서양의 전래동화",
      "imagePath": "assets/cinderella.png",
    },
    {
      "title": "사과가 쿵!",
      "description": "영유아 스테디셀러",
      "imagePath": "assets/apple.png",
    },
    {
      "title": "흥부와 놀부",
      "description": "전래동화",
      "imagePath": "assets/heungbu.png",
    },
    {
      "title": "시끌벅적 변장 파티",
      "description": "그림책",
      "imagePath": "assets/party.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: initialTabIndex, // 초기 탭 인덱스를 설정
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            "ReadIf(레디프)",
            style: TextStyle(fontFamily: 'Nanum', color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          ],
          bottom: TabBar(
            labelColor: Colors.white, // 탭 선택 시 흰색 텍스트
            unselectedLabelColor: Colors.white70, // 선택되지 않은 탭의 텍스트 색상
            labelStyle: TextStyle(fontSize: 16, fontFamily: 'Nanum'), // 폰트 크기 및 스타일 설정
            tabs: [
              Tab(text: "추천 도서"),
              Tab(text: "게시판"),
              Tab(text: "내 스토리"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBookGrid(),  // 추천 도서 탭의 내용
            BulletinBoardPage(), // 게시판 탭의 내용
            MyStoryPage(),
          ],
        ),
      ),
    );
  }

  Widget _buildBookGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 한 줄에 3개의 카드 표시
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: (1300 / 1600), // 카드의 가로 세로 비율
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return BookCard(
            title: book["title"]!,
            description: book["description"],
            imagePath: book["imagePath"]!,
            isPopular: book["popular"] == "true",
            onTap: () => _showModeSelectionModal(context, book["title"]!, book["imagePath"]!),
          );
        },
      ),
    );
  }

  void _showModeSelectionModal(BuildContext context, String bookTitle, String imagePath) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ModeSelectionModal(bookTitle: bookTitle, imagePath: imagePath),
    );
  }
}

class BookCard extends StatelessWidget {
  final String title;
  final String? description;
  final String imagePath;
  final bool isPopular;
  final VoidCallback onTap;

  BookCard({
    required this.title,
    required this.imagePath,
    this.description,
    required this.onTap,
    this.isPopular = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 256, // 카드의 너비를 픽셀 단위로 고정 (비율에 따라 조정 가능)
        height: 400, // 카드의 높이를 픽셀 단위로 고정 (비율에 따라 조정 가능)
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // 수평으로 가운데 정렬
          children: [
            Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      imagePath,
                      height: 256, // 이미지 높이를 픽셀 단위로 고정
                      width: 256, // 이미지 너비를 픽셀 단위로 고정
                      fit: BoxFit.cover, // 비율 유지
                    ),
                  ),
                ),
                if (isPopular)
                  Positioned(
                    top: 4,
                    left: 4,
                    child: Icon(Icons.emoji_events, color: Colors.amber, size: 25),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // 텍스트 수평으로 가운데 정렬
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20, // 제목 글씨 크기 증가 (기존 16에서 20으로 증가)
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nanum',
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center, // 텍스트 가운데 정렬
                  ),
                  if (description != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        description!,
                        style: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: 'Nanum'), // 본문 글씨 크기 증가 (기존 12에서 16으로 증가)
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center, // 텍스트 가운데 정렬
                      ),
                    ),
                  SizedBox(height: 4),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: onTap,
                      child: Text("읽기", style: TextStyle(fontFamily: 'Nanum', fontSize: 16)), // 버튼 글씨 크기 증가 (기존 12에서 16으로 증가)
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[100],
                        foregroundColor: Colors.purple,
                        minimumSize: Size(50, 24), // 버튼 크기 유지
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
