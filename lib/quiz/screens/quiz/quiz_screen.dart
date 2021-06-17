import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apparche/quiz/controllers/question_controller.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  QuizScreen({this.levelCode});
  final int levelCode;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());

    void nextQuestion() {
      switch (levelCode) {
        case 1:
          _controller.nextQuestionFacile();
          break;
        case 2:
          _controller.nextQuestionNormale();
          break;
        case 3:
          _controller.nextQuestionDifficile();
          break;
        default:
          break;
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: nextQuestion, child: Text("Passer")),
        ],
      ),
      body: Body(levelCode: levelCode),
    );
  }
}
