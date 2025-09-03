// lib/extensions/extensions_page.dart
import 'package:flutter/material.dart';
import 'extensions.dart';

class ExtensionsPage extends StatefulWidget {
  const ExtensionsPage({super.key});

  @override
  State<ExtensionsPage> createState() => _ExtensionsPageState();
}

class _ExtensionsPageState extends State<ExtensionsPage> {
  final TextEditingController _stringController = TextEditingController();
  final TextEditingController _intController = TextEditingController();
  String _stringResult = '';
  String _intResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Extensions Test')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // string input
              TextField(
                controller: _stringController,
                decoration: const InputDecoration(labelText: 'Enter a string'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  String input = _stringController.text;
                  setState(() {
                    _stringResult =
                        'isPalindrome: ${input.isPalindrome}, isAlphabetic: ${input.isAlphabetic}';
                  });
                },
                child: const Text('Test String'),
              ),
              Text(_stringResult),
              const Divider(height: 32),

              // int input
              TextField(
                controller: _intController,
                decoration: const InputDecoration(
                  labelText: 'Enter an integer',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  int? number = int.tryParse(_intController.text);
                  if (number == null) {
                    setState(() => _intResult = 'Invalid number');
                    return;
                  }
                  setState(() {
                    _intResult = 'isPrime: ${number.isPrime}';
                  });
                },
                child: const Text('Test Int'),
              ),
              Text(_intResult),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _stringController.dispose();
    _intController.dispose();
    super.dispose();
  }
}
