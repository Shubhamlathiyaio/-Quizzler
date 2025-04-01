import 'package:flutter/material.dart';
import 'package:quizzler/commons/common_spacing.dart';
import 'package:quizzler/commons/common_text.dart';

class Result extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const Result({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              data: "🎉 Quiz Completed! 🎉",
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontColor: Colors.white,
            ),
            h20,
            CommonText(
              data: "Your Score: $score / $totalQuestions",
              fontSize: 22,
              fontColor: Colors.greenAccent,
              fontWeight: FontWeight.bold,
            ),
            h30,
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.orange,
              ),
              child: CommonText(
                data: "🔄 Play Again",
                fontSize: 18,
                fontColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
