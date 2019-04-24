import 'package:flutter/material.dart';
import 'package:secozy/resources/colors.dart';

class DefaultTextfield extends StatefulWidget {
  final String fieldLabel;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final Function(String) validationFunc;
  final String validationMessage;
  final int sumLines;
  final bool obsecureValue;
  final Widget customSuffixIcon;
  final Function() suffixIconFunc;
  final hasSuffixIcon;
  DefaultTextfield(
      {@required this.fieldLabel,
      @required this.textController,
      this.keyboardType = TextInputType.text,
      this.validationFunc,
      this.validationMessage,
      this.sumLines = 1,
      this.obsecureValue = false,
      this.customSuffixIcon,
      this.suffixIconFunc,
        this.hasSuffixIcon = false,
      Key key})
      : super(key: key);

  @override
  _DefaultTextfieldState createState() => _DefaultTextfieldState();
}

class _DefaultTextfieldState extends State<DefaultTextfield> {

  bool _hasSuffixIcon()=> widget.hasSuffixIcon == true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.sumLines,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
            borderSide: BorderSide(color: colorBlack)),
        labelText: widget.fieldLabel,
        labelStyle: const TextStyle(
          color: colorBlack,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        suffixIcon: _hasSuffixIcon() ? new GestureDetector(
            onTap:  widget.suffixIconFunc,
            child: widget.customSuffixIcon,
        ) : null,
      ),
      controller: widget.textController,
      keyboardType: widget.keyboardType,
      validator: widget.validationFunc ??
          (value) {
            if (value.isEmpty) {
              return widget.validationMessage;
            }
          },
      obscureText: widget.obsecureValue,
    );
  }
}
