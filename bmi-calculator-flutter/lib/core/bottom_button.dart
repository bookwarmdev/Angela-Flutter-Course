import 'package:bmi_calculator/core/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ButtomButton extends StatelessWidget {
  final String buttonText;
  final Function onTap;

  ButtomButton({@required this.buttonText, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: bwdSecondryColor,
          margin: const EdgeInsets.only(top: 10.0,),
          height: 80.0,
          width: double.infinity,
          child: Center(
              child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
    );
  }
}
