import 'package:flutter/material.dart';
import 'package:chelsea_players/screens/home/home.dart';

import 'theme.dart';

void main() {
  runApp(MaterialApp(
    theme: primaryTheme,
    home: Home()
  ));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sandbox'),
        backgroundColor: Colors.grey,
      ),
      body: const Text('sandbox')
    );
  }
}