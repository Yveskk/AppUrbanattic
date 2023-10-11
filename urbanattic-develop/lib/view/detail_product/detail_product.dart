import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:urbanattic/model/product.dart';
import 'package:urbanattic/view/detail_product/rating.dart';

class DetailProduct extends StatefulWidget {
  final Product product;
  const DetailProduct({super.key, required this.product});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 260,
            leading: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.surface,
              ),
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
            flexibleSpace: CarouselSlider(
              items: widget.product.images
                  .map(
                    (e) => CachedNetworkImage(
                      imageUrl: e,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => _imagePlaceholder(),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                aspectRatio: 1,
              ),
            ),
          ),
          SliverList.list(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.product.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const Divider(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4.0),
                    const Text(
                      "Lorem input est une suite de mot sans signification utiliser pour la mise en forme",
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Read more",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Rating()
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "2 500",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Text("woe"),
              ],
            ),
            FilledButton(
              onPressed: () {},
              child: const Text('Add to cart'),
            )
          ],
        ),
      ),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey[200],
    );
  }
}
