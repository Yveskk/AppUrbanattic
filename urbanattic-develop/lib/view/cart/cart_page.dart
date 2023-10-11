import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Panier',
                      style: TextStyle(
                        fontSize: 24.0, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0), 
                ],
              ),
              _buildProfileRow("Tomates fraiches", "550woe/kg", "250woe"),
              const SizedBox(height: 8.0),
              _buildProfileRow("Tomates fraiches", "550woe/kg", "250woe"),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/achat'),
        label: Text('Payer'), 
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Centre le bouton en bas de l'écran.
    );
  }

  Widget _buildProfileRow(String productName, String productPrice, String productQuantity) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.0, 
            height: 100.0, 
            decoration: BoxDecoration(
              shape: BoxShape.rectangle, 
              borderRadius: BorderRadius.circular(8.0), 
              image: const DecorationImage(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
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
