import 'package:flutter/material.dart';

class PageFour extends StatefulWidget {
  const PageFour({super.key});

  @override
  State<PageFour> createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 313,
          height: 59,
          child: Text(
            'Which items do you like the most ?',
            style: TextStyle(
              color: Color(0xFF132513),
              fontSize: 24,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(10),
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: const Color(0xFFB7CAA9),
        //       borderRadius: BorderRadius.circular(10.0),
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
        //       child: TextFormField(
        //         style: const TextStyle(
        //           color: Color(0xFF132513),
        //           fontSize: 18,
        //           fontFamily: 'Roboto',
        //           fontWeight: FontWeight.w400,
        //         ),
        //         decoration: const InputDecoration(
        //           border: InputBorder.none,
        //           hintText: 'Answer ...',
        //           hintStyle: TextStyle(
        //             color: Color(0xFF5E6E59),
        //             fontSize: 18,
        //             fontFamily: 'Roboto',
        //             fontWeight: FontWeight.w400,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
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
