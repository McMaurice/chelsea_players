import 'package:flutter/material.dart';
import 'package:chelsea_players/theme.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({super.key, required this.onPressed, required this.child});

  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [AppColors.primaryColor, AppColors.secondaryAccent],
            center: Alignment(-0.1, -0.7),
            radius: 1.9,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: child,
      ),
    );
  }
}
