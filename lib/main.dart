import 'package:game_characters/services/character_store.dart';
import 'package:flutter/material.dart';
import 'package:game_characters/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'theme.dart';

//firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
     // Wrap the App with the Provider (step 3)
    ChangeNotifierProvider(
     // Create a function to reference the Proverder Store in a context
      create: (context) => CharacterStore(),
      child: MaterialApp(theme: primaryTheme, home: const Home()),
    ),
  );
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandbox'),
        backgroundColor: Colors.grey,
      ),
      body: const Text('sandbox'),
    );
  }
}
