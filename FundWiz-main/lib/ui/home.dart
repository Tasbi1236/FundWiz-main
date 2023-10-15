import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'login.dart';
import 'goals.dart'; // Importing goals.dart

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key); // Corrected the super call

  final Box _boxLogin = Hive.box("login");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Teen App"),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              child: IconButton(
                onPressed: () {
                  _boxLogin.clear();
                  _boxLogin.put("loginStatus", false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Login();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.logout_rounded),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome ",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 10),
          Text(
            _boxLogin.get("userName") ?? "", // Handling null value
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 20), // Added spacing
          ElevatedButton( // Added the button
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Goals()),
              );
            },
            child: const Text('Add Your Goals'),
          ),
        ],
      ),
    );
  }
}
