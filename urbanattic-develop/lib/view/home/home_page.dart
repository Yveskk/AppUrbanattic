import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/list_attics.dart';
import 'components/attic_card.dart';
import 'components/feature_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide.none,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: 80.0,
                title: const Text("Bonjour, bienvenue"),
                titleTextStyle:
                    Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FeatureTab(
                        onTap: () => context.push("/kitchenShare"),
                        iconData: Icons.kitchen,
                        label: AppLocalizations.of(context)!.sharedKitchen,
                      ),
                      const SizedBox(width: 16.0),
                      FeatureTab(
                        onTap:()=> context.push("/terrain"),
                        iconData: Icons.public_outlined,
                        label: AppLocalizations.of(context)!.offerPlot,
                      ),
                      const SizedBox(width: 16.0),
                      FeatureTab(
                        onTap: ()=> context.push("/serviceTerrain"),
                        iconData: Icons.home_repair_service_rounded,
                        label: AppLocalizations.of(context)!.offerServices,
                      ),
                    ],
                  ),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(bottom: 8.0),
                sliver: SliverToBoxAdapter(
                  child: Divider(),
                ),
              ),
            ];
          },
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(AppLocalizations.of(context)!.chooseAtticTitle),
                pinned: true,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(40.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: _outlineInputBorder,
                        border: _outlineInputBorder,
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText:
                            AppLocalizations.of(context)!.searchAtticHintText,
                        prefixIcon: const Icon(Iconsax.search_normal_1),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.filter_list_rounded),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverList.list(
                  children: [
                    const SizedBox(height: 16.0),
                    Text(AppLocalizations.of(context)!.nearestAttics),
                    const SizedBox(height: 8.0),
                    ...listAttic
                        .map(
                          (attic) => Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: AtticCard(attic: attic),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
