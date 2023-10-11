import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Achat extends StatelessWidget {
  const Achat({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Paiement'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50.0, // Largeur réduite du carré
            height: 50.0, // Hauteur réduite du carré
            child: CachedNetworkImage(
              imageUrl: 'https://s3-alpha-sig.figma.com/img/72d3/a2e4/fe6ca68769a0fdb1498aa413b9d4f944?Expires=1696204800&Signature=qfTSdzpkEc4C1PQupF1BirA-lSHjdOy-HDEM8JZKc9NyFIbdiioUd7iqOvfHK9f~kzbZKzycaLNAGUT0EmFXy7DekVNtisDHAr3LmEvaWrId8fA-IZNcGJiFO5ceqv7QjXDs-S8~aTQ7qaZoVHp~ErXscUq1-A8AiK9~eIBSXxld5DuNNva9n1a79HF~iNkDBlFUBiNTLjQlAi6aVYk351jpsdaO9pXHsglakUSbcnORI7B~t4UlGoWWPW1gY7QfHASaHcL7cT0zgIwE2cO94a-Mdr1j2sQKQvctyQpr8QSnSv1ANMpW~I567iBED9hzSvC28JKSwWu6SuKQdmMzuA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
              imageBuilder: (context, imageProvider) => Image(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
            ),
          ),
          const SizedBox(width: 10.0),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Montant disponible',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                '160 500woe',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold, 
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
