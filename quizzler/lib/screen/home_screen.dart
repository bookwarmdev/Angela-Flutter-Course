import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quizzler/screen/quize/question_bank.dart';

QuestionBank _questionBank = QuestionBank();
    int number = 0; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Icon> setScoreKeeper = [];

  void checkPickedAnswer(bool answer) {
    bool getUserAnswer = _questionBank.getQuestionAnswer();
    int allQuestionLength = _questionBank.getQuestionLength();
    if (allQuestionLength > number) {
      if (answer == getUserAnswer) {
        setScoreKeeper.add(
          const Icon(
            Icons.check,
            color: Colors.green,
            size: 30.0,
          ),
        );
      } else { 
        setScoreKeeper.add(
          const Icon(
            Icons.close,
            color: Colors.red,
            size: 30.0,
          ),
        );
      }
    } else {
      setScoreKeeper.removeRange(0, number);
      number = -1;
    }

    setState(() {
      _questionBank.setNextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  // 'This is where the question text will go.',
                  _questionBank.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      bool corretAnswer = true;
                      checkPickedAnswer(corretAnswer);
                      number++;
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 90.0,
                      color: Colors.green,
                      child: const Center(
                        child: Text(
                          'True',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextButton(
                    onPressed: () {
                      bool corretAnswer = false;
                      checkPickedAnswer(corretAnswer);
                      number++;
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 90.0,
                      color: Colors.red,
                      child: const Center(
                        child: Text(
                          'False',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: setScoreKeeper,
            ),
          ),
          const SizedBox(
            height: 90.0,
          ),
        ],
      ),
    );
  }
}
