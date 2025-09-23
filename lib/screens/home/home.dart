import 'package:flutter/material.dart';
import 'package:chelsea_players/screens/home/player_card.dart';
import 'package:chelsea_players/shared/styled_button.dart';
import 'package:chelsea_players/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List players = [
    "Robert Sánchez",
    "Reece James",
    "Trevoh Chalobah",
    "Levi Colwill",
    "Marc Cucurella",
    "Moisés Caicedo",
    "Enzo Fernández",
    "Noni Madueke",
    "Cole Palmer",
    "Pedro Neto",
    "João Pedro",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Active Players'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: players.length,
                itemBuilder: (_, player) {
                  return PlayerCard(players[player]);
                },
              ),
            ),
            StyledButton(
              onPressed: () {
                // TODO: Implement add player functionality
              },
              child: StyledHeading('Add Player'),
            ),
          ],
        ),
      ),
    );
  }
}
