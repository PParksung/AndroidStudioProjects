import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'post_detail_page.dart';

class BulletinBoardPage extends StatefulWidget {
  @override
  _BulletinBoardPageState createState() => _BulletinBoardPageState();
}

class _BulletinBoardPageState extends State<BulletinBoardPage> {
  List<Map<String, dynamic>> posts = [];

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    final data = await DBHelper().getPosts();
    setState(() {
      posts = data;
    });
  }

  void _addPost(String title, String content, String imagePath) async {
    await DBHelper().insertPost(title, content, imagePath);
    _loadPosts();
  }

  void _deleteAllPosts() async {
    await DBHelper().deleteAllPosts();
    _loadPosts(); // 게시판 갱신
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "게시판",
          style: TextStyle(
            fontSize: 28,
            fontFamily: 'Nanum',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _confirmDeleteAllPosts();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 가로에 3개의 카드가 표시되도록 설정
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.5,
          ),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostDetailPage(post: posts[index]),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (posts[index]["imagePath"] != null)
                        Container(
                          height: 120, // 고해상도 화면에 맞게 이미지 크기 조정
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(posts[index]["imagePath"]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      else
                        Icon(Icons.image_not_supported, size: 80),
                      SizedBox(height: 16),
                      Text(
                        posts[index]["title"],
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nanum',
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        posts[index]["content"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Nanum',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddPostDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  void _confirmDeleteAllPosts() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "모든 게시글 삭제",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nanum',
            ),
          ),
          content: Text(
            "모든 게시글을 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.",
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Nanum',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "취소",
                style: TextStyle(fontSize: 18, fontFamily: 'Nanum'),
              ),
            ),
            TextButton(
              onPressed: () {
                _deleteAllPosts();
                Navigator.pop(context);
              },
              child: Text(
                "삭제",
                style: TextStyle(fontSize: 18, fontFamily: 'Nanum'),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showAddPostDialog() {
    String title = '';
    String content = '';
    String imagePath = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "새 게시글 작성",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nanum',
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "제목"),
                onChanged: (value) => title = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: "내용"),
                onChanged: (value) => content = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: "이미지 경로"),
                onChanged: (value) => imagePath = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "취소",
                style: TextStyle(fontSize: 18, fontFamily: 'Nanum'),
              ),
            ),
            TextButton(
              onPressed: () {
                if (title.isNotEmpty && content.isNotEmpty && imagePath.isNotEmpty) {
                  _addPost(title, content, imagePath);
                  Navigator.pop(context);
                }
              },
              child: Text(
                "저장",
                style: TextStyle(fontSize: 18, fontFamily: 'Nanum'),
              ),
            ),
          ],
        );
      },
    );
  }
}
