import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: const QuizPage(),
      // home: Scaffold(
      //   backgroundColor: Colors.grey.shade900,
      //   body: SafeArea(
      //     child: Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 10.0),
      //       child: QuizPage(),
      //     ),
      //   ),
      // ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      // Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.")
      //     .show();

      //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If true, execute Part A, B, C, D.
      //TODO: Step 4 Part A - show an alert using rFlutter_alert (remember to read the docs for the package!)
      //HINT! Step 4 Part B is in the quiz_brain.dart
      //TODO: Step 4 Part C - reset the questionNumber,
      //TODO: Step 4 Part D - empty out the scoreKeeper.

      //TODO: Step 5 - If we've not reached the end, ELSE do the answer checking steps below 👇
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      quizBrain.nextQuestion();
      if (quizBrain.isFinished() == true) {
        Alert(
          style: AlertStyle(
              backgroundColor: Colors.lime,
              animationDuration: Durations.extralong1),
          context: context,
          title: "CONGRATULATIONS!",
          desc: "'You\'ve reached the end of the quiz.",
          alertAnimation: fadeAlertAnimation,
        ).show();
      }
    });
  }

  Widget fadeAlertAnimation(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Align(
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black26,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const FlutterLogo(
                style: FlutterLogoStyle.stacked,
                size: 55.0,
                textColor: Colors.cyan,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      quizBrain.getQuestionText(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.green),
                    shape: WidgetStateProperty.all(const StadiumBorder()),
                  ),
                  onPressed: () {
                    //The user picked true.
                    checkAnswer(true);
                  },
                  child: Text(
                    'True',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 17.0,
              ),
              Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      checkAnswer(false);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      shape: WidgetStatePropertyAll(const StadiumBorder()),
                    ),
                    child: const Text('False',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold)),
                  )),
              const SizedBox(
                height: 17.0,
              ),
              Row(
                children: scoreKeeper,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/