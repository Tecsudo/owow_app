import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  bool _isChecked = true;

  List<String> text = ["Yes", "No"];

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
            ),
          ),
        ),
        Column(
          children: text
              .map((t) => CheckboxListTile(
                    title: Text(t,
                        style: const TextStyle(
                          color: Color(0xFF132513),
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        )),
                    value: _isChecked,
                    onChanged: (val) {
                      setState(() {
                        _isChecked = val!;
                      });
                    },
                  ))
              .toList(),
        )
      ],
    );
  }
}
