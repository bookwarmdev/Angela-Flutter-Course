
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class CardDesign extends StatelessWidget {
  final Color bwdColor;
  final Widget bwdChild;
  final Function onPress;

  CardDesign({@required this.bwdColor, @required this.bwdChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: bwdColor,
        ),
        child: bwdChild,
      ),
    );
  }
}
