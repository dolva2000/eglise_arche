import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apparche/quiz/constants.dart';
import 'package:apparche/quiz/models/Questions.dart';
import 'package:apparche/quiz/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';

class ScoreScreen extends StatelessWidget {
  ScoreScreen({this.levelCode});
  final int levelCode;

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    List<Question> questions;
    switch (levelCode) {
      case 1:
        questions = _qnController.questionsFacile;
        break;
      case 2:
        questions = _qnController.questionsNormale;
        break;
      case 3:
        questions = _qnController.questionsDifficile;
        break;
      default:
        break;
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icon/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_qnController.numOfCorrectAns * 10}/${questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
