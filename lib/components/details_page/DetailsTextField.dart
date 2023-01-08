import 'package:flutter/material.dart';

class DetailsTextField extends StatelessWidget {
  const DetailsTextField(
      {super.key,
      this.hintText,
      this.validator,
      this.keyboardType,
      this.maxLength});
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: keyboardType ?? TextInputType.text,
        maxLength: maxLength,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: hintText ?? "Hint text",
          filled: true,
          fillColor: const Color(0xFFD9D9d9),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  style: BorderStyle.none, color: Color(0xff000000), width: 0)),
        ),
        validator: validator,
      ),
    );
  }
}
