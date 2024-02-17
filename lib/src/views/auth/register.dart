import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../../../config/router/route_names.dart';
import '../../core/constants/app_constant.dart';
import '../../core/widget/bg.dart';
import '../../core/widget/elevated_button.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _registrationFormKey = GlobalKey<FormState>();

  // Switch between email and phone number
  bool _isEnteringPhoneNumber = false;

  // Initially password is obscure
  bool _obscureText = true;

  final _emailOrPhoneController = TextEditingController();
  final _passwordController = TextEditingController();

  // ignore: unused_field
  late String _gender;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _setGender({String gender = 'male'}) {
    setState(() {
      _gender = gender;
    });
  }

  bool isEmailOrPhoneNumber(String input) {
    bool isEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(input);
    bool isPhoneNumber = RegExp(r'^03[0-9]{9}$')
        .hasMatch(input); // Assuming Pakistani phone number format

    return isEmail || isPhoneNumber;
  }

  @override
  void initState() {
    _setGender();
    super.initState();
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
            key: _registrationFormKey,
            child: Stack(children: [
              Background(screenSize: AppConstant.screenSize),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: AppConstant.screenSize.height * 0.1),
                      child: Text(
                        'Create Account',
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
                        'Create a account \nto explore all the discounts',
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
                          LiteRollingSwitch(
                            value: _isEnteringPhoneNumber,
                            onTap: () {},
                            onDoubleTap: () {},
                            onSwipe: () {},
                            textOn: 'Email',
                            textOff: 'Phone',
                            colorOn: const Color(0xFF4E8649),
                            colorOff: const Color(0xFF4E8649),
                            iconOn: Icons.email,
                            iconOff: Icons.phone,
                            onChanged: (bool state) {
                              setState(() {
                                _isEnteringPhoneNumber = state;
                              });
                            },
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
                                controller: _emailOrPhoneController,
                                style: const TextStyle(
                                  color: Color(0xFF132513),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                                decoration: InputDecoration(
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
                                  height: 0,
                                ),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: _toggle,
                                    icon: Icon(
                                      !_obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  helperText: 'Password',
                                  hintText: 'Password',
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
                          CustomRadioButton(
                            enableShape: true,
                            defaultSelected: 'Male',
                            customShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            elevation: 0,
                            absoluteZeroSpacing: true,
                            unSelectedColor:
                                Theme.of(context).colorScheme.surface,
                            buttonLables: const [
                              'Male',
                              'Female',
                              'Other',
                            ],
                            buttonValues: const [
                              "Male",
                              "Female",
                              "Other",
                            ],
                            buttonTextStyle: const ButtonTextStyle(
                                selectedColor: Colors.white,
                                unSelectedColor: Colors.black,
                                textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (val) => _setGender(gender: val),

                            // (value) {
                            //   _setGender(value);
                            // },
                            selectedColor:
                                Theme.of(context).colorScheme.primary,
                          ),
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
                        if (_registrationFormKey.currentState!.validate()) {
                          _registrationFormKey.currentState!.save();

                          // userRegistration(
                          //     info: UserInfo(
                          //       password: _passwordController.text,
                          //       isEnteringPhoneNumber: _isEnteringPhoneNumber,
                          //       emailOrPhone: _emailOrPhoneController.text,
                          //     ),
                          //     gender: _gender);

                          context.go(RouteNames.rating.path);
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
