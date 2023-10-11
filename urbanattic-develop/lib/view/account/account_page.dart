import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:urbanattic/widget/loading.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: 'https://picsum.photos/250?image=9',
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        radius: 28.0,
                        backgroundImage: imageProvider,
                      ),
                      placeholder: (context, url) => const CircleAvatar(
                        radius: 28.0,
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const CircleAvatar(
                        radius: 32.0,
                        child: Icon(Iconsax.user),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user!.displayName!,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(user!.phoneNumber!),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: const Icon(Iconsax.user),
                      title: const Text('Personal Information'),
                      onTap: () {},
                      trailing: const Icon(Iconsax.arrow_right_34),
                    ),
                    const Divider(height: 0),
                    ListTile(
                      leading: const Icon(Iconsax.security),
                      title: const Text('Security and confidentiality'),
                      onTap: () {},
                      trailing: const Icon(Iconsax.arrow_right_34),
                    ),
                    const Divider(height: 0),
                    ListTile(
                      leading: const Icon(Iconsax.card_tick),
                      title: const Text('Payement'),
                      onTap: () {},
                      trailing: const Icon(Iconsax.arrow_right_34),
                    ),
                    const Divider(height: 0),
                    ListTile(
                      leading: const Icon(Icons.language),
                      title: const Text('Language'),
                      trailing: const Icon(Iconsax.arrow_right_34),
                      onTap: () {},
                    ),
                    const Divider(height: 0),
                    TextButton(
                      onPressed: () => _logOut(context),
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _logOut(BuildContext context) {
    showLoadinPage(context);
    FirebaseAuth.instance.signOut().then((value) {
      context.pop();
      context.go('/login');
    });
  }
}
