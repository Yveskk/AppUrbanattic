import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax/iconsax.dart';
import 'package:urbanattic/constants/global_style.dart';
import 'package:urbanattic/constants/list_of_countries.dart';
import 'package:urbanattic/provider/login_with_phone_number.dart';
import 'package:urbanattic/view/login/components/choose_country.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _inputBorderNone = const OutlineInputBorder(
    borderSide: BorderSide.none,
  );

  // Select Togo as default country
  Map<String, dynamic> _country = listOfCountries[0];
  final _codeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _codeController.text = _country['code']!;
    _countryController.text = '${_country['flag']} ${_country['name']}';

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(loginPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.loginPageTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8.0),
              Text(
                AppLocalizations.of(context)!.loginPageMessage,
              ),
              const SizedBox(height: 24.0),
              TextField(
                controller: _countryController,
                readOnly: true,
                onTap: () => _chooseCountry(context),
                decoration: InputDecoration(
                  suffixIcon: const Icon(Iconsax.arrow_down_1),
                  hintText: AppLocalizations.of(context)!.chooseCountryHintText,
                ),
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  prefixIcon: SizedBox(
                    width: 64,
                    child: TextField(
                      readOnly: true,
                      controller: _codeController,
                      decoration: InputDecoration(
                        enabledBorder: _inputBorderNone,
                        focusedBorder: _inputBorderNone,
                        border: _inputBorderNone,
                        hintText: '---',
                      ),
                    ),
                  ),
                  hintText: AppLocalizations.of(context)!.phoneNumberHintText,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _login,
        child: const Icon(Iconsax.arrow_right_1),
      ),
    );
  }

  void _chooseCountry(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ChooseCountry(
        currentCountry: _country,
        onTap: (country) {
          setState(() {
            _country = country;
          });
        },
      ),
    );
  }

  void _login() {
    if (_phoneController.text.length < _country['phoneNumberLength']) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid phone number"),
        ),
      );
    } else {
      String phoneNumber = '+${_codeController.text}${_phoneController.text}';
      loginWithPhoneNumber(phoneNumber, context);
    }
  }
}
