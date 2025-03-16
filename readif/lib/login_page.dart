import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPressed = false; // 버튼의 눌림 상태를 관리하는 변수

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 600,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.062),
            blurRadius: 40,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png',
            height: 250,
          ),
          SizedBox(height: 30),
          _buildInputField(
            controller: usernameController,
            hintText: '아이디',
            icon: Icons.person,
            isPassword: false,
          ),
          _buildInputField(
            controller: passwordController,
            hintText: '비밀번호',
            icon: Icons.lock,
            isPassword: true,
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTapDown: (_) {
              setState(() {
                _isPressed = true; // 버튼이 눌린 상태로 변경
              });
            },
            onTapUp: (_) {
              setState(() {
                _isPressed = false; // 버튼에서 손을 뗐을 때
              });
              // 로그인 로직 추가
              Navigator.pushReplacementNamed(context, '/main');
            },
            onTapCancel: () {
              setState(() {
                _isPressed = false; // 버튼이 눌린 상태에서 취소할 때
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: _isPressed ? Colors.white.withOpacity(0.7) : Color(0xFF8000FF),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Color(0xFF8000FF)), // 테두리 색상
              ),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Text(
                '로그인',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Column(
            children: [
              Text(
                "계정을 생성하시겠습니까?",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF424242),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF2E2E2E),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  '회원가입',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required bool isPassword,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon, color: Color(0xFF2E2E2E)),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFADADAD)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFC774FF)),
          ),
        ),
      ),
    );
  }
}
