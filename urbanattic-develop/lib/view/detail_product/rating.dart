import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text("Avis and note"),
          trailing: Text("Show all"),
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "4.5",
                  style: TextStyle(fontSize: 48.0),
                ),
                RatingBar.builder(
                  itemCount: 5,
                  itemSize: 16.0,
                  initialRating: 3.3,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(height: 4.0),
                const Text(
                  "20 avis",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 45.0),
            Expanded(
              child: Column(
                children: [
                  _avisIndicator("5", 60.0),
                  _avisIndicator("4", 20.0),
                  _avisIndicator("3", 10.0),
                  _avisIndicator("2", 5.0),
                  _avisIndicator("1", 5.0),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24.0),
        _avisItem(
          "Lorem input est une",
          2,
        )
      ],
    );
  }

  Widget _avisIndicator(String avis, double value) {
    return Row(
      children: [
        Text(avis),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            children: [
              LinearProgressIndicator(
                semanticsLabel: avis,
                value: value / 100,
                backgroundColor: Colors.grey[300],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _avisItem(String avis, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  CachedNetworkImageProvider("https://picsum.photos/200"),
              radius: 16,
            ),
            SizedBox(width: 8.0),
            Text("John Doe"),
          ],
        ),
        const SizedBox(height: 8.0),
        RatingBar(
          itemSize: 12,
          tapOnlyMode: true,
          initialRating: value,
          ratingWidget: RatingWidget(
            full: const Icon(Icons.star, color: Colors.amber),
            half: const Icon(Icons.star, color: Colors.amber),
            empty: const Icon(Icons.star, color: Colors.grey),
          ),
          onRatingUpdate: (value) {},
        ),
        const SizedBox(height: 4.0),
        Text(avis),
      ],
    );
  }
}
