import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:urbanattic/widget/loading.dart';

void loginWithPhoneNumber(String phoneNumber, BuildContext context) async {
  showLoadinPage(context);
  await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: phoneNumber,
    verificationCompleted: (phoneAuthCredential) =>
        _verificationCompleted(phoneAuthCredential, context),
    verificationFailed: (FirebaseAuthException e) =>
        _verificationFailed(e, context),
    codeSent: (String verificationId, int? resendToken) =>
        _codeSent(verificationId, resendToken, phoneNumber, context),
    codeAutoRetrievalTimeout: (String verificationId) {}, 
  );
}

void _verificationCompleted(
    PhoneAuthCredential credential, BuildContext context) async {
  await FirebaseAuth.instance.signInWithCredential(credential);
}

void _verificationFailed(FirebaseAuthException e, BuildContext context) {
  context.pop();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 8),
      content: Text(e.message ?? ''),
    ),
  );
}

void _codeSent(String verificationId, int? resendToken, String phoneNumber,
    BuildContext context) async {
  context.pop();
  context.push('/confirmateCode/$phoneNumber/$verificationId');
}

Future<UserCredential?> verifySmsCode(
    String verificationId, String smsCode) async {
  try {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  } catch (e) {
    return null;
  }
}
