import 'package:flutter/material.dart';
import 'package:hello_app/model/note.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key, required this.tea});

  final Tea tea;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tea.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(tea.image),
            const SizedBox(height: 8.0),
            Text(
              tea.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              tea.description,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              tea.price,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}