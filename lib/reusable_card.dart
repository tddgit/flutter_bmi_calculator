import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final BuildContext context;
  final double height;
  final double width;
  final double widthMargin;
  final Color color;
  final Widget child;

  ReusableCard({
    required this.context,
    required this.height,
    required this.width,
    required this.widthMargin,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xFF1D1E33),
      height: height,
      width: width,
      margin: EdgeInsets.all(widthMargin),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }
}
