import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String userName = 'Светлана Копытина';
  final String userEmail = 'addmin_tea@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.teal,
            ),
            const SizedBox(height: 16),
            Text(
              'Имя: $userName',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Email: $userEmail',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Редактировать профиль'),
            ),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Выйти из аккаунта'),
            ),
          ],
        ),
      ),
    );
  }
}