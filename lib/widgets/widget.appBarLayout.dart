import 'package:flutter/material.dart';

class AppBarLayoutWidget extends StatelessWidget {
  const AppBarLayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      alignment: Alignment.center,
      child: Row(
        children: [
          Image.asset(
            width: 80,
            height: 80,
            'assets/icons/app_icon.png',
          ),
        ],
      ),
    );
  }
}
