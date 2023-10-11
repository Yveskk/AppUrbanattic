import 'package:flutter/material.dart';
import 'package:urbanattic/constants/global_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Reservation extends StatelessWidget {
  const Reservation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.reservationPage,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Date/Heure',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.dateHeure,
              ),
              readOnly: true,
            ),
            const SizedBox(height: 12.0),
            const Text(
              'Nombre Personnes',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.personnes,
              ),
              readOnly: true,
            ),
            const SizedBox(height: 12.0),
            const Text(
              'Grenier',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.grenierText,
              ),
              readOnly: true,
            ),
            const SizedBox(height: 12.0),
            const Row(
              children: [
                Text(
                  'Montant total:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 80.0),
                Text(
                  '10 000 woe',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 16, 17, 17),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Afficher la boîte de dialogue de succès
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Reservation enregistrée"),
                  content: Text(
                      "Votre réservation pour 15 août au grenier Woelabs est enrégistré avec succès "),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pop(); // Fermer la boîte de dialogue
                      },
                      child: Text("OK"),
                    ),
                  ],
                );
              },
            );
          },
          child: Text(AppLocalizations.of(context)!.saveButtonText),
        ),
      ),
    );
  }
}
