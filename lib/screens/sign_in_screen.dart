import 'dart:developer';

import 'package:amazon_clone/resources/authentication_methods.dart';
import 'package:amazon_clone/screens/sign_up_screen.dart';
import 'package:amazon_clone/utils/color_constant.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/contants.dart';
import 'package:amazon_clone/widget/custom_primary_button.dart';
import 'package:amazon_clone/widget/show_snack_bar.dart';
import 'package:amazon_clone/widget/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = true;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SignBody(
        height: context.screenHeight * 0.5,
        width: context.screenWidth * 0.8,
        childLoginTextField: LoginTextField(
          emailController: emailController,
          passwordController: passwordController,
          isLoading: isLoading,
        ),
        childLineWidget: lineWidget(),
        childButton: const CreateAmazonButton(),
      ),
    );
  }

  Row lineWidget() {
    return Row(
      children: [
        lineContainer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            CustomString().newAmazon,
            style: const TextStyle(color: generalBorderColor),
          ),
        ),
        lineContainer(),
      ],
    );
  }

  Expanded lineContainer() {
    return Expanded(
        child: Container(
      height: 1,
      color: generalBorderColor,
    ));
  }
}

class CreateAmazonButton extends StatelessWidget {
  const CreateAmazonButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomMainButton(
      color: generalBorderColor,
      isLoading: true,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const SignUpScreen();
        }));
      },
      child: Text(
        CustomString().amazonAccount,
        maxLines: 1,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}

class LoginTextField extends StatefulWidget {
  LoginTextField({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.isLoading,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  bool isLoading;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          CustomString().signInText,
          style: const TextStyle(fontSize: 33, fontWeight: FontWeight.w500),
        ),
        TextFieldWidget(
          hintTxt: CustomString().emailHintText,
          title: CustomString().emailText,
          controller: widget.emailController,
          obsecureText: false,
        ),
        TextFieldWidget(
          hintTxt: CustomString().passwordHintText,
          title: CustomString().passwordText,
          controller: widget.passwordController,
          obsecureText: true,
        ),
        Align(
          alignment: Alignment.center,
          child: CustomMainButton(
            color: yellowColor,
            isLoading: widget.isLoading,
            onPressed: () async {
              setState(() {
                widget.isLoading = false;
              });
              final String output = await AuthenticationMethods.instance
                  .signInUser(email: widget.emailController.text, password: widget.passwordController.text);
              output == "success" ? log("welcome") : AccountSnackBar().showSnackBar(context: context, content: output);
              setState(() {
                widget.isLoading = true;
              });
            },
            child: Text(
              CustomString().signInText,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}

class SignBody extends StatelessWidget {
  const SignBody(
      {super.key,
      required this.childLoginTextField,
      required this.childButton,
      required this.childLineWidget,
      required this.height,
      required this.width});
  final Widget childLoginTextField;
  final Widget childLineWidget;
  final double height;
  final double width;
  final Widget childButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: context.screenHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                amazonLogo,
                height: context.screenHeight * 0.1,
              ),
              FittedBox(
                child: Container(
                    height: height,
                    width: width,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: generalBorderColor,
                        width: 1,
                      ),
                    ),
                    child: childLoginTextField),
              ),
              childLineWidget,
              childButton
            ],
          ),
        ),
      ),
    );
  }
}
