import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/contants.dart';
import 'package:flutter/material.dart';

class UserDetailsBar extends StatelessWidget {
  final double offset;
  const UserDetailsBar({super.key, required this.offset});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight / 2,
      width: context.screenWidth,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: lightBackgroundaGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.location_on_outlined,
                color: Colors.grey[900],
              ),
            ),
            const Expanded(
              child: Text(
                "Deliver to Demet Demir- Addresssssss ssssssssssssssssssssssssssssssssssssssssssssssss",
                style: TextStyle(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
