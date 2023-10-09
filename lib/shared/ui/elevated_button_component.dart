import 'package:cabal_craft_simulator/shared/green_theme.dart';
import 'package:flutter/material.dart';

class ElevatedButtonComponent extends StatelessWidget {
  final String text;
  final VoidCallback onButtonPressed;
  final Color? backgroundColor;
  final FocusNode? focusNode;

  const ElevatedButtonComponent({
    Key? key,
    required this.onButtonPressed,
    required this.text,
    this.backgroundColor,
    this.focusNode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FilledButton(
      focusNode: focusNode,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              backgroundColor ?? greenTheme.primaryColor)),
      onPressed: () {
        onButtonPressed.call();
      },
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
