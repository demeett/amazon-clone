import 'package:amazon_clone/utils/color_themes.dart';
import 'package:flutter/material.dart';
import '../utils/contants.dart';

class ProductsShowcaseListView extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ProductsShowcaseListView({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    double height = context.screenHeight / 4;
    double titleHeight = 25;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        width: context.screenWidth,
        height: height,
        color: whiteColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: titleHeight,
              child: Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      "Show more",
                      style: TextStyle(color: activeCyanColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height - 41,
              width: context.screenWidth,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: children,
              ),
            )
          ],
        ),
      ),
    );
  }
}
