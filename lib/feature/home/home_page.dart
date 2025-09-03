import 'package:basics_challenge/feature/decryption/decryption_page.dart';
import 'package:basics_challenge/feature/dream_destinations/destinations_page.dart';
import 'package:basics_challenge/feature/extensions/extensions_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, dynamic>> tasks = [
    {"title": "Task 1: Extensions", "page": ExtensionsPage()},
    {"title": "Task 2: Decryption", "page": DecryptionPage()},
    {"title": "Task 3: Dream Destinations", "page": DestinationsPage()},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Multi-Task App")),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: tasks.length,
        separatorBuilder: (_, __) => SizedBox(height: 16),
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => task['page']),
              );
            },
            child: Text(
              task['title'],
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
