import 'package:flutter/material.dart';

class PostDetailPage extends StatefulWidget {
  final Map<String, dynamic> post;

  PostDetailPage({required this.post});

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  int likes = 0; // 초기 좋아요 수

  void _incrementLikes() {
    setState(() {
      likes += 1; // 좋아요 수 증가
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.post["title"],
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nanum',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.post["imagePath"] != null)
                Container(
                  height: 400, // 가로 화면에 맞게 이미지 크기 조정
                  width: double.infinity,
                  child: Image.asset(
                    widget.post["imagePath"],
                    fit: BoxFit.contain,
                  ),
                ),
              SizedBox(height: 24),
              Text(
                widget.post["content"],
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Nanum',
                ),
              ),
              SizedBox(height: 24),
              Text(
                "좋아요: $likes",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nanum',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementLikes,
        child: Icon(Icons.thumb_up, size: 30),
        tooltip: "좋아요",
      ),
    );
  }
}
