import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/router/route_names.dart';
import '../../../core/widget/bg.dart';
import '../../../core/widget/elevated_button.dart';
import '../../../main.dart';

class Rating extends StatefulWidget {
  const Rating({super.key});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
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
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/blank.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 400,
                          child: Text(
                            'Rate Your Experience',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: const Color(0xFF132513),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                          ),
                        ),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          unratedColor: Colors.grey.withAlpha(50),
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Color(0xFF4E8649),
                          ),
                          onRatingUpdate: (rating) {
                            log(rating.toString(), name: 'Rating');
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 350,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'FOOD',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: const Color(0xFF4E8649),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        height: 0.07,
                                      ),
                                ),
                                const Spacer(),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  unratedColor: Colors.grey.withAlpha(50),
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Color(0xFF4E8649),
                                  ),
                                  onRatingUpdate: (rating) {
                                    log(rating.toString(), name: 'Rating');
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 350,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'SERVICE',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: const Color(0xFF4E8649),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        height: 0.07,
                                      ),
                                ),
                                const Spacer(),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  unratedColor: Colors.grey.withAlpha(50),
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Color(0xFF4E8649),
                                  ),
                                  onRatingUpdate: (rating) {
                                    log(rating.toString(), name: 'Rating');
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 350,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'AMBIENCE',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: const Color(0xFF4E8649),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        height: 0.07,
                                      ),
                                ),
                                const Spacer(),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  unratedColor: Colors.grey.withAlpha(50),
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Color(0xFF4E8649),
                                  ),
                                  onRatingUpdate: (rating) {
                                    log(rating.toString(), name: 'Rating');
                                  },
                                )
                              ],
                            ),
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
                        context.goNamed(RouteNames.register.name);
                      },
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     context.go(RouteNames.question.path);
                    //   },
                    //   child: SizedBox(
                    //     width: 316,
                    //     height: 50,
                    //     child: Stack(
                    //       children: [
                    //         Positioned(
                    //           left: 0,
                    //           top: 0,
                    //           child: Container(
                    //             width: 316,
                    //             height: 50,
                    //             decoration: ShapeDecoration(
                    //               gradient: const LinearGradient(
                    //                 begin: Alignment(1.00, 0.00),
                    //                 end: Alignment(-1, 0),
                    //                 colors: [
                    //                   Color(0xFF76A968),
                    //                   Color(0xFF4E8649)
                    //                 ],
                    //               ),
                    //               shape: RoundedRectangleBorder(
                    //                   borderRadius: BorderRadius.circular(5)),
                    //               shadows: const [
                    //                 BoxShadow(
                    //                   color: Color(0x3F000000),
                    //                   blurRadius: 4,
                    //                   offset: Offset(0, 4),
                    //                   spreadRadius: 0,
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //         const Positioned(
                    //           left: 120.18,
                    //           top: 14,
                    //           child: SizedBox(
                    //             width: 76.67,
                    //             child: Text(
                    //               'Continue',
                    //               style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontSize: 14,
                    //                 fontFamily: 'Poppins',
                    //                 fontWeight: FontWeight.w600,
                    //                 height: 0,
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
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
