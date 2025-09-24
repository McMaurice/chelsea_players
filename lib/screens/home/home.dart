import 'package:chelsea_players/models/character.dart';
import 'package:chelsea_players/screens/create/create.dart';
import 'package:flutter/material.dart';
import 'package:chelsea_players/screens/home/character_card.dart';
import 'package:chelsea_players/shared/styled_button.dart';
import 'package:chelsea_players/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Active Characters'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: character.length,
                itemBuilder: (_, player) {
                  return PlayerCard(character[player]);
                },
              ),
            ),
            StyledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => const Create()),
                );
              },
              child: const StyledHeading('Add Character'),
            ),
          ],
        ),
      ),
    );
  }
}
