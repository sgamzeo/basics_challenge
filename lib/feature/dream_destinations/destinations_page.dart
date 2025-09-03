import 'package:flutter/material.dart';
import 'destinations_service.dart';

class DestinationsPage extends StatefulWidget {
  const DestinationsPage({super.key});

  @override
  State<DestinationsPage> createState() => _DestinationsPageState();
}

class _DestinationsPageState extends State<DestinationsPage> {
  final DestinationsService _service = DestinationsService();
  bool visited = false;
  int count = 0;
  String name = "";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _countController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final data = await _service.loadDestination();
    setState(() {
      visited = data["visited"];
      count = data["count"];
      name = data["name"];
      _nameController.text = name;
      _countController.text = count.toString();
    });
  }

  Future<void> _saveData() async {
    await _service.saveDestination(
      visited: visited,
      count: int.tryParse(_countController.text) ?? 0,
      name: _nameController.text,
    );

    setState(() {
      name = _nameController.text;
      count = int.tryParse(_countController.text) ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("dream destinations")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "destination name"),
            ),
            TextField(
              controller: _countController,
              decoration: const InputDecoration(labelText: "visit count"),
              keyboardType: TextInputType.number,
            ),
            SwitchListTile(
              title: const Text("visited before?"),
              value: visited,
              onChanged: (v) => setState(() => visited = v),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _saveData, child: const Text("save")),
            const SizedBox(height: 20),
            Text("saved: $name, visited: $visited, count: $count"),
          ],
        ),
      ),
    );
  }
}
