import 'package:book/modules/login/signin_screen.dart';
import 'package:book/modules/login/signout_screen.dart';
import 'package:flutter/material.dart';

import '../../core/components/build_button_cmponent.dart';
import '../../core/constant/const.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                width: double.infinity,
                height: 360.0,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/login/1.png'),
                ),
              ),
              Column(
                children: [
                  BuildButtonComponent(
                    isLogin: true,
                    text: "Sign in",
                    onPressed: () {
                      navigateToAndRemove(context, const SignInScreen());
                    },
                  ),
                  const SizedBox(height: 20.0),
                  BuildButtonComponent(
                    isLogin: false,
                    text: "Create an account",
                    onPressed: () {
                      navigateToAndRemove(context, const SignOutScreen());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
