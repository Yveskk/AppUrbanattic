import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:urbanattic/view/welcome/components/urbanattic_features.dart';
import 'package:urbanattic/widget/page_indicator.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int currentPage = 0;
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final urbanatticFeatures = getUrbanatticFeatures(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.appName,
        ),
        centerTitle: true,
        titleTextStyle: Theme.of(context)
            .textTheme
            .headlineLarge
            ?.copyWith(fontWeight: FontWeight.bold),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: OutlinedButton(
              onPressed: _goToLoginScreen,
              child: Text(AppLocalizations.of(context)!.skipButtonText),
            ),
          )
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChange,
        children: urbanatticFeatures.map((feature) {
          return Column(
            children: [
              Image.asset(feature['image']!),
              Text(
                feature['title']!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 8,
                ),
                child: Text(
                  feature['text']!,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PageIndicator(
              currentIndex: currentPage,
              length: urbanatticFeatures.length,
            ),
            FilledButton(
              onPressed: () {
                if (currentPage == urbanatticFeatures.length - 1) {
                  _goToLoginScreen();
                }
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOutSine,
                );
              },
              child: Text(
                AppLocalizations.of(context)!.startButtonText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPageChange(int value) {
    setState(() {
      currentPage = value;
    });
  }

  void _goToLoginScreen() => context.go('/');
}
