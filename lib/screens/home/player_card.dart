import 'package:chelsea_players/theme.dart';
import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard(this.player, {super.key});

  final String player;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Text(player),
            Expanded(child: SizedBox()),
            IconButton(
              onPressed: () {},
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
