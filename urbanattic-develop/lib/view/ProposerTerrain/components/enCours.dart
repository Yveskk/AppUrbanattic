import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:urbanattic/constants/global_style.dart';

class Encours extends StatelessWidget {
  const Encours({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32.0),
            const Row(
              children: [
                Icon(Icons.location_on),
                Text("Grenier Woelab"),
                // Remplacez cela par l'icône de géolocalisation souhaitée
              ],
            ),
            const SizedBox(height: 10), // Espacement entre les lignes

            // Barre séparatrice
            const Divider(
              height: 20,
              thickness: 2,
              color: Colors.black, // Couleur de la barre
            ),

            const SizedBox(height: 10),

            const Text("12/05/22 * 8h30 - 10h00"),
            SizedBox(height: 10), // Espacement entre les lignes

            // Troisième ligne : Texte en gras "N°147852" avec soulignement et taille augmentée
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                    text: "N° : 147852",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 24, // Augmenter la taille de la police
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10), // Espacement entre les lignes

            // Quatrième ligne : Texte "Etat : " suivi de "En cours" en vert citron
            Row(
              children: [
                const Text("Etat : "),
                Container(
                  color: Colors.limeAccent, // Couleur d'arrière-plan
                  padding: const EdgeInsets.all(8.0), // Espacement interne
                  child: const Text(
                    "En cours",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/nouvelleDemande'),
        label: Text(AppLocalizations.of(context)!.nouvelButtonText),
      ),
    );
  }
}
