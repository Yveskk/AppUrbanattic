import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Encour extends StatelessWidget {
  const Encour({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileRow(
                  "Date/heure", "15/08/2023 * 8h30-10h00", "250woe"),
              const SizedBox(height: 8.0),
              _buildProfileRow("Tomates fraiches", "550woe/kg", "250woe"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/nouvelleReservation'),
        label: Text('Nouvelle Reservation'),
      ),
    );
  }

  Widget _buildProfileRow(
      String productName, String productPrice, String productQuantity) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  'https://img.freepik.com/photos-gratuite/chili-frais-plateau-bois-du-citron-feuilles-lime-kaffir_1150-25962.jpg?size=626&ext=jpg&uid=R32696892&semt=ais',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.location_on, color: Colors.black),
                  SizedBox(width: 4.0),
                  Text(
                    'Grenier Woelab',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                productName,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                productPrice,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                productQuantity,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Color.fromARGB(255, 7, 7, 7),
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
