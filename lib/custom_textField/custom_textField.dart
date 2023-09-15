import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.onChange,
    required this.label,
    required this.errorText,
    required this.icon,
    super.key,
    this.large,
    this.pass,
    this.initialeValue,
  });
  final Function(String) onChange;
  final String? errorText;
  final String label;
  final Icon icon;
  final String? initialeValue;
  bool? large = false;
  int? maxLine;
  bool? pass = false;

  @override
  Widget build(BuildContext context) {
    maxLine = 1;
    bool obscure = false;
    if (large == true) {
      maxLine = 3;
    }
    if (pass == true) {
      obscure = true;
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        initialValue: initialeValue,
        obscureText: obscure,
        onChanged: onChange,
        maxLines: maxLine,
        decoration: InputDecoration(
          errorText: errorText,
          border: const OutlineInputBorder(),
          labelText: label,
          suffixIcon: icon,
        ),
      ),
    );
  }
}
