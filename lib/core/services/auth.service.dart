import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:salam_salam/core/services/users.service.dart';
import 'package:salam_salam/core/utils/ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

// add service for firebase auth
class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final _userService = Get.find<UserService>();

  Future<AuthService> init() async {
    return this;
  }

  // sign in with phone number and verification code
  Future signInWithPhoneNumber(String verificationId, String smsCode) async {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User? user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User? currentUser = _auth.currentUser;
      assert(user.uid == currentUser!.uid);

      return 'signInWithPhoneNumber succeeded: $user'; // return user if success
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      // ignore: avoid_log
      log(e.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      // ignore: avoid_log
      log(e.toString());
      return null;
    }
  }

  Future<UserCredential?> registerWithPhoneNumber(
      String phoneNumber,
      PhoneVerificationCompleted onSuccess,
      Function(String, int?) codeSend) async {
    try {
      UserCredential? credentials;
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: onSuccess,
        verificationFailed: (FirebaseAuthException e) {
          Get.log('verificationFailed');
          Get.log(e.toString());
          Get.snackbar("Oups!!!", e.toString());
        },
        codeSent: codeSend,
        codeAutoRetrievalTimeout: (String verificationId) async {
          Get.log('codeAutoRetrievalTimeout');
          Get.snackbar("Oups!!!", "Le code de vérification a expiré");
        },
      );

      return credentials;
    } catch (e) {
      Get.log(e.toString());
      rethrow;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  // if user is signed in, return user, else return null
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // send verification code to phone number
  Future<void> verifyPhoneNumber(String phoneNumber, Function codeSend,
      Function(FirebaseAuthException _) onError) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) => codeSend(credential),
      verificationFailed: (FirebaseAuthException e) => onError(e),
      codeSent: (String verificationId, int? resendToken) async {
        codeSend(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
  // confirm otp code

  // send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<UserCredential> createPhoneCredentials(
      String code, String token) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: token, smsCode: code);

    // Sign the user in (or link) with the credential
    return await signInWithPhoneNumber(token, code);
  }

  // save user in shared preference
  Future<void> saveUserInSharedPreference(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', json.encode(user));
  }

  Future<void> saveUserUuid(String uuid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('uuid', uuid);
  }

  // is Loagged in
  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('user');
  }

  // get user from firebase
  Future<User?> getUserFromFirebase() async {
    return _auth.currentUser;
  }

  // save phone number
  Future<void> savePhoneNumber(String phoneNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('phoneNumber', phoneNumber);
  }

  // get user from preference

  // save user data in firestore

  Future<void> addUserData(
      String uuid, String name, String phone, String? imagePath) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users
        .add({'name': name, 'uuid': uuid, 'phone': phone, 'image': imagePath})
        .then((value) => {log(value.toString())})
        .catchError((e) => {log(e)});
  }
}
