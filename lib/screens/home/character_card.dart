import 'package:game_characters/models/character.dart';
import 'package:game_characters/screens/profile/profile.dart';
import 'package:game_characters/shared/styled_text.dart';
import 'package:game_characters/theme.dart';
import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard(this.character, {super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) => Profile(character: character)),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Stack(
            children: [
              // Main row with image, text, and arrow
              Row(
                children: [
                  Hero(
                    tag: character.id,
                    child: Image.asset(
                      'assets/img/vocations/${character.vocation.image}',
                      width: 80,
                    ),
                  ),
                  const SizedBox(width: 20),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledHeading(character.name),
                      StyledText(character.vocation.title),
                    ],
                  ),

                  const Expanded(child: SizedBox()),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColors.textColor,
                  ),
                ],
              ),

              // Favorite icon at top-right corner
              if (character.isFav)
                const Positioned(
                  top: 30,
                  right: 60,
                  child: Icon(Icons.favorite, color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
