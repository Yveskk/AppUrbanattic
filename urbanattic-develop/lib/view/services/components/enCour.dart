import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:urbanattic/constants/global_style.dart';

class Encour extends StatelessWidget {
  const Encour({super.key});

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
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              height: 20,
              thickness: 2,
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            Text("12/05/22 * 8h30 - 10h00"),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                    text: "N° : 147852",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text("Etat : "),
                Container(
                  color: Colors.limeAccent,
                  padding: const EdgeInsets.all(8.0),
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
        onPressed: () => context.push('/demandeService'),
        label: Text(AppLocalizations.of(context)!.nouvelButtonText),
      ),
    );
  }
}
