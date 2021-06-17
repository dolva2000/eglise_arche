import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apparche/quiz/constants.dart';
import 'package:apparche/quiz/controllers/question_controller.dart';
import 'package:apparche/quiz/models/Questions.dart';
import 'package:flutter_svg/svg.dart';

import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  Body({this.levelCode});
  final int levelCode;

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
    List<Question> questions;

    switch (levelCode) {
      case 1:
        questions = _questionController.questionsFacile;
        break;
      case 2:
        questions = _questionController.questionsNormale;
        break;
      case 3:
        questions = _questionController.questionsDifficile;
        break;
      default:
        break;
    }

    return Stack(
      children: [
        SvgPicture.asset("assets/icon/bg.svg", fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(tmps: 30),
              ),
              SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Question ${_questionController.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                          text: "/${questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: kSecondaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1.5),
              SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: questions[index],
                    levelCode: levelCode,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
