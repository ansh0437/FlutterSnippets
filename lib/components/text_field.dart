import 'package:flutter/material.dart';
import 'package:flutter_snippets/theme/text_field_style.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.label = "",
      this.initialValue = "",
      this.keyboardType = TextInputType.text,
      this.padding = const EdgeInsets.all(0),
      this.inputOnChange,
      this.inputValidator})
      : super(key: ObjectKey(label));

  final String label;
  final String initialValue;

  final TextInputType keyboardType;

  final EdgeInsets padding;

  final Function inputOnChange;
  final Function inputValidator;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: TextFormField(
          decoration: inputDecoration(label),
          keyboardType: keyboardType,
          initialValue: initialValue,
          onChanged: inputOnChange,
          validator: inputValidator,
        ));
  }
}
