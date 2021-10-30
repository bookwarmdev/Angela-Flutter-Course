
import 'package:bmi_calculator/core/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CardContentDesign extends StatelessWidget {
  final String bwdCardText;
  final IconData bwdCardIcone;

  CardContentDesign({@required this.bwdCardText, @required this.bwdCardIcone});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          bwdCardIcone,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          bwdCardText,
          style: kBwdLableText,
        ),
      ],
    );
  }
}
