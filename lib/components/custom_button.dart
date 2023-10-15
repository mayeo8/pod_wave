import 'package:flutter/material.dart';
import 'package:pod_wave/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
  });

  final String text;
  final VoidCallback onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(kButtonColor),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: width == 0.0 ? 61 : width!),
        child: Text(
          text,
          style: const TextStyle(
              fontFamily: 'NotoSans',
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: kBackgroundColor),
        ),
      ),
    );
  }
}
