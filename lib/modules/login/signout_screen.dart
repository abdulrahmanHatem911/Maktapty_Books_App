import 'package:book/core/components/build_button_cmponent.dart';
import 'package:book/core/constant/app_size.dart';
import 'package:book/core/services/cache_helper.dart';
import 'package:book/layout/home_layout.dart';

import '../../core/constant/const.dart';
import '../widgets/auth/text_form_filed_component.dart';
import 'signin_screen.dart';
import '../screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/state.dart';

var formKey = GlobalKey<FormState>();

TextEditingController _nameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _emailController = TextEditingController();

class SignOutScreen extends StatelessWidget {
  const SignOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        height: 350,
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/login/4.png'),
                        ),
                      ),
                      TextFormComponent(
                        keyboardType: TextInputType.text,
                        controller: _nameController,
                        hintText: 'Username',
                        obscureText: false,
                        prefixIcon: Icons.email,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your username';
                          }
                        },
                      ),
                      AppSize.sv_10,
                      TextFormComponent(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        hintText: 'Email',
                        obscureText: false,
                        prefixIcon: Icons.email,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your email';
                          }
                        },
                      ),
                      AppSize.sv_10,
                      TextFormComponent(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        hintText: 'Password',
                        obscureText: true,
                        prefixIcon: Icons.lock,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your password';
                          }
                        },
                      ),
                      AppSize.sv_20,
                      BuildButtonComponent(
                        isLogin: true,
                        text: 'Create an account',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            CacheHelper.saveData(
                              key: 'isLogin',
                              value: true,
                            ).then((value) {
                              navigateToAndRemove(
                                  context, const LayoutScreen());
                            });
                          }
                        },
                      ),
                      AppSize.sv_10,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          children: [
                            const Text(
                              'Do you have an account?',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 119, 49, 131),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                navigateToAndRemove(
                                    context, const SignInScreen());
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
