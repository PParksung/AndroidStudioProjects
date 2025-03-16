import 'package:flutter/material.dart';
import 'package:readif/book_cover.dart';

class ModeSelectionModal extends StatelessWidget {
  final String bookTitle;
  final String imagePath;

  ModeSelectionModal({required this.bookTitle, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, height: 180, fit: BoxFit.cover),
          SizedBox(height: 8),
          Text(
            bookTitle,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Nanum'), // 기존 24에서 28로 증가
          ),
          SizedBox(height: 4),
          Text(
            "고전 소설",
            style: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: 'Nanum'), // 기존 기본 폰트 크기에서 4 증가
          ),
          SizedBox(height: 16),
          Text(
            "모드를 선택해주세요!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'Nanum'), // 기본 크기에서 4 증가
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildModeButton(context, false, "일반모드"),
              _buildModeButton(context, true, "창의모드"),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "창의 모드는 일반 모드를 읽은 후 선택할 수 있어요!",
            style: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: 'Nanum'), // 기본 크기에서 4 증가
          ),
        ],
      ),
    );
  }

  Widget _buildModeButton(BuildContext context, bool mode, String mode_name) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StoryMode(isCreativeMode: mode)),
        );
      },
      child: Text(mode_name, style: TextStyle(fontFamily: 'Nanum', fontSize: 16)), // 기존 12에서 16으로 증가
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple[100],
        foregroundColor: Colors.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
