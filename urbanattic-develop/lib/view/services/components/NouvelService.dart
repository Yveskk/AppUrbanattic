import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:urbanattic/constants/global_style.dart';

class NouvelDemandes extends StatefulWidget {
  const NouvelDemandes({Key? key});

  @override
  _NouvelDemandeState createState() => _NouvelDemandeState();
}

class _NouvelDemandeState extends State<NouvelDemandes> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _grenierDemandeController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? selectedPerson = 'Moi-même';

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Personne : $selectedPerson'),
              ),
              ListTile(
                title: Text('Titre : ${_titreController.text}'),
              ),
              ListTile(
                title: Text('Grenier  : ${_grenierDemandeController.text}'),
              ),
              ListTile(
                title: Text('Description  : ${_descriptionController.text}'),
              ),
              ButtonBar(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Valider'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Annuler'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'Recherche travail',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: pagePadding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12.0),
              DropdownButtonFormField<String>(
                value: selectedPerson,
                onChanged: (newValue) {
                  setState(() {
                    selectedPerson = newValue;
                  });
                },
                items: <String>['Moi-même', 'Autre personne']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Sélectionnez une option',
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: _titreController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.titre,
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: _grenierDemandeController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.grenierDemande,
                ),
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.descriptionDemande,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _showBottomSheet(context);
          }
        },
        label: Text(AppLocalizations.of(context)!.saveButtonText),
      ),
    );
  }
}
