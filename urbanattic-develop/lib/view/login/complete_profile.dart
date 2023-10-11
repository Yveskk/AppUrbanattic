import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:urbanattic/constants/global_style.dart';
import 'package:urbanattic/widget/loading.dart';

class CompleteProfile extends StatelessWidget {
  CompleteProfile({super.key});

  final _formKey = GlobalKey<FormState>();
  final _lastNameController = TextEditingController();
  final _firstNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.completeProfilePageTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: pagePadding),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.completeProfilePageMessage,
              ),
              const SizedBox(height: 32.0),
              const CircleAvatar(
                radius: 40.0,
                child: Icon(Iconsax.user),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  hintText:
                      AppLocalizations.of(context)!.lastNameNameTextFieldHint,
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.fistNameTextFieldHint,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _save(context),
        label: Text(AppLocalizations.of(context)!.saveButtonText),
      ),
    );
  }

  void _save(BuildContext context) async {
    showLoadinPage(context);
    try {
      if (_formKey.currentState!.validate()) {
        var user = FirebaseAuth.instance.currentUser;
        await user!.updateDisplayName(
            '${_firstNameController.text} ${_lastNameController.text}');
        if (context.mounted) {
          // close loading
          context.pop();
          //go to home
          context.go('/');
        }
      }
    } catch (e) {
      if (context.mounted) {
        // close loading
        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error to save information'),
          ),
        );
      }
    }
  }
}
