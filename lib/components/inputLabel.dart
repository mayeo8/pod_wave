import 'package:flutter/material.dart';
import 'package:pod_wave/constants.dart';

class InputLabel extends StatelessWidget {
  const InputLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 12.0),
      child: Text(
        label,
        style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            fontFamily: 'Inter',
            color: kTextColor),
      ),
    );
  }
}
