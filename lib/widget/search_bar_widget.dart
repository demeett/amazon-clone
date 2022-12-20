import 'package:amazon_clone/screens/search_screen.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/contants.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget with PreferredSizeWidget {
  final bool isReadOnly;
  final bool hasBackButton;
  SearchBarWidget({Key? key, required this.isReadOnly, required this.hasBackButton})
      : preferredSize = const Size.fromHeight(kAppBarHeight),
        super(key: key);
  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: const BorderSide(
      color: generalBorderColor,
      width: 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          hasBackButton
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                )
              : Container(),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: blackColor.withOpacity(
                    0.2,
                  ),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(0, 5))
            ]),
            width: context.screenWidth * 0.7,
            child: TextField(
              readOnly: isReadOnly,
              onTap: () {
                if (isReadOnly) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const SearchScreen();
                    },
                  ));
                }
              },
              decoration: InputDecoration(
                hintText: "Search for something in amazon",
                fillColor: whiteColor,
                filled: true,
                border: border,
                focusedBorder: border,
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.mic_none_outlined))
        ],
      ),
    );
  }

  @override
  final Size preferredSize;
}
