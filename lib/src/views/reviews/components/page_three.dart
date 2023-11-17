import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 313,
          height: 36,
          child: Text(
            'Does the food tastes good?',
            style: TextStyle(
              color: Color(0xFF132513),
              fontSize: 24,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFB7CAA9),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: TextFormField(
                style: const TextStyle(
                  color: Color(0xFF132513),
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Answer ...',
                  hintStyle: TextStyle(
                    color: Color(0xFF5E6E59),
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
          ),
        ),
        // TextField(
        //   decoration: InputDecoration(
        //     border: InputBorder.none,
        //     helperText: 'Answer...',
        //   ),
        // ),
      ],
    );
  }
}
