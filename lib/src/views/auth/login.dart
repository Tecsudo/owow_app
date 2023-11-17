import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/router/route_names.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 640,
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Positioned(
              top: 0,
              child: Container(
                width: 640,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/bg.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
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
                        'Login Here',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF26551D),
                          fontSize: 35,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 257,
                      // height: 36,
                      child: Text(
                        'Welcome Back!\nyou’ve been missed',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF132513),
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 313,
                      height: 50,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 313,
                              height: 50,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFB7CAA9),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 3,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFF26551D),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 17,
                            top: 14,
                            child: SizedBox(
                              width: 132,
                              height: 27,
                              child: Text(
                                'Phone / Email',
                                style: TextStyle(
                                  color: Color(0xFF5E6E59),
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 313,
                      height: 50,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 313,
                              height: 50,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFB7CAA9),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ),
                          const Positioned(
                            left: 17,
                            top: 11,
                            child: SizedBox(
                              width: 132,
                              height: 27,
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  color: Color(0xFF5E6E59),
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 174,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Forgot Password? ',
                              style: TextStyle(
                                color: Color(0xFF595959),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0.12,
                              ),
                            ),
                            TextSpan(
                              text: 'Click Here',
                              style: TextStyle(
                                color: Color(0xFF26551D),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                height: 0.12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.goNamed(RouteNames.register.name);
                      },
                      child: SizedBox(
                        width: 316,
                        height: 50,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 316,
                                height: 50,
                                decoration: ShapeDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment(1.00, 0.00),
                                    end: Alignment(-1, 0),
                                    colors: [
                                      Color(0xFF76A968),
                                      Color(0xFF4E8649)
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 120.18,
                              top: 14,
                              child: SizedBox(
                                width: 76.67,
                                child: Text(
                                  'Continue',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
