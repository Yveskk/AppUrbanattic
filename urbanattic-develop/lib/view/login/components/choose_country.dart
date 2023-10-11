import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:urbanattic/constants/list_of_countries.dart';

class ChooseCountry extends StatefulWidget {
  final Function(Map<String, dynamic> country) onTap;
  final Map<String, dynamic> currentCountry;
  const ChooseCountry(
      {super.key, required this.onTap, required this.currentCountry});

  @override
  State<ChooseCountry> createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {
  Map<String, dynamic>? _country;

  @override
  Widget build(BuildContext context) {
    // Default country selected
    _country = widget.currentCountry;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 4.0,
            ),
            child: Text(
              AppLocalizations.of(context)!.chooseCountryTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Divider(),
          Column(
            children: listOfCountries
                .map(
                  (country) => ListTile(
                    onTap: () => _onSelect(country),
                    title: Text('${country['flag']} ${country['name']}'),
                    trailing: Radio<Map>(
                      value: country,
                      groupValue: _country,
                      onChanged: (value) {},
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  void _onSelect(Map<String, dynamic> country) {
    setState(() {
      _country = country;
    });
    widget.onTap(country);
    context.pop();
  }
}
