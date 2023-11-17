import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/router/route_names.dart';

class OnBoardingEnd extends StatefulWidget {
  const OnBoardingEnd({super.key});

  @override
  State<OnBoardingEnd> createState() => _OnBoardingEndState();
}

class _OnBoardingEndState extends State<OnBoardingEnd> {
  @override
  void initState() {
    super.initState();
  }

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
                    Container(
                      width: MediaQuery.of(context).size.width * .8,
                      height: MediaQuery.of(context).size.height * .4,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/auth.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    const SizedBox(
                      child: Text(
                        'Discover Now!\nDiscounts Now!',
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
                      height: 15,
                    ),
                    const SizedBox(
                      width: 257,
                      height: 36,
                      child: Text(
                        'Explore all the discounts available based on your location ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF132513),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.goNamed(RouteNames.login.name);
                              },
                              child: SizedBox(
                                width: 152,
                                height: 50,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 152,
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
                                              borderRadius:
                                                  BorderRadius.circular(5)),
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
                                      left: 55,
                                      top: 14,
                                      child: SizedBox(
                                        width: 43,
                                        child: Text(
                                          'Login',
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
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                context.goNamed(RouteNames.register.name);
                              },
                              child: SizedBox(
                                width: 153,
                                height: 50,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 153,
                                        height: 50,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFD6D6D6),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      left: 46,
                                      top: 14,
                                      child: SizedBox(
                                        width: 73,
                                        height: 23,
                                        child: Text(
                                          'Register',
                                          style: TextStyle(
                                            color: Color(0xFF595959),
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
                        )),
                    const SizedBox(
                      height: 50,
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
