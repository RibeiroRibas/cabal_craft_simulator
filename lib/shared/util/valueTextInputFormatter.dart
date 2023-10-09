import 'package:cabal_craft_simulator/shared/util/format_text_util.dart';
import 'package:flutter/services.dart';

class ValueTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    String formattedString = newValue.text.replaceAll(RegExp(r'\D'), '');
    String newText =
    FormatTextUtil.convertToCabalCoinTextField(int.parse(formattedString));
    return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
