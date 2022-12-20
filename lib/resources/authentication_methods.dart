import 'package:amazon_clone/model/user_details_model.dart';
import 'package:amazon_clone/resources/cloudFirestore_methods.dart';
import 'package:amazon_clone/utils/contants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods {
  AuthenticationMethods._();
  static final AuthenticationMethods instance = AuthenticationMethods._();

  Future<String> signUpUser(
      {required String name, required String address, required String email, required String password}) async {
    TrimClass().trimAccount(name, address, email, password);

    String output = CustomString().wrongOutput;
    if (name != "" && address != "" && email != "" && password != "") {
      try {
        await FirebaseAuthMethod().createUserWithEmailAndPassword(email, password);
        await CloudFireStoreClass().uploadNameAndAddressToDb(user: UserDetailsModel(name: name, address: address));
        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = CustomString().nullOutput;
    }
    return output;
  }

  Future<String> signInUser({required String email, required String password}) async {
    email.trim();
    password.trim();
    String output = "You couldnt sign in. ";
    if (email != "" && password != "") {
      try {
        await FirebaseAuthMethod().signInWithEmailAndPassword(email, password);
        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "You must filled";
    }
    return output;
  }
}

class FirebaseAuthMethod {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Stream<User?> authStateChanges() {
    return firebaseAuth.authStateChanges();
  }

  Future<User?> getCurrentUser() async {
    return firebaseAuth.currentUser;
  }
}

class TrimClass {
  void trimAccount(String name, String address, String email, String password) {
    name.trim();
    address.trim();
    email.trim();
    password.trim();
  }
}
