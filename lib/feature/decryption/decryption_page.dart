import 'package:basics_challenge/feature/decryption/decrypt_controller.dart';
import 'package:flutter/material.dart';

class DecryptionPage extends StatefulWidget {
  const DecryptionPage({super.key});

  @override
  State<DecryptionPage> createState() => _DecryptionPageState();
}

class _DecryptionPageState extends State<DecryptionPage> {
  final TextEditingController _codeController = TextEditingController();
  final DecryptionService _service = DecryptionService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("decrypt message")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _codeController,
              decoration: const InputDecoration(labelText: "enter code"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _service.decryptMessage(_codeController.text);
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const WaitingPage()));
              },
              child: const Text("decrypt"),
            ),
          ],
        ),
      ),
    );
  }
}

class WaitingPage extends StatelessWidget {
  const WaitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DecryptionService service = DecryptionService();
    return Scaffold(
      appBar: AppBar(title: const Text("waiting for message")),
      body: Center(
        child: ValueListenableBuilder<String?>(
          valueListenable: service.decryptedMessage,
          builder: (context, value, _) {
            if (value == null) {
              return const Text("decrypting... please wait");
            }
            return Text(value);
          },
        ),
      ),
    );
  }
}
