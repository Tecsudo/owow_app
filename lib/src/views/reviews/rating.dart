import 'package:feedback/src/model/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

import '../../../config/router/route_names.dart';
import '../../core/constants/app_constant.dart';
import '../../core/widget/bg.dart';
import '../../core/widget/elevated_button.dart';
import '../../providers/data.dart';

class Rating extends StatefulWidget {
  const Rating({super.key});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  int _exp = 3, _food = 3, _service = 3, _ambiance = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: AppConstant.screenSize.width < 640
              ? AppConstant.screenSize.width
              : 640,
          height: AppConstant.screenSize.height,
          child: Stack(children: [
            Background(screenSize: AppConstant.screenSize),
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
                          initialRating: _exp.toDouble(),
                          minRating: 1,
                          direction: Axis.horizontal,
                          unratedColor: Colors.grey.withAlpha(50),
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Color(0xFF4E8649),
                          ),
                          onRatingUpdate: (rating) {
                            _exp = rating.toInt();
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
                                  initialRating: _food.toDouble(),
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  unratedColor: Colors.grey.withAlpha(50),
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Color(0xFF4E8649),
                                  ),
                                  onRatingUpdate: (rating) {
                                    _food = rating.toInt();
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
                                  initialRating: _service.toDouble(),
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  unratedColor: Colors.grey.withAlpha(50),
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Color(0xFF4E8649),
                                  ),
                                  onRatingUpdate: (rating) {
                                    _service = rating.toInt();
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
                                  initialRating: _ambiance.toDouble(),
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  unratedColor: Colors.grey.withAlpha(50),
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Color(0xFF4E8649),
                                  ),
                                  onRatingUpdate: (rating) {
                                    _ambiance = rating.toInt();
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
                        addRating(
                            ratingData: RatingData(
                          experience: 3,
                          food: 3,
                          services: 3,
                          ambiance: 3,
                        ));
                        context.goNamed(RouteNames.question.name);
                      },
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
