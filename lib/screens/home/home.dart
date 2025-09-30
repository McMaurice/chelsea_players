import 'package:game_characters/screens/create/create.dart';
import 'package:game_characters/services/character_store.dart';
import 'package:flutter/material.dart';
import 'package:game_characters/screens/home/character_card.dart';
import 'package:game_characters/shared/styled_button.dart';
import 'package:game_characters/shared/styled_text.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<CharacterStore>(context, listen: false).fetchCharactersOnce();
    super.initState();
  }

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
              child: Consumer<CharacterStore>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.characters.length,
                    itemBuilder: (_, player) {
                      return Dismissible(
                        key: ValueKey(value.characters[player].id),
                        onDismissed: (direction) {
                          Provider.of<CharacterStore>(
                            context,
                            listen: false,
                          ).removeCharacter(value.characters[player]);
                        },
                        child: PlayerCard(value.characters[player]),
                      );
                    },
                  );
                },
              ),
            ),
            StyledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => const CreateScreen()),
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
