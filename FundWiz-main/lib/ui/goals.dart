import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'dashboard.dart'; // Importing dashboard.dart

class Goals extends StatefulWidget {
  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  final Box _goalsBox = Hive.box('goals');
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  int _stars = 0;

  @override
  void dispose() {
    _nameController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void _addGoal() {
    String name = _nameController.text;
    int value = int.tryParse(_valueController.text) ?? 0;

    if (name.isNotEmpty && value > 0) {
      int stars = (value / 10).toInt();
      _goalsBox.add({'name': name, 'value': value, 'stars': stars}); // Updated to store 'stars'
      _nameController.clear();
      _valueController.clear();
      setState(() {
        _stars = stars;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Your Goals'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Goal Name'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _valueController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Goal Value'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _addGoal,
                  child: Text('Add Goal'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  },
                  child: Text('Continue to Dashboard'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
