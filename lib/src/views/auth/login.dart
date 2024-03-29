import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/router/route_names.dart';
import '../../core/constants/app_constant.dart';
import '../../core/widget/bg.dart';
import '../../core/widget/elevated_button.dart';
import '../../providers/auth.dart';
import '../../model/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _authenticationFormKey = GlobalKey<FormState>();

  bool _isEnteringPhoneNumber = false;

  bool _obscureText = true;

  final _emailOrPhoneController = TextEditingController();
  final _passwordController = TextEditingController();

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _togglePhone() {
    setState(() {
      _isEnteringPhoneNumber = !_isEnteringPhoneNumber;
    });
  }

  bool isEmailOrPhoneNumber(String input) {
    bool isEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(input);
    bool isPhoneNumber = RegExp(r'^03[0-9]{9}$').hasMatch(input);

    return isEmail || isPhoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: AppConstant.screenSize.width < 640
              ? AppConstant.screenSize.width
              : 640,
          height: AppConstant.screenSize.height,
          child: Form(
            key: _authenticationFormKey,
            child: Stack(children: [
              Background(screenSize: AppConstant.screenSize),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: AppConstant.screenSize.height * 0.1),
                      child: Text(
                        'Login Here',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                                color: const Color(0xFF26551D),
                                fontSize: 35),
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      child: Text(
                        'Welcome Back!\nyou’ve been missed',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: const Color(0xFF132513),
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                      ),
                    ),
                    SizedBox(
                      width: 313,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFB7CAA9),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 5),
                              child: TextFormField(
                                controller: _emailOrPhoneController,
                                style: const TextStyle(
                                  color: Color(0xFF132513),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: _togglePhone,
                                    icon: Icon(
                                      !_isEnteringPhoneNumber
                                          ? Icons.phone
                                          : Icons.mail,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  hintText: _isEnteringPhoneNumber
                                      ? 'user@exapmle.com'
                                      : '03xxxxxxxxx',
                                  helperText: _isEnteringPhoneNumber
                                      ? 'Email'
                                      : 'Phone',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: const Color(0xFF5E6E59),
                                      ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your ${_isEnteringPhoneNumber ? 'email' : 'phone'}';
                                  } else if (!isEmailOrPhoneNumber(value)) {
                                    return 'Please enter a valid ${_isEnteringPhoneNumber ? 'email' : 'phone'}';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFB7CAA9),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 5),
                              child: TextFormField(
                                controller: _passwordController,
                                enableSuggestions: false,
                                obscureText: _obscureText,
                                style: const TextStyle(
                                  color: Color(0xFF132513),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: _togglePassword,
                                    icon: Icon(
                                      !_obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  hintText: '********',
                                  helperText: 'Password',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: const Color(0xFF5E6E59),
                                      ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: <Widget>[
                          //     const Text('Forgot Password? '),
                          //     TextButton(
                          //       child: const Text(
                          //         'Click Here',
                          //       ),
                          //       onPressed: () {
                          //         //TODO: Implement Forgot Password
                          //       },
                          //     )
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    CustomGradientElevatedButton(
                      minimumSize: const Size(313, 60),
                      buttonText: Text(
                        'Continue',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        if (_authenticationFormKey.currentState!.validate()) {
                          _authenticationFormKey.currentState!.save();
                          userLogin(
                              info: UserInfo(
                            password: _passwordController.text,
                            isEnteringPhoneNumber: _isEnteringPhoneNumber,
                            emailOrPhone: _emailOrPhoneController.text,
                          )).then((value) =>
                              context.goNamed(RouteNames.rating.name));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
