import 'package:flutter/material.dart';
import 'package:urbanattic/constants/list_products.dart';
import 'package:urbanattic/widget/grid_adaptive.dart';
import 'package:urbanattic/widget/product_card.dart';

import 'components/home_app_bar.dart';
import 'components/pub.dart';

class DetailAttic extends StatelessWidget {
  const DetailAttic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const HomeAppBar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            //List of pub
            const Pub(),
            const SizedBox(height: 24.0),
            Text(
              'Nos produits',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8.0),
            // List of product in attic
            GridAdaptive(
              children: listProduct
                  .map((product) => ProductCard(product: product))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
