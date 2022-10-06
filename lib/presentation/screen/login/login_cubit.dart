import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/app/di.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../app/app_prefs.dart';
import '../../resources/route_manger.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final TextEditingController userPhone = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController userEmail = TextEditingController();
  final TextEditingController userPassword = TextEditingController();
  String countryCode = "+20";
  String? resendTokenCode;

  Future<void> login(context) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: userEmail.text, password: userPassword.text)
          .then((value) async {
        _appPreferences.setLoginScreenView();
        await Navigator.of(context).pushReplacementNamed(Routes.home);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        MotionToast.error(
                title: const Text("user not found"),
                description: const Text("No user found for that email."),
                width: 300)
            .show(context);
      } else if (e.code == 'wrong-password') {
        MotionToast.error(
                title: const Text("wrong password"),
                description:
                    const Text("Wrong password provided for that user."),
                width: 300)
            .show(context);
      }
    }
  }

  Future<void> googleSignIn(context) async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
        await _auth.signInWithCredential(authCredential).then((value) async{
          _appPreferences.setLoginScreenView();
          await Navigator.of(context).pushReplacementNamed(Routes.home);
        });

  }

  Future<void> signOut(context) async {
    await _googleSignIn.signOut();
    Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
  }

  Future<void> register(context) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: userEmail.text,
        password: userPassword.text,
      )
          .then((value) async {
        await userSetup().then((value) async {
          _appPreferences.setLoginScreenView();
          MotionToast.success(
                  title: const Text("Success Register"),
                  description: const Text("Thanks to use app"),
                  width: 300)
              .show(context);
          await Navigator.of(context).pushReplacementNamed(Routes.home);
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        MotionToast.error(
                title: const Text("Week Password"),
                description: const Text("The password provided is too weak."),
                width: 300)
            .show(context);
      } else if (e.code == 'email-already-in-use') {
        MotionToast.error(
                title: const Text("email already in use"),
                description:
                    const Text("The account already exists for that email."),
                width: 300)
            .show(context);
      }
    } catch (e) {
      MotionToast.error(title: Text("$e"), description: Text("$e"), width: 300)
          .show(context);
    }
  }

  Future<void> userSetup() async {
    //firebase auth instance to get uuid of user
    final User user = _auth.currentUser!;
    final uid = user.uid;

    FirebaseFirestore.instance.collection('Users').doc(user.uid).set({
      'email': userEmail.text,
      "name": userName.text,
      "password": userPassword.text,
      'uid': uid
    });
  }
}
