import 'package:amazon_clone/utils/color_themes.dart';
import 'package:flutter/material.dart';

class AccountSnackBar {
  showSnackBar({required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: orangeColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        content: Text(
          content,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
