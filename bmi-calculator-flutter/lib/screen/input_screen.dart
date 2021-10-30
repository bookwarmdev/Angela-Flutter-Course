import 'package:bmi_calculator/core/bottom_button.dart';
import 'package:bmi_calculator/core/calculate_brain.dart';
import 'package:bmi_calculator/core/card_content_design.dart';
import 'package:bmi_calculator/core/card_design.dart';
import 'package:bmi_calculator/core/style.dart';
import 'package:bmi_calculator/screen/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum GenderSelected {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

GenderSelected selectedGender;

class _InputPageState extends State<InputPage> {
  int hegihtValue = 180;
  int weightValue = 80;
  int ageValue = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardDesign(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderSelected.male;
                      });
                    },
                    bwdColor: selectedGender == GenderSelected.male
                        ? activeCardColor
                        : inActiverCardColor,
                    bwdChild: CardContentDesign(
                      bwdCardText: 'MALE',
                      bwdCardIcone: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: CardDesign(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderSelected.female;
                      });
                    },
                    bwdColor: selectedGender == GenderSelected.female
                        ? activeCardColor
                        : inActiverCardColor,
                    bwdChild: CardContentDesign(
                      bwdCardText: 'FEMALE',
                      bwdCardIcone: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardDesign(
              bwdColor: bwdPrimaryColor,
              bwdChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEGITH',
                    style: kBwdLableText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        hegihtValue.toString(),
                        style: kBwdUnitText,
                      ),
                      Text(
                        'Cm',
                        style: kBwdLableText,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: hegihtValue.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          hegihtValue = newValue.round();
                        });
                      },
                      max: 220.0,
                      min: 120.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardDesign(
                    bwdColor: bwdPrimaryColor,
                    bwdChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEGHT',
                          style: kBwdLableText,
                        ),
                        Text(
                          weightValue.toString(),
                          style: kBwdUnitText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  weightValue--;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  weightValue++;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardDesign(
                    bwdColor: bwdPrimaryColor,
                    bwdChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kBwdLableText,
                        ),
                        Text(
                          ageValue.toString(),
                          style: kBwdUnitText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  if (ageValue <= 1) {
                                    ageValue = 1;
                                  } else {
                                    ageValue--;
                                  }
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  ageValue++;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtomButton(
              buttonText: 'CALCULATE',
              onTap: () {
                // TODO: There are multiple heroes that share the same tag within a subtree.
                setState(() {
                  CalculateBrain _calculateBrain =
                      CalculateBrain(height: hegihtValue, weight: weightValue);
                  print(hegihtValue);
                  print(weightValue);
                  print(_calculateBrain.calculateBrain()); 
                  print(_calculateBrain.getResult()); 
                  print(_calculateBrain.getInterpretation());   
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        getResultDetails: _calculateBrain.getInterpretation(),
                    getResultOverView: _calculateBrain.getResult(),
                    getResultScore: _calculateBrain.calculateBrain(),
                      ),
                    ),
                  );
                });
              }),
        ],
      ),
    );
  }
}
