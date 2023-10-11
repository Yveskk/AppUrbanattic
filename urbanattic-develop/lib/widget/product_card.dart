import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:urbanattic/model/product.dart';

import '../constants/global_style.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/detailProduct', extra: product),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 0.8,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(radius),
              ),
              child: CachedNetworkImage(
                imageUrl: product.images[0],
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            product.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text.rich(
            TextSpan(
              text: product.price.toString(),
              style: const TextStyle(fontSize: 18),
              children: [
                TextSpan(
                  text: 'woe/kg',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .color!
                        .withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4.0),
          SizedBox(
            height: 32.0,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 0.0,
                ),
              ),
              child: const Text('Add to cart'),
            ),
          ),
        ],
      ),
    );
  }
}
