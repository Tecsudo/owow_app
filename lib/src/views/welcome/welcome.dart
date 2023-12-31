import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/router/route_names.dart';
import '../../../core/widget/bg.dart';
import '../../../core/widget/elevated_button.dart';
import '../../../main.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: screenSize.width < 640 ? screenSize.width : 640,
          height: screenSize.height,
          child: Stack(children: [
            Background(screenSize: screenSize),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenSize.height * .1,
                  ),
                  Container(
                    width: screenSize.width * .8,
                    height: screenSize.height * .4,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/auth.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * .05,
                  ),
                  SizedBox(
                    child: Text(
                      'Discover Now!\nDiscounts Now!',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor,
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
                      'Explore all the discounts available \nbased on your location ',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: screenSize.width < 350 ? screenSize.width : 350,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomGradientElevatedButton(
                          minimumSize: const Size(160, 60),
                          buttonText: Text(
                            'Login',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontWeight: FontWeight.w600),
                          ),
                          onPressed: () {
                            context.goNamed(RouteNames.login.name);
                          },
                        ),
                        CustomSolidElevatedButton(
                          minimumSize: const Size(160, 60),
                          buttonText: Text(
                            'Register',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: const Color(0xFF595959),
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          onPressed: () {
                            context.goNamed(RouteNames.register.name);
                          },
                          backgroundColor: const Color(0xFFD6D6D6),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}


 // SizedBox(
                  //     height: 50,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         GestureDetector(
                  //           onTap: () {
                  //             context.goNamed(RouteNames.login.name);
                  //           },
                  //           child: SizedBox(
                  //             width: 152,
                  //             height: 50,
                  //             child: Stack(
                  //               children: [
                  //                 Positioned(
                  //                   left: 0,
                  //                   top: 0,
                  //                   child: Container(
                  //                     width: 152,
                  //                     height: 50,
                  //                     decoration: ShapeDecoration(
                  //                       gradient: const LinearGradient(
                  //                         begin: Alignment(1.00, 0.00),
                  //                         end: Alignment(-1, 0),
                  //                         colors: [
                  //                           Color(0xFF76A968),
                  //                           Color(0xFF4E8649)
                  //                         ],
                  //                       ),
                  //                       shape: RoundedRectangleBorder(
                  //                           borderRadius:
                  //                               BorderRadius.circular(5)),
                  //                       shadows: const [
                  //                         BoxShadow(
                  //                           color: Color(0x3F000000),
                  //                           blurRadius: 4,
                  //                           offset: Offset(0, 4),
                  //                           spreadRadius: 0,
                  //                         )
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 const Positioned(
                  //                   left: 55,
                  //                   top: 14,
                  //                   child: SizedBox(
                  //                     width: 43,
                  //                     child: Text(
                  //                       'Login',
                  //                       style: TextStyle(
                  //                         color: Colors.white,
                  //                         fontSize: 14,
                  //                         fontFamily: 'Poppins',
                  //                         fontWeight: FontWeight.w600,
                  //                          
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           width: 20,
                  //         ),
                  //         GestureDetector(
                  //           onTap: () {
                  //             context.goNamed(RouteNames.register.name);
                  //           },
                  //           child: SizedBox(
                  //             width: 153,
                  //             height: 50,
                  //             child: Stack(
                  //               children: [
                  //                 Positioned(
                  //                   left: 0,
                  //                   top: 0,
                  //                   child: Container(
                  //                     width: 153,
                  //                     height: 50,
                  //                     decoration: ShapeDecoration(
                  //                       color: const Color(0xFFD6D6D6),
                  //                       shape: RoundedRectangleBorder(
                  //                           borderRadius:
                  //                               BorderRadius.circular(6)),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 const Positioned(
                  //                   left: 46,
                  //                   top: 14,
                  //                   child: SizedBox(
                  //                     width: 73,
                  //                     height: 23,
                  //                     child: Text(
                  //                       'Register',
                  //                       style: TextStyle(
                  //                         color: Color(0xFF595959),
                  //                         fontSize: 14,
                  //                         fontFamily: 'Poppins',
                  //                         fontWeight: FontWeight.w600,
                  //                          
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     )),