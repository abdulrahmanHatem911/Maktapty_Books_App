import 'package:flutter/material.dart';

import '../../../core/style/app_color.dart';

class TextFormComponent extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController controller;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixPressed;
  final Function(String)? validator;
  const TextFormComponent({
    required this.hintText,
    required this.keyboardType,
    required this.obscureText,
    required this.controller,
    required this.prefixIcon,
    required this.validator,
    this.suffixIcon,
    this.suffixPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: AppColor.gray02, fontSize: 18.0),
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        errorStyle: const TextStyle(
          fontSize: 16.0,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          height: .9,
          fontSize: 18.0,
          color: AppColor.gray03,
        ),
        prefixIcon: Icon(
          prefixIcon,
          size: 25.0,
          color: AppColor.gray03,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffixIcon,
                  size: 25.0,
                  color: AppColor.gray03,
                ),
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 21.0,
          vertical: 20.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColor.gray03,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColor.gray03,
          ),
        ),
        fillColor: Colors.grey[200],
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColor.gray02,
          ),
        ),
      ),
      validator: validator as String? Function(String?)?,
    );
  }
}
