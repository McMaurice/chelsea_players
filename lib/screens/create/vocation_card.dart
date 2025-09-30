import 'package:game_characters/models/vocation.dart';
import 'package:game_characters/shared/styled_text.dart';
import 'package:game_characters/theme.dart';
import 'package:flutter/material.dart';

class VocationCard extends StatelessWidget {
  const VocationCard({
    super.key,
    required this.vocation,
    required this.selectedCard,
    required this.selected,
  });

  final Vocation vocation;
  final bool selected;
  final void Function(Vocation) selectedCard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectedCard(vocation);
      },
      child: Card(
        color: selected
            ? AppColors.primaryAccent.withAlpha((0.5 * 255).toInt())
            : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset(
                'assets/img/vocations/${vocation.image}',
                width: 80,
                colorBlendMode: BlendMode.color,
                color: !selected
                    ? Colors.black.withAlpha((0.5 * 300).toInt())
                    : Colors.transparent,
              ),
              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeading(vocation.title),
                    StyledText(vocation.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
