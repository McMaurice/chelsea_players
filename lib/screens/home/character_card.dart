import 'package:chelsea_players/models/character.dart';
import 'package:chelsea_players/screens/profile/profile.dart';
import 'package:chelsea_players/shared/styled_text.dart';
import 'package:chelsea_players/theme.dart';
import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard(this.character, {super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Image.asset(
              'assets/img/vocations/${character.vocation.image}',
              width: 80,
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
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => Profile(character: character),
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.textColor, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
