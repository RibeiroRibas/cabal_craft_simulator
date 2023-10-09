import 'package:cabal_craft_simulator/shared/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OutlinedTextFieldComponent extends StatelessWidget {
  final String labelText;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final bool autoFocus;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final GlobalKey<FormState>? formKey;

  const OutlinedTextFieldComponent(
      {Key? key,
      required this.labelText,
      this.initialValue,
      this.onChanged,
      this.validator,
      this.onFieldSubmitted,
      this.keyboardType,
      this.autoFocus = true,
      this.inputFormatters,
      this.maxLength,
      this.focusNode,
      this.controller,
      this.formKey,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formKey,
      focusNode: focusNode,
      maxLength: maxLength,
      autofocus: autoFocus,
      validator: validator,
      controller: controller,
      initialValue: initialValue,
      decoration: InputDecoration(
        counterText: "",
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColors.white,
            width: 2.0,
          ),
        ),
        labelText: labelText,
      ),
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: keyboardType,
    );
  }
}
