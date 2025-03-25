import 'package:flutter/material.dart';


class MoodPost {
  final String emoji;
  final String content;
  final String timeAgo;

  MoodPost({
    required this.emoji,
    required this.content,
    required this.timeAgo,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 샘플 무드 포스트 데이터
    final List<MoodPost> posts = [
      MoodPost(
        emoji: '😊',
        content: 'hey yo whatsss upppppp',
        timeAgo: '12 minutes ago',
      ),
      MoodPost(
        emoji: '😊',
        content: '뭐래니ㅣㄴ니니',
        timeAgo: '32 minutes ago',
      ),
      MoodPost(
        emoji: '🥳',
        content: '테스트입니당아아앙',
        timeAgo: '58 minutes ago',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFEAE3C9), // 베이지색 배경
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
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
            const SizedBox(height: 20),

            // 무드 포스트 리스트
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 무드 카드
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF7DCFB6), // 민트색 배경
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 무드 및 이모지
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    const TextSpan(text: 'Mood: '),
                                    TextSpan(text: posts[index].emoji),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 4),
                              // 무드 내용
                              Text(
                                posts[index].content,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // 시간 표시
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, left: 8.0),
                          child: Text(
                            posts[index].timeAgo,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
          color: Color(0xFFEAE3C9), // 베이지색과 동일
        ),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // 홈 아이콘
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.home, size: 28),
                Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
            // 작성 아이콘
            const Icon(Icons.edit, size: 28),
          ],
        ),
      ),
    );
  }
}