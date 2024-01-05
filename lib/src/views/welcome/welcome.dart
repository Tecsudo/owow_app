import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/router/route_names.dart';
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
