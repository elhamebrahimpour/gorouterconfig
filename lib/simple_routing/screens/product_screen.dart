import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouterconfig/simple_routing/models/payment.dart';
import 'package:gorouterconfig/simple_routing/screens/details_screen.dart';

class ProductScreen extends StatefulWidget {
  final String id;

  const ProductScreen({super.key, required this.id});

  @override
  State<ProductScreen> createState() => _ProductScreenState();

  static String get routeName => 'product';
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Screen'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: [
            Text('id: ${widget.id}'),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: Text('Back To Home Screen'),
            ),
            ElevatedButton(
              onPressed: () => context.go(
                '/payment',
                extra: Payment(id: 9, price: '6566565'),
              ),
              child: Text('Payment Screen'),
            ),
            ElevatedButton(
              onPressed: () => context.goNamed(
                DetailsScreen.routeName,
                pathParameters: {'id': widget.id},
              ),
              child: Text('Details Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
