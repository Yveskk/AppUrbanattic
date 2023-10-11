import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:urbanattic/model/product.dart';
import 'package:urbanattic/view/account/account_page.dart';
import 'package:urbanattic/view/cart/cart_page.dart';
import 'package:urbanattic/view/detail_attic/detail_attic.dart';
import 'package:urbanattic/view/detail_product/detail_product.dart';
import 'package:urbanattic/view/favorite/favorite_page.dart';
import 'package:urbanattic/view/home/home_page.dart';
import 'package:urbanattic/view/login/complete_profile.dart';
import 'package:urbanattic/view/login/confirmate_code.dart';
import 'package:urbanattic/view/navigation/custom_navigation_bar.dart';
import 'package:urbanattic/view/notification/notification_page.dart';
import 'package:urbanattic/view/welcome/welcome.dart';

import '../../view/kitchen_share/kitchen.dart';
import '../../view/login/login_page.dart';
import '../../view/reservation/afficherReservation.dart';
import '../../view/reservation/nouvelle_reservation.dart';
import '../../view/ProposerTerrain/components/NouvelDemande.dart';
import '../../view/ProposerTerrain/rechercheService.dart';
import '../../view/services/components/NouvelService.dart';
import '../../view/services/service.dart';

//Key
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

//
final _shellRoute = ShellRoute(
  navigatorKey: _shellNavigatorKey,
  builder: (context, state, child) => CustomNavigationBar(child: child),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/productList',
      builder: (context, state) => const DetailAttic(),
    ),
    GoRoute(
      path: '/favorite',
      builder: (context, state) => const FavoritePage(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartPage(),
    ),
    GoRoute(
      path: '/notification',
      builder: (context, state) => const NotificationPage(),
    ),
    GoRoute(
      path: '/account',
      builder: (context, state) => AccountPage(),
    ),
  ],
);

// root navogator
final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/welcome',
  routes: [
    //navigation bar routes
    _shellRoute,
    GoRoute(
      redirect: (context, state) {
        if (FirebaseAuth.instance.currentUser != null) {
          if (FirebaseAuth.instance.currentUser!.displayName!.isEmpty) {
            return '/completeProfile';
          } else {
            return '/';
          }
        } else {
          return '/welcome';
        }
      },
      path: '/welcome',
      builder: (context, state) => const Welcome(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/detailProduct',
      builder: (context, state) => DetailProduct(
        product: state.extra as Product,
      ),
    ),
    GoRoute(
      path: '/confirmateCode/:phoneNumber/:verificationId',
      builder: (context, state) => ConfirmationCodePage(
        phoneNumber: state.pathParameters['phoneNumber']!,
        verificationId: state.pathParameters['verificationId']!,
      ),
    ),
    GoRoute(  
      path: '/completeProfile',
      builder: (context, state) => CompleteProfile(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/nouvelleReservation',
      builder: (context, state) => const NouvelleReservation(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/afficherReservation',
      builder: (context, state) => const Reservation(),
    ),
     GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/kitchenShare',
      builder: (context, state) => const KitchenShare(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/terrain',
      builder: (context, state) => const RechercheService(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/nouvelleDemande',
      builder: (context, state) => const DemandeTerrain(),
    ),
     GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/serviceTerrain',
      builder: (context, state) => const Service(),
    ),
      GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/demandeService',
      builder: (context, state) => const NouvelDemandes(),
    )
  ],
);
