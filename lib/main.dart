import 'package:amazon_clone/firebase_options.dart';
import 'package:amazon_clone/layout/screen_layout.dart';
import 'package:amazon_clone/resources/authentication_methods.dart';
import 'package:amazon_clone/screens/sign_in_screen.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AmazoneClone());
}

class AmazoneClone extends StatelessWidget {
  const AmazoneClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Amazon Clone",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: StreamBuilder(
          stream: FirebaseAuthMethod().authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(backgroundColor: orange),
              );
            } else if (snapshot.hasData) {
              //Eğer kullanıcım varsa daha önceden giriş yapmış ve çıkmamışsa demek
              //FirebaseAuth.instance.signOut();
              return const ScreenLayout();
            } else {
              return const SignInScreen();
            }
          }),
    );
  }
}
