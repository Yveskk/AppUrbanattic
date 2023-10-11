import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:file_picker/file_picker.dart';
import 'package:urbanattic/constants/global_style.dart';

class DemandeTerrain extends StatefulWidget {
  const DemandeTerrain({Key? key});

  @override
  _DemandeTerrainState createState() => _DemandeTerrainState();
}

class _DemandeTerrainState extends State<DemandeTerrain> {
  List<String?> files = List.generate(3, (_) => null);

  TextEditingController adresseController = TextEditingController();
  TextEditingController nameProprietaireController = TextEditingController();
  TextEditingController grenierDemandeController = TextEditingController();
  TextEditingController descriptionDemandeController = TextEditingController();

  void _showDataInBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Adresse: ${adresseController.text}'),
                Text('Nom du propriétaire: ${nameProprietaireController.text}'),
                Text('Grenier : ${grenierDemandeController.text}'),
                Text(
                    'Description : ${descriptionDemandeController.text}'),
                const Text(
                  "Pièces Jointes",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12.0),
                for (int index = 0; index < files.length; index++)
                  if (files[index] != null)
                    ListTile(
                      title: Text('Fichier $index : ${files[index]}'),
                    ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Logique de validation
                        Navigator.pop(context); // Fermer le BottomSheet
                      },
                      child: Text('Valider'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Logique d'annulation
                        Navigator.pop(context); // Fermer le BottomSheet
                      },
                      child: Text('Annuler'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showFileDialog(int index) async {
    final isImage = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sélectionner un fichier"),
          content: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Image
                },
                icon: Icon(Icons.image, size: 40.0), // Icône d'image
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // PDF
                },
                icon: Icon(Icons.folder, size: 40.0), // Icône de dossier
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Annuler
                },
                icon: Icon(Icons.cancel, size: 40.0), // Icône d'annulation
              ),
            ],
          ),
        );
      },
    );

    if (isImage != null) {
      final file = await _pickFile(isImage);
      if (file != null) {
        setState(() {
          files[index] = file;
        });
      }
    }
  }

  Future<String?> _pickFile(bool isImage) async {
    final filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: isImage ? ['jpg', 'jpeg', 'png'] : ['pdf'],
    );

    if (filePickerResult != null && filePickerResult.files.isNotEmpty) {
      final filePath = filePickerResult.files.single.path;
      return filePath;
    }

    return null; // Aucun fichier sélectionné
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
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Enrégistrement de la demande ',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: adresseController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.adresse,
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: nameProprietaireController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.nameProprietaire,
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: grenierDemandeController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.grenierDemande,
                ),
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: descriptionDemandeController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.descriptionDemande,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                "Pièces Jointes",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.0),
              Container(
                height: 120.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 100.0,
                      margin: EdgeInsets.only(right: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(
                          color: Colors.grey[500]!,
                        ),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () => _showFileDialog(index),
                          child: files[index] != null
                              ? Text(
                                  files[index]!,
                                  textAlign: TextAlign.center,
                                )
                              : const Icon(
                                  Icons.add,
                                  size: 40.0,
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            _showDataInBottomSheet(), // Affiche les données dans le BottomSheet
        label: Text(AppLocalizations.of(context)!.saveButtonText),
      ),
    );
  }
}
