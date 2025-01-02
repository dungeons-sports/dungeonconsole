import 'package:flutter/material.dart';

class StackedContainer extends StatelessWidget {
  final Widget child;
  final double width, height, containerSpacing;
  final EdgeInsets? padding;
  final Color? fillColor;
  const StackedContainer({
    super.key,
    required this.child,
    this.width = 120.0,
    this.height = 80.0,
    this.containerSpacing = 6.0,
    this.padding,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: containerSpacing),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: Colors.grey[900], border: Border.all(color: Colors.white)),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: containerSpacing, left: containerSpacing),
          child: Container(
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
                color: fillColor ?? Colors.grey[900],
                border: Border.all(color: Colors.white)),
            child: child,
          ),
        ),
      ],
    );
  }
}
