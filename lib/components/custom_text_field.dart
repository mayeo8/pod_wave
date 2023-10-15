import 'package:flutter/material.dart';
import 'package:pod_wave/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.onChanged,
    this.hint,
    this.icon,
  }) : super(key: key);
  final ValueChanged onChanged;
  final String? hint;
  final Widget? icon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool toggleBool = true;
  Color errorColor = kHeadingColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: widget.controller,
      // focusNode: widget.focusNode,
      style: const TextStyle(color: kHeadingColor),
      obscuringCharacter: '\u2022',
      obscureText: widget.hint == 'Password' ? toggleBool : false,
      decoration: InputDecoration(
          errorStyle: const TextStyle(
            color: kErrorColor,
          ),
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          filled: true,
          fillColor: kTextFormColor,
          suffixIcon: widget.hint == 'Password' ? buildGestureDetector() : null,
          prefixIcon: widget.icon,
          hintText: widget.hint,
          hintStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
              color: errorColor),
          // alignLabelWithHint: widget.align,
          contentPadding: const EdgeInsets.fromLTRB(32.0, 18.0, 32, 18),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: const BorderSide(
                color: Colors.transparent, style: BorderStyle.solid),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.0),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 2.0,
            ),
          )),
      // maxLines: _getMaxLines(),
      keyboardType: widget.hint == 'Password'
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      onChanged: widget.onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          setState(() {
            errorColor = kErrorColor;
          });
          if (widget.hint == 'Password') return 'Incorrect password';
          if (widget.hint == 'Email') return 'Incorrect Email';
          return null;
        }
      },
    );
  }

  // int? _getMaxLines() {
  //   if (widget.height != null && widget.height! > 1) {
  //     return widget.height!;
  //   } else {
  //     return widget.hint == 'Password' ? 1 : null;
  //   }
  // }

  GestureDetector buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        setState(() {
          toggleBool = !toggleBool;
        });
      },
      child: Image.asset('assets/images/icons/eye.png'),
    );
  }
}
