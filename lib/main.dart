import 'package:flutter/material.dart';
import 'package:quizzler_flutter/question.dart';
import 'question.dart';

void main() => runApp(const Quizzlers());

class Quizzlers extends StatelessWidget {
  const Quizzlers({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: const QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  // 
  // ];
  int currentQuestionindex = 0;

  // List<bool> answers = [false, true, true, true];

  List<Question> questions = [
    Question(
        questionText: 'You can lead a cow down stairs but not up stairs.',
        questionAnswer: false),
    Question(
        questionText:
            'Approximately one quarter of human bones are in the feet.',
        questionAnswer: true),
    Question(questionText: 'A slug\'s blood is green.', questionAnswer: true),
    Question(questionText: 'TPain is our President?', questionAnswer: true),
  ];

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = questions[currentQuestionindex];

    String questionText = currentQuestion.questionText; 
    bool questionAnswer = currentQuestion.questionAnswer;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const FlutterLogo(
                  style: FlutterLogoStyle.markOnly,
                  size: 80.0,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      questionText, // = questions[currentQuestionindex].questionText
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Color.fromARGB(255, 7, 48, 81)),
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
                      setState(() {
                        bool correctAnswer = questionAnswer;
                        if (correctAnswer == true) {
                          scoreKeeper.add(const Icon(Icons.check,
                              color: Colors.green, size: 50.0));
                          print('user got it right');
                        } else {
                          scoreKeeper.add(const Icon(Icons.close,
                              color: Colors.red, size: 50.0));
                          print('user got it wrong');
                        }

                        if (currentQuestionindex == 3) {
                          currentQuestionindex = 0;
                          // scoreKeeper.clear();
                        } else {
                          currentQuestionindex++;
                        }

                        print('New current index: $currentQuestionindex');
                      });

                      // ignore: avoid_print
                      print('true button pressed');
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
                        setState(() {
                          bool correctAnswer = questionAnswer;
                          if (correctAnswer == false) {
                            scoreKeeper.add(const Icon(Icons.check,
                                color: Colors.green, size: 50.0));
                            print('user got it right');
                          } else {
                            scoreKeeper.add(const Icon(Icons.close,
                                color: Colors.red, size: 50.0));
                            print('user got it wrong');
                          }
                          if (currentQuestionindex == 3) {
                            currentQuestionindex = 0;
                            // scoreKeeper.clear;
                          } else {
                            currentQuestionindex++;
                          }

                          print('New current index: $currentQuestionindex');
                        });
                        // ignore: avoid_print
                        print('false button pressed');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        shape: MaterialStateProperty.all(const StadiumBorder()),
                      ),
                      child: const Text('False',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold)),
                    )),
                Row(
                  children: scoreKeeper,
                )
              ],
            )),
      ),
    );
  }
}

// class _QuizPageState extends State<QuizPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Expanded(
//           flex: 5,
//           child: Padding(
//             padding: EdgeInsets.all(10.0),
//             child: Center(
//               child: Text(
//                 'This is where the question text will go.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 25.0,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.all(15.0),
// child: TextButton(
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.green),
//                 foregroundColor: MaterialStateProperty.all(Colors.white),
//               ),
//               child: Text(
//                 'True',
//                 style: TextStyle(
//                   fontSize: 20.0,
//                 ),
//               ),
//               onPressed: () {
//                 //The user picked true.
//               },
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: EdgeInsets.all(15.0),
//             child: TextButton(
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.red),
//                 foregroundColor: MaterialStateProperty.all(Colors.greenAccent),
//               ),
//               child: Text(
//                 'False',
//                 style: TextStyle(
//                   fontSize: 20.0,
//                 ),
//               ),
//               onPressed: () {
//                 //The user picked false.
//               },
//             ),
//           ),
//         ),
//         //TODO: Add a Row here as your score keeper
//       ],
//     );
//   }
// }

// /*
// question1: 'You can lead a cow down stairs but not up stairs.', false,
// question2: 'Approximately one quarter of human bones are in the feet.', true,
// question3: 'A slug\'s blood is green.', true,
// */
