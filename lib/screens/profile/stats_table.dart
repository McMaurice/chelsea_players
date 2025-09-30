import 'package:game_characters/models/character.dart';
import 'package:game_characters/shared/styled_text.dart';
import 'package:game_characters/theme.dart';
import 'package:flutter/material.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            color: AppColors.primaryColor.withAlpha((0.5 * 255).toInt()),
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                AnimatedRotation(
                  turns: turns,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.star,
                    color: widget.character.points > 0
                        ? Colors.yellow
                        : Colors.grey,
                  ),
                ),
                const SizedBox(width: 20),
                const StyledText('Available Stat Points'),
                const Expanded(child: SizedBox(width: 20)),
                StyledHeading(widget.character.points.toString()),
              ],
            ),
          ),

          // stats table
          Table(
            columnWidths: const {
              0: FlexColumnWidth(3), // title takes more space
            },

            children: widget.character.statsAsFormattedList.map((stat) {
              return TableRow(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withAlpha((0.5 * 255).toInt()),
                ),
                children: [
                  // stat title
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: StyledHeading(stat['title']!),
                    ),
                  ),

                  // stat value
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: StyledHeading(stat['value']!),
                    ),
                  ),

                  // icons to increase stat
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_upward,
                        color: AppColors.textColor,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.character.increaseStat(stat['title']!);
                          if (widget.character.points > 0) {
                            (turns += 0.5);
                          } else {
                            turns = 0.0;
                          }
                        });
                      },
                    ),
                  ),

                  // icons to decrease stat
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_downward,
                        color: AppColors.textColor,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.character.decreaseStat(stat['title']!);
                          if (widget.character.statsAsMap[stat['title']!]! > 5) {
                            (turns -= 0.5);
                          }
                        });
                      },
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
