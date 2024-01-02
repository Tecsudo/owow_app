import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  int _selectedIndex = -1;
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
            'Does the food taste good?',
            style: TextStyle(
              color: Color(0xFF132513),
              fontSize: 24,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Column(
          children: text.asMap().entries.map((entry) {
            int idx = entry.key;
            String t = entry.value;
            return CheckboxListTile(
              title: Text(t,
                  style: const TextStyle(
                    color: Color(0xFF132513),
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  )),
              value: _selectedIndex == idx,
              onChanged: (val) {
                setState(() {
                  if (val == true) {
                    _selectedIndex = idx;
                  } else {
                    _selectedIndex = -1;
                  }
                });
              },
            );
          }).toList(),
        )
      ],
    );
  }
}
