import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:urbanattic/constants/global_style.dart';
import 'package:urbanattic/model/attic_model.dart';
import 'package:urbanattic/widget/page_indicator.dart';

class AtticCard extends StatefulWidget {
  final Attic attic;

  const AtticCard({super.key, required this.attic});

  @override
  State<AtticCard> createState() => _AtticCardState();
}

class _AtticCardState extends State<AtticCard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/productList'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.6,
            child: Container(
              clipBehavior: Clip.antiAlias,
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: Colors.grey[200],
              ),
              child: Stack(
                children: [
                  PageView(
                    onPageChanged: (value) {
                      setState(() {
                        _currentIndex = value;
                      });
                    },
                    children: widget.attic.images
                        .map(
                          (image) => CachedNetworkImage(
                            imageUrl: image,
                            fit: BoxFit.cover,
                          ),
                        )
                        .toList(),
                  ),
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: PageIndicator(
                      currentIndex: _currentIndex,
                      length: widget.attic.images.length,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            widget.attic.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Adjidogome • 3km"),
              Text("Ouvert"),
            ],
          ),
        ],
      ),
    );
  }
}
