import 'package:flutter/material.dart';
import 'dashboard.dart'; // Importing dashboard.dart

class Swag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ClaimPointsScreen(),
    );
  }
}

class ClaimPointsScreen extends StatelessWidget {
  // Swag Options
  final List<String> swagOptions = ["T-shirt", "Mug", "Stickers"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Claim Points for Swag'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select your swag:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            SwagOptionsList(swagOptions: swagOptions),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add logic to handle the point claiming
                // Example: claimPoints(selectedSwag);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Points Claimed!'),
                      content: Text('You have successfully claimed your points for swag.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Claim Points'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the Dashboard screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
              child: Text('Go Back to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}

class SwagOptionsList extends StatefulWidget {
  final List<String> swagOptions;

  SwagOptionsList({required this.swagOptions});

  @override
  _SwagOptionsListState createState() => _SwagOptionsListState();
}

class _SwagOptionsListState extends State<SwagOptionsList> {
  String? selectedSwag;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.swagOptions.map((swag) {
        return ListTile(
          title: Text(swag),
          leading: Radio(
            value: swag,
            groupValue: selectedSwag,
            onChanged: (value) {
              setState(() {
                selectedSwag = value as String?;
              });
            },
          ),
        );
      }).toList(),
    );
  }
}
