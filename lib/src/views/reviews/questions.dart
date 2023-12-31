import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/router/route_names.dart';
import '../../../core/widget/bg.dart';
import '../../../main.dart';
import 'components/page_four.dart';
import 'components/page_one.dart';
import 'components/page_three.dart';
import 'components/page_two.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;

  final List<Widget> _pages = [
    const PageOne(),
    const PageTwo(),
    const PageThree(),
    const PageFour(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 640,
          height: MediaQuery.of(context).size.height,
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
                          image: AssetImage('assets/images/questions.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                        width: 316,
                        height: 300,
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (int page) {
                            setState(() {
                              _activePage = page;
                            });
                          },
                          itemCount: _pages.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _pages[index % _pages.length];
                          },
                        )),
                    SizedBox(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(
                            _pages.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: InkWell(
                                    onTap: () {
                                      _pageController.animateToPage(index,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeIn);
                                    },
                                    child: CircleAvatar(
                                      radius: 8,
                                      backgroundColor: _activePage == index
                                          ? const Color(0xFF4E8649)
                                          : Colors.grey.withAlpha(50),
                                    ),
                                  ),
                                )),
                      ),
                    ),
                    _activePage == _pages.length - 1
                        ? GestureDetector(
                            onTap: () {
                              context
                                  .goNamed(RouteNames.marketingQuestion.name);
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
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox(
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
