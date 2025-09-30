import 'package:chelsea_players/models/character.dart';
import 'package:chelsea_players/screens/profile/heart.dart';
import 'package:chelsea_players/screens/profile/skill_list.dart';
import 'package:chelsea_players/screens/profile/stats_table.dart';
import 'package:chelsea_players/services/character_store.dart';
import 'package:chelsea_players/shared/styled_button.dart';
import 'package:chelsea_players/shared/styled_text.dart';
import 'package:chelsea_players/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledTitle(character.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // prifile intro
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: AppColors.primaryColor.withAlpha((0.5 * 255).toInt()),
                  child: Row(
                    children: [
                      Hero(
                        tag: character.id,
                        child: Image.asset(
                          'assets/img/vocations/${character.vocation.image}',
                          width: 140,
                          height: 140,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StyledHeading(character.vocation.title),
                            StyledText(character.vocation.description),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 10,
                  child: Heart(character: character)),
              ],
            ),

            // weapons ability and slogan
            const SizedBox(height: 20),
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: AppColors.primaryColor.withAlpha((0.5 * 255).toInt()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeading('Slogan'),
                    StyledText(character.slogan),
                    const SizedBox(height: 10),
                    const StyledHeading('Weapon of Choice'),
                    StyledText(character.vocation.weapon),
                    const SizedBox(height: 10),
                    const StyledHeading('Unique Ability'),
                    StyledText(character.vocation.ability),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            // stats and skills
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [StatsTable(character), SkillList(character)],
              ),
            ),

            // save button
            StyledButton(
              onPressed: () {
                Provider.of<CharacterStore>(
                  context,
                  listen: false,
                ).saveCharacter(character);
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const StyledHeading('Changes has been saved'),
                    showCloseIcon: true,
                    duration: const Duration(seconds: 2),
                    backgroundColor: AppColors.primaryAccent,
                  ),
                );
                Navigator.pop(context);
              },
              child: const StyledHeading('Save Changes'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
