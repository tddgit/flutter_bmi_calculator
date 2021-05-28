import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool maleCardColour = false;
  bool femaleCardColour = false;

  int heightValue = 180;

  void toggleColor(Gender gender) {
    if (gender == Gender.Male) {
      setState(() {
        maleCardColour = !maleCardColour;
      });
    } else {
      setState(() {
        femaleCardColour = !femaleCardColour;
      });
    }
    print(maleCardColour);
    print(femaleCardColour);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final heightSmallContainer = height * 0.25;
    final widthSmallContainer = width * 0.42;
    final heightBigContainer = height * 0.3;
    final widthMargin = (width - (widthSmallContainer * 2)) / 4;
    final widthBigContainer = widthSmallContainer * 2 + widthMargin * 2;
    Color color = Color(0xFF1D1E33);
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      // floatingActionButton: Theme(
      //   data: ThemeData(accentColor: Colors.purple),
      //   child: FloatingActionButton(
      //     onPressed: () {},
      //     child: Icon(Icons.add),
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => toggleColor(Gender.Male),
                  child: ReusableCard(
                    context: context,
                    height: heightSmallContainer,
                    width: widthSmallContainer,
                    widthMargin: widthMargin,
                    color:
                        maleCardColour ? kActiveCardColor : kInactiveCardColor,
                    child: IconContent(
                      width: widthSmallContainer,
                      height: heightSmallContainer,
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => toggleColor(Gender.Female),
                  child: ReusableCard(
                    context: context,
                    height: heightSmallContainer,
                    width: widthSmallContainer,
                    widthMargin: widthMargin,
                    color: femaleCardColour
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: IconContent(
                      width: widthSmallContainer,
                      height: heightSmallContainer,
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ReusableCard(
                context: context,
                height: heightBigContainer,
                width: widthBigContainer,
                widthMargin: widthMargin,
                color: kInactiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          heightValue.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: heightValue.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8DE98),
                      onChanged: (double newValue) {
                        setState(
                          () {
                            heightValue = newValue.round();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ReusableCard(
                context: context,
                height: heightSmallContainer,
                width: widthSmallContainer,
                widthMargin: widthMargin,
                color: color,
                child: IconContent(
                  width: widthSmallContainer,
                  height: heightSmallContainer,
                  icon: FontAwesomeIcons.mars,
                  text: 'MALE',
                ),
              ),
              ReusableCard(
                context: context,
                height: heightSmallContainer,
                width: widthSmallContainer,
                widthMargin: widthMargin,
                color: color,
                child: IconContent(
                  width: widthSmallContainer,
                  height: heightSmallContainer,
                  icon: FontAwesomeIcons.mars,
                  text: 'MALE',
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
