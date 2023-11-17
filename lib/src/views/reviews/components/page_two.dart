import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  String _verticalGroupValue = "Economy";

  final _status = ["Economy", "Business", "VIP"];

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
        RadioGroup<String>.builder(
          activeColor: const Color(0xFF4E8649),
          textStyle: const TextStyle(
            color: Color(0xFF132513),
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
          groupValue: _verticalGroupValue,
          onChanged: (value) => setState(() {
            _verticalGroupValue = value!;
          }),
          items: _status,
          itemBuilder: (item) => RadioButtonBuilder(
            item,
          ),
        ),
      ],
    );
  }
}
