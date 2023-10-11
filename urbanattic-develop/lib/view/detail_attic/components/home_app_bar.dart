import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants/global_style.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: () => context.go('/'),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Iconsax.location),
          const SizedBox(width: 4.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Grenier woelabs',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Adjidogomé • 3km',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
          const SizedBox(width: 12.0),
          const Icon(Iconsax.arrow_down_1),
        ],
      ),
    );
  }
}
