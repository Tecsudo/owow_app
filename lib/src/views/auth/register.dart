import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/router/route_names.dart';
import '../../../core/widget/bg.dart';
import '../../../core/widget/elevated_button.dart';
import '../../../main.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  var _emailController = TextEditingController();
  var _phoneController = TextEditingController();
  var _passwordController = TextEditingController();

  // Function to validate email format
  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 640,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Stack(children: [
              Background(screenSize: screenSize),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 257,
                        // height: 104,
                        child: Text(
                          'Create Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF26551D),
                            fontSize: 35,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 400,
                        // height: 36,
                        child: Text(
                          'Create a account \nto explore all the discounts',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF132513),
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 313,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFB7CAA9),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 5),
                                child: TextFormField(
                                  controller: _emailController,
                                  style: const TextStyle(
                                    color: Color(0xFF132513),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'email@example.com',
                                    helperText: 'Email',
                                    // labelText: 'Phone / Email',
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: const Color(0xFF5E6E59),
                                        ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    } else if (!isValidEmail(value)) {
                                      return 'Please enter a valid email';
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
                                  controller: _phoneController,
                                  style: const TextStyle(
                                    color: Color(0xFF132513),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '03xxxxxxxxx',
                                    helperText: 'Phone',
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: const Color(0xFF5E6E59),
                                        ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your phone number';
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
                                  style: const TextStyle(
                                    color: Color(0xFF132513),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  decoration: InputDecoration(
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
                          ],
                        ),
                      ),
                      CustomGradientElevatedButton(
                        minimumSize: const Size(313, 60),
                        buttonText: Text(
                          'Continue',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            context.go(RouteNames.rating.path);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
