import 'package:cabal_craft_simulator/shared/theme_colors.dart';
import 'package:flutter/material.dart';

class DropDownButtonComponent extends StatelessWidget {
  final Function(String) onValueChange;
  final double width;
  final List<String> values;
  final String labelText;
  final GlobalKey<FormState>? formKey;
  final String? Function(String?)? validator;

  const DropDownButtonComponent({
    Key? key,
    required this.onValueChange,
    required this.width,
    required this.values,
    required this.labelText,
    this.formKey,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: DropdownButtonFormField<String>(
        key: formKey,
        dropdownColor: ThemeColors.backgroundColor,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColors.white,
              width: 2.0,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColors.white,
              width: 2.0,
            ),
          ),
        ),
        validator: validator,
        items: values
            .map((name) =>
                DropdownMenuItem<String>(value: name, child: Text(name)))
            .toList(),
        onChanged: (value) {
          onValueChange(value!);
        },
      ),
    );
  }
}
