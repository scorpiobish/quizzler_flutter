// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(const Quizzlers());

class Quizzlers extends StatelessWidget {
  const Quizzlers({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: QuizPage(),
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
  List<Icon> scoreKeeper = [
    Icon(
      Icons.check,
      color: Colors.green,
      size: 50.0,
    ),
    Icon(Icons.close, color: Colors.red, size: 50.0),
    Icon(Icons.close, color: Colors.red, size: 50.0),
    Icon(Icons.close, color: Colors.red, size: 50.0),
    Icon(Icons.close, color: Colors.red, size: 50.0),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FlutterLogo(
                  style: FlutterLogoStyle.markOnly,
                  size: 80.0,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                          text: 'This is where the ',
                          style: TextStyle(fontSize: 25.0),
                          children: [
                            TextSpan(
                              text: 'question text ',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.blue),
                            ),
                            TextSpan(text: 'will go.'),
                          ]),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                    ),
                    onPressed: () { scoreKeeper.add(Icon(Icons.check, color: Colors.green, size: 50.0));
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
                SizedBox(
                  height: 17.0,
                ),
                Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        // ignore: avoid_print
                        print('false button pressed');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        shape: MaterialStateProperty.all(StadiumBorder()),
                      ),
                      child: Text('False',
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



//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.grey.shade900,
//         body: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.0),
//             child: QuizPage(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class QuizPage extends StatefulWidget {
//   const QuizPage({super.key});

//   @override
//   _QuizPageState createState() => _QuizPageState();
// }

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
