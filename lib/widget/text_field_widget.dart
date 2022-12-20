import 'package:amazon_clone/utils/color_constant.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {super.key, required this.title, required this.controller, required this.obsecureText, required this.hintTxt});
  final String title;
  final TextEditingController controller;
  final bool obsecureText;
  final String hintTxt;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late FocusNode focusNode;
  bool isInFocus = false;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isInFocus = true;
        });
      } else {
        setState(() {
          isInFocus = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Container(
          height: 45,
          margin: const EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              isInFocus
                  ? BoxShadow(
                      color: orangeColor..withOpacity(0.6),
                      blurRadius: 8,
                      spreadRadius: 2,
                    )
                  : BoxShadow(
                      color: blackColor.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
            ],
          ),
          child: TextField(
            focusNode: focusNode,
            maxLines: 1,
            controller: widget.controller,
            decoration: InputDecoration(
                fillColor: whiteColor,
                filled: true,
                hintText: widget.hintTxt,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: const BorderSide(
                    color: generalBorderColor,
                    width: 1,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: orangeColor,
                    width: 1,
                  ),
                )),
            obscureText: widget.obsecureText,
          ),
        )
      ],
    );
  }
}
