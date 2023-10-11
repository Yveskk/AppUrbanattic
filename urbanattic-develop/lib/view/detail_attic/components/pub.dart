import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:urbanattic/widget/page_indicator.dart';

import '../../../constants/global_style.dart';

class Pub extends StatefulWidget {
  const Pub({super.key});

  @override
  State<Pub> createState() => _PubState();
}

class _PubState extends State<Pub> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 2.4,
          child: Container(
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(radius),
            ),
            child: CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }),
              items: [
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://dsm01pap007files.storage.live.com/y4mFuXgqaiCYqNOLEphU1JKL8jzo8NmdN8PTHohpAOPAIONaydsHmX9EgEQ3rCuPSncoeza9BiQDJdgNubCjK67kPXwPkS58kkY31liVWRoXa_FwIFt6BT-_GOZj5RoqZXdA8RBVdQTMXR8yeuQOwmeK6i4RGGRAHBpqAGPDpRFUE9Jo4a2VddugvIY-_imMYKaaZFIITskXwqphC9qvZTh-WwxSZ3zrTuT7xNLHjrHZhg?encodeFailures=1&width=1127&height=633',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 164,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://dsm01pap007files.storage.live.com/y4myaXfao1i-zjJ9isHM8asejrYz-H6H047zwB3NJIc04oJoCiizUV5POSZ_piN_FdMdrfERFufcx5z2-Sf40Ih4gS7E3cZj2z5qHZBtw_f5VBNLiLO6WsLK3O9r9rQiVSMx7fRxKQHMRD3DcvHkGfQBL-xE9rPyjNW0KQPbxq-NIVSGz_bW28BiF36mRIghnAl7mhTGSKe51uMkDgpJz3iG9f50wk7AB4L3nCddEXkkVQ?encodeFailures=1&width=1366&height=590',
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) {
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          left: 12,
          child: PageIndicator(
            currentIndex: _currentIndex,
            length: 2,
          ),
        )
      ],
    );
  }
}
