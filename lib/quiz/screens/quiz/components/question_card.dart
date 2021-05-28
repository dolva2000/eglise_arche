import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apparche/quiz/controllers/question_controller.dart';
import 'package:apparche/quiz/models/Questions.dart';

import '../../../constants.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key,
    // it means we have to pass this
    @required this.question,
    
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: kBlackColor),
          ),
          SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              text: question.options[index],
              press: () => _controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
class QuestionCard1 extends StatelessWidget {
  const QuestionCard1({
    Key key,
    // it means we have to pass this
    @required this.questionsfacile,
    
  }) : super(key: key);

  final Question questionsfacile;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            questionsfacile.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: kBlackColor),
          ),
          SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            questionsfacile.options.length,
            (index) => Option(
              index: index,
              text: questionsfacile.options[index],
              press: () => _controller.checkAns1(questionsfacile, index),
            ),
          ),
        ],
      ),
    );
  }
}
class QuestionCard2 extends StatelessWidget {
  const QuestionCard2({
    Key key,
    // it means we have to pass this
    @required this.questionsdifficile,
    
  }) : super(key: key);

  final Question questionsdifficile;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            questionsdifficile.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: kBlackColor),
          ),
          SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            questionsdifficile.options.length,
            (index) => Option(
              index: index,
              text: questionsdifficile.options[index],
              press: () => _controller.checkAns2(questionsdifficile, index),
            ),
          ),
        ],
      ),
    );
  }
}
