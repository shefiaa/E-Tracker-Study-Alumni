import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              // Logout logic (optional)
              Navigator.pushReplacementNamed(context, '/'); // Kembali ke halaman login
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selamat Datang, Para Alumni!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman JobInfoScreen
                Navigator.pushNamed(context, '/job-info');
              },
              child: const Text('Pusat Informasi'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman AlumniListScreen
                Navigator.pushNamed(context, '/alumni-list');
              },
              child: const Text('Lihat, Para Alumni'),
            ),
          ],
        ),
      ),
    );
  }
}
