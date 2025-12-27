import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouterconfig/simple_routing/screens/product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  static String get routeName => 'home';
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'), centerTitle: true),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.goNamed(
            ProductScreen.routeName,
            pathParameters: {'id': '123456'},
          ),
          child: Text('Product Screen'),
        ),
      ),
    );
  }
}
