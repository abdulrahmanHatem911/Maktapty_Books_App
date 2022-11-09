import 'package:flutter/material.dart';

class BuildButtonComponent extends StatelessWidget {
  final bool isLogin;
  final String text;
  final Function()? onPressed;
  const BuildButtonComponent(
      {super.key,
      required this.isLogin,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: isLogin
          ? const Color.fromRGBO(119, 49, 131, 1)
          : Colors.grey.shade300,
      minWidth: double.infinity,
      height: 55.0,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: isLogin
              ? Colors.grey.shade100
              : const Color.fromARGB(255, 119, 49, 131),
        ),
      ),
    );
  }
}
