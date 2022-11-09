import 'package:book/core/components/build_button_cmponent.dart';
import 'package:book/core/services/cache_helper.dart';

import '../../core/constant/app_size.dart';
import '../../core/constant/const.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/state.dart';
import '../../layout/home_layout.dart';
import '../screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/auth/text_form_filed_component.dart';

var formKey = GlobalKey<FormState>();
TextEditingController _passwordController = TextEditingController();
TextEditingController _emailController = TextEditingController();

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
                      Container(
                        width: double.infinity,
                        height: 350,
                        child: const Image(
                            image: AssetImage('assets/images/login/2.png')),
                      ),
                      AppSize.sv_20,
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
                        obscureText: cubit.isPassword,
                        prefixIcon: Icons.lock,
                        suffixIcon: cubit.suffix,
                        suffixPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your password';
                          }
                        },
                      ),
                      AppSize.sv_20,
                      BuildButtonComponent(
                        isLogin: true,
                        text: 'Sign in',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            CacheHelper.saveData(key: 'isLogin', value: true)
                                .then((value) {
                              navigateToAndRemove(
                                  context, const LayoutScreen());
                            });
                          }
                        },
                      ),
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
