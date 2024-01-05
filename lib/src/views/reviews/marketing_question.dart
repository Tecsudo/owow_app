import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/router/route_names.dart';
import '../../../core/widget/bg.dart';
import '../../../core/widget/elevated_button.dart';
import '../../../main.dart';

class MarketingQuestion extends StatefulWidget {
  const MarketingQuestion({super.key});

  @override
  State<MarketingQuestion> createState() => _MarketingQuestionState();
}

class _MarketingQuestionState extends State<MarketingQuestion> {
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
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'You are one step away from',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF20293A),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Text(
                    'Getting 20 % off',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF4E8649),
                      fontSize: 28,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'on Chicked Lover Pizza',
                    style: TextStyle(
                      color: Color(0xFF4E8649),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/blank.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * .05,
                  ),
                  // SizedBox(
                  //   child: Text(
                  //     'Discover Now!\nDiscounts Now!',
                  //     textAlign: TextAlign.center,
                  //     style:
                  //         Theme.of(context).textTheme.headlineLarge?.copyWith(
                  //               fontWeight: FontWeight.w600,
                  //               color: Theme.of(context).primaryColor,
                  //             ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    width: 257,
                    height: 73,
                    child: Text(
                      'Have you tried fajita \n6-inch subway?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF132513),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
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
                            'Yes',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontWeight: FontWeight.w600),
                          ),
                          onPressed: () {
                            context.goNamed(RouteNames.coupon.name);
                          },
                        ),
                        CustomSolidElevatedButton(
                          minimumSize: const Size(160, 60),
                          buttonText: Text(
                            'No',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: const Color(0xFF595959),
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          onPressed: () {
                            context.goNamed(RouteNames.thanks.name);
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
