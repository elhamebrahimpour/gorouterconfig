import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouterconfig/shell_souting/bottom_navigation_shell.dart';
import 'package:gorouterconfig/shell_souting/screens/favorites_screen.dart';
import 'package:gorouterconfig/shell_souting/screens/music_screen.dart';
import 'package:gorouterconfig/shell_souting/screens/profile_screen.dart';
import 'package:gorouterconfig/shell_souting/screens/settings_screen.dart';
import 'package:gorouterconfig/simple_routing/models/payment.dart';
import 'package:gorouterconfig/simple_routing/screens/payment_screen.dart';
import 'package:gorouterconfig/simple_routing/screens/details_screen.dart';
import 'package:gorouterconfig/simple_routing/screens/home_screen.dart';
import 'package:gorouterconfig/simple_routing/screens/product_screen.dart';

final shellGoRouter = GoRouter(
  initialLocation: '/musics',
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(title: Text('Routing Error'), centerTitle: true),
    body: Center(
      child: ElevatedButton.icon(
        onPressed: () {
          context.go('/musics');
        },
        label: Text('Back To Musics'),
        icon: Icon(Icons.arrow_back),
      ),
    ),
  ),
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return BottomNavigationShell(
          location: state.uri.toString(),
          child: child,
        );
      },
      routes: [
        GoRoute(path: '/musics', builder: (context, state) => MusicScreen()),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => FavoritesScreen(),
        ),
        GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
        GoRoute(
          path: '/settings',
          builder: (context, state) => SettingsScreen(),
        ),
      ],
    ),
  ],
);

final simpleGoRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.routeName,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      name: ProductScreen.routeName,
      builder: (context, state) {
        final id = state.pathParameters['id'];

        return ProductScreen(id: id ?? '');
      },
      routes: [
        GoRoute(
          path: '/details',
          name: DetailsScreen.routeName,
          builder: (context, state) {
            final id = state.pathParameters['id'];

            return DetailsScreen(id: id);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/payment',
      name: PaymentScreen.routeName,
      builder: (context, state) {
        final payment = state.extra as Payment;

        return PaymentScreen(payment: payment);
      },
    ),
  ],
);
