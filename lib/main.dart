import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About me',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _likes = 0;

  void _like() {
    setState(() {
      _likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab L1 · 67103150'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle, size: 120, color: Colors.indigo),
            const SizedBox(height: 16),
            const Text(
              'ไชยภัทร อ่อนวันนา',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text('Chaiyaphat Onwanna', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 32),
            Text('Likes: $_likes', style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: _like,
              icon: const Icon(Icons.thumb_up),
              label: const Text('Like'),
            ),
          ],
        ),
      ),
    );
  }
}
