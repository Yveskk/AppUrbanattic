import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:urbanattic/constants/global_style.dart';
import 'package:urbanattic/provider/login_with_phone_number.dart';
import 'package:urbanattic/widget/loading.dart';

class ConfirmationCodePage extends StatelessWidget {
  final String phoneNumber;
  final String verificationId;
  ConfirmationCodePage(
      {super.key, required this.phoneNumber, required this.verificationId});

  final List<FocusNode> focusNodes = [];
  final List<TextEditingController> controllers = [];
  final int textFieldNumber = 6;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < textFieldNumber; i++) {
      focusNodes.add(FocusNode());
      controllers.add(TextEditingController());
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(loginPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.confirmCodePageTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8.0),
              Text(
                AppLocalizations.of(context)!
                    .confirmCodePageMessage(phoneNumber),
              ),
              const SizedBox(height: 48.0),
              Row(
                children: [
                  for (int i = 0; i < textFieldNumber; i++)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextField(
                          controller: controllers[i],
                          autofocus: true,
                          onChanged: (value) => _onChanged(value, i, context),
                          focusNode: focusNodes[i],
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            hintText: '•',
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You didn't receive the code"),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Resend",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onChanged(String value, int i, BuildContext context) {
    if (value.length == 1 && i < textFieldNumber - 1) {
      focusNodes[1].nextFocus();
    }
    if (i == textFieldNumber - 1) {
      focusNodes[i].unfocus();
    }
    _submitCode(context);
  }

  Future<void> _submitCode(BuildContext context) async {
    String smsCode = "";
    for (int i = 0; i < textFieldNumber; i++) {
      smsCode += controllers[i].text;
    }
    if (smsCode.length == 6) {
      showLoadinPage(context);
      final userCredential = await verifySmsCode(verificationId, smsCode);
      if (context.mounted) {
        if (userCredential != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {
            context.go('/completeProfile');
          } else {
            context.go('/');
          }
        } else {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 6),
              content: Text("Code incorrect"),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      }
    }
  }
}
