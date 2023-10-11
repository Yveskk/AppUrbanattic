import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CustomNavigationBar extends StatefulWidget {
  final Widget child;

  const CustomNavigationBar({super.key, required this.child});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _exit,
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            switch (_currentIndex) {
              case 1:
                context.go('/favorite');
              case 2:
                context.go('/cart');
              case 3:
                context.go('/notification');
              case 4:
                context.go('/account');
              default:
                context.go('/');
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home_1),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.heart),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.shopping_bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.notification),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  //Confirme if you exit
  Future<bool> _exit() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Exit"),
        content: const Text('Are you sure you want to exit?'),
        actions: [
          OutlinedButton(
            onPressed: () => context.pop(false),
            child: const Text('No'),
          ),
          FilledButton(
            onPressed: () => context.pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
