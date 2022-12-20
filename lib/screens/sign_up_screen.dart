import 'package:amazon_clone/resources/authentication_methods.dart';
import 'package:amazon_clone/screens/sign_in_screen.dart';
import 'package:amazon_clone/widget/custom_primary_button.dart';
import 'package:amazon_clone/widget/show_snack_bar.dart';
import 'package:amazon_clone/widget/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../utils/color_themes.dart';
import '../utils/contants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final authentications = AuthenticationMethods.instance;
  bool isLoading = true;
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    addressController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SignBody(
                height: context.screenHeight * 0.6,
                width: context.screenWidth * 0.8,
                childLoginTextField: SignUpTextField(
                  nameController: nameController,
                  addressController: addressController,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                childLineWidget: CustomMainButton(
                  color: yellowColor,
                  isLoading: isLoading,
                  onPressed: () async {
                    setState(() {
                      isLoading = false;
                    });
                    final String output = await authentications.signUpUser(
                        name: nameController.text,
                        address: addressController.text,
                        email: emailController.text,
                        password: passwordController.text);

                    output == "success"
                        ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                            return const SignInScreen();
                          }))
                        : AccountSnackBar().showSnackBar(context: context, content: output);
                    setState(() {
                      isLoading = true;
                    });
                  },
                  child: Text(
                    CustomString().signUp,
                    style: const TextStyle(color: blackColor),
                  ),
                ),
                childButton: CustomMainButton(
                    color: generalBorderColor,
                    isLoading: true,
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return const SignInScreen();
                      }));
                    },
                    child: Text(
                      CustomString().back,
                      style: const TextStyle(color: blackColor),
                    )),
              ),
            )
          ],
        ));
  }
}

class SignUpTextField extends StatefulWidget {
  const SignUpTextField(
      {super.key,
      required this.nameController,
      required this.addressController,
      required this.emailController,
      required this.passwordController});

  final TextEditingController nameController;
  final TextEditingController addressController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<SignUpTextField> createState() => _SignUpTextFieldState();
}

class _SignUpTextFieldState extends State<SignUpTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(CustomString().signUp),
        TextFieldWidget(
          hintTxt: CustomString().nameHintText,
          title: CustomString().name,
          controller: widget.nameController,
          obsecureText: false,
        ),
        TextFieldWidget(
          hintTxt: CustomString().addressHintText,
          title: CustomString().address,
          controller: widget.addressController,
          obsecureText: false,
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
      ],
    );
  }
}
