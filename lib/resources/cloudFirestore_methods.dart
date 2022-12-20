import 'package:amazon_clone/model/user_details_model.dart';
import 'package:amazon_clone/resources/authentication_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFireStoreClass {
  FirebaseAuth firebaseAuth = FirebaseAuthMethod().firebaseAuth;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future uploadNameAndAddressToDb({required UserDetailsModel user}) async {
    await firebaseFirestore.collection("users").doc(firebaseAuth.currentUser!.uid).set(user.getJson());
  }
}
