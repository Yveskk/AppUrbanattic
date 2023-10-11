import 'package:flutter/material.dart';

class FeatureTab extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Function()? onTap;
  const FeatureTab({super.key, required this.label, required this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 84,
        child: Column(
          children: [
            CircleAvatar(
              radius: 28.0,
              child: Icon(iconData, size: 32.0),
            ),
            const SizedBox(height: 4.0),
            Text(
              label,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
