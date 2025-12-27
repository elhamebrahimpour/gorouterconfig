import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String? id;

  const DetailsScreen({super.key, this.id});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();

  static String get routeName => 'details';
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Screen'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 24,
          children: [Text('item 1'), Text('item 2'), Text('item 3')],
        ),
      ),
    );
  }
}
