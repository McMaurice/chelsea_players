import 'package:game_characters/models/character.dart';
import 'package:game_characters/models/skill.dart';
import 'package:game_characters/shared/styled_text.dart';
import 'package:game_characters/theme.dart';
import 'package:flutter/material.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> availableSkills;
  late Skill selectedSkill;

  @override
  void initState() {
    availableSkills = allSkills.where((skill) {
      return skill.vocation == widget.character.vocation;
    }).toList();

    if (widget.character.skills.isEmpty) {
      selectedSkill = availableSkills[0];
    }
    if (widget.character.skills.isNotEmpty) {
      selectedSkill = widget.character.skills.first;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: AppColors.primaryColor.withAlpha((0.5 * 255).toInt()),
        child: Column(
          children: [
            const StyledHeading('Choose an active skill'),
            const StyledText('Skills are unique to your vocation.'),
            const SizedBox(height: 20),

            Row(
              children: availableSkills.map((skill) {
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(2),
                    color: skill == selectedSkill
                        ? Colors.amber
                        : Colors.transparent,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.character.updateSkill(skill);
                          selectedSkill = skill;
                        });
                      },
                      child: Image.asset(
                        'assets/img/skills/${skill.image}',
                        width: 70,
                        colorBlendMode: BlendMode.color,
                        color: skill != selectedSkill
                    ? Colors.black.withAlpha((1.5 * 300).toInt())
                    : Colors.transparent,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            StyledHeading(selectedSkill.name),
          ],
        ),
      ),
    );
  }
}
