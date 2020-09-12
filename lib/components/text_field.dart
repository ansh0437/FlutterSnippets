import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_snippets/theme/text_field_style.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.label = "",
      this.initialValue = "",
      this.keyboardType = TextInputType.text,
      this.inputFormatters = const <TextInputFormatter>[],
      this.padding = const EdgeInsets.all(0),
      this.inputOnChange,
      this.inputValidator})
      : super(key: ObjectKey(label));

  final String label;
  final String initialValue;

  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;

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
          minLines: 1,
          maxLines: keyboardType == TextInputType.multiline ? 5 : 1,
          inputFormatters: inputFormatters,
          initialValue: initialValue,
          onChanged: inputOnChange,
          validator: inputValidator,
        ));
  }
}
