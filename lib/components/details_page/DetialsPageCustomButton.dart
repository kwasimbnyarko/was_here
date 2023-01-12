import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.buttonColor,
      this.labelColor,
      required this.buttonLabel,
      this.onTapFunction});
  final Color? buttonColor;
  final Color? labelColor;
  final String buttonLabel;
  final void Function()? onTapFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: onTapFunction,
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: buttonColor ?? const Color(0xff8c8c8c),
              borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(
              buttonLabel,
              style: TextStyle(color: labelColor ?? Colors.black, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
