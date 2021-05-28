import 'package:flutter/cupertino.dart';

import 'constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    Key? key,
    required this.width,
    required this.height,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final double width;
  final double height;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height * 0.1),
        Icon(icon, size: width * 0.7),
        SizedBox(height: height * 0.05),
        Text(
          text,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
