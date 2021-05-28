import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apparche/quiz/controllers/question_controller.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(onPressed: _controller.nextQuestion, child: Text("Skip")),
        ],
      ),
    
      body: Body()
  
    );
  }
}

class QuizScreenNormal extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(onPressed: _controller.nextQuestion1, child: Text("Skip")),
        ],
      ),
    
      body: Normal()
  
    );
  }
}

class QuizScreenfacile extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(onPressed: _controller.nextQuestion2, child: Text("Skip")),
        ],
      ),
    
      body: Difficile()
  
    );
  }
}
