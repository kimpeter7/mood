import 'package:flutter/material.dart';
import 'package:mood_tracker/HomeScreen.dart';
import 'package:mood_tracker/SignupScreen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Supabase 초기화
    final supabase = Supabase.instance.client;

    // 이메일과 비밀번호를 저장할 변수
    String email = '';
    String password = '';

    return Scaffold(
      backgroundColor: const Color(0xFFEAE3C9), // 베이지색 배경
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              // 상단 로고 및 텍스트
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('🔥', style: TextStyle(fontSize: 24)),
                  SizedBox(width: 5),
                  Text(
                    'MOOD',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text('🔥', style: TextStyle(fontSize: 24)),
                ],
              ),

              const Spacer(flex: 1),

              // 환영 메시지
              const Text(
                'Welcome!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // 이메일 입력 필드
              TextField(
                onChanged: (value) {
                  email = value; // 이메일 저장
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // 비밀번호 입력 필드
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value; // 비밀번호 저장
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Enter 버튼
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final response = await supabase.auth.signInWithPassword(email: email, password: password);
                    if (response.user != null) {
                      // 로그인 성공 시 HomeScreen으로 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                    } else {
                      // 오류 처리
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('오류: ${response.user ?? '알 수 없는 오류입니다.'}')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF8B2DE), // 연한 분홍색
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Enter',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const Spacer(flex: 3),

              // 계정 생성 버튼
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // 회원가입 화면으로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF8B2DE), // 연한 분홍색
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Create an account',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward, size: 16),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // 구분선
              Container(
                width: 120,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

