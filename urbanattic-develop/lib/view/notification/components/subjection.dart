import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Subjection extends StatelessWidget {
  const Subjection({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileRow(),
              const SizedBox(height: 8.0),
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
          CachedNetworkImage(
            imageUrl: 'https://s3-alpha-sig.figma.com/img/fd34/f2cc/cda79339db9caf90df22a59cb2332f1d?Expires=1695600000&Signature=JIoMkhPe-yLJwVkw479Y8vWCupiLyiqV83a69XMw5mKFrbDHoRU9vZjL~VzrJhmjO1ZIPxcdExb4kNXzIZbks7jMqe~o4SKlsOclpID4a1L3NDigQGkIzXc~P~wsmwrJE6xg-wIshDm6-OrE-Ogmt8CZFh97RN3ubc9SRT7y3qHMKSTZX8IQmGxwJ6Tp0noNBWm3o8M9uw62hrBHkM05hkVbaVfP53MTglN7NSmuA0JZA5LsxaI1hwjC-DKxdA22ES1PRgRs2QSAf37nYml1NtvxwG6IHO5G75dI3dWjbrfeiq-NAYFDDvTlc-uSaSmAalSNCKgFsUnhMWdStBO0GQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
            imageBuilder: (context, imageProvider) => CircleAvatar(
              radius: 28.0,
              backgroundImage: imageProvider,
            ),
            placeholder: (context, url) => const CircleAvatar(
              radius: 28.0,
              child: CircularProgressIndicator(),
            ),
          ),
          const SizedBox(width: 10.0),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Urbanattic',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Uniquement des produits bio',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
