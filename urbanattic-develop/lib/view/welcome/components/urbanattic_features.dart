import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List getUrbanatticFeatures(BuildContext context) {
  return [
    {
      "image": 'assets/images/img01.png',
      "title": AppLocalizations.of(context)!.welcomePage1Title,
      "text": AppLocalizations.of(context)!.welcomePage1Message,
    },
    {
      "image": 'assets/images/img02.png',
      "title": AppLocalizations.of(context)!.welcomePage2Title,
      "text": AppLocalizations.of(context)!.welcomePage2Message,
    },
    {
      "image": 'assets/images/img03.png',
      "title": AppLocalizations.of(context)!.welcomePage3Title,
      "text": AppLocalizations.of(context)!.welcomePage3Message,
    },
    {
      "image": 'assets/images/img04.png',
      "title": AppLocalizations.of(context)!.welcomePage4Title,
      "text": AppLocalizations.of(context)!.welcomePage4Message,
    },
  ];
}
