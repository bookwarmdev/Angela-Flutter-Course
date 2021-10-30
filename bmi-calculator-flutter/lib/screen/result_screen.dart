import 'package:bmi_calculator/core/bottom_button.dart';
import 'package:bmi_calculator/core/card_content_design.dart';
import 'package:bmi_calculator/core/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ResultScreen extends StatelessWidget {
  final String getResultOverView;
  final String getResultScore;
  final String getResultDetails;

  ResultScreen(
      {@required this.getResultDetails,@required this.getResultOverView,@required this.getResultScore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardDesign(
              bwdColor: bwdPrimaryColor,
              bwdChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    getResultOverView,
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF24D876)),
                  ),
                  Text(
                    getResultScore,
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    getResultDetails,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ButtomButton(
              buttonText: 'RE-CALCULATE',
              onTap: () { 
                  Navigator.pop(context); 
              }),
        ],
      ),
    );
  }
}
