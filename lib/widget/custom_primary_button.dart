import 'package:amazon_clone/utils/color_constant.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  const CustomMainButton(
      {super.key, required this.child, required this.color, required this.isLoading, required this.onPressed});
  final Widget child;
  final Color color;
  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize: Size(
          screenWidth * 0.6,
          screenHeight * 0.01,
        ),
      ),
      child: isLoading
          ? child
          : const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: CircularProgressIndicator(
                  color: whiteColor,
                ),
              ),
            ),
    );
  }
}
