import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouterconfig/simple_routing/models/payment.dart';

class PaymentScreen extends StatefulWidget {
  final Payment payment;

  const PaymentScreen({super.key, required this.payment});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();

  static String get routeName => 'payment';
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Screen'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: [
            Text('id: ${widget.payment.id}'),
            Text('price:${widget.payment.price}'),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: Text('Go To Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
