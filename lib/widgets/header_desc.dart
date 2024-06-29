import 'package:flutter/material.dart';

import '../ui/my_theme.dart';

class HeaderDesc extends StatelessWidget {
  const HeaderDesc({super.key, required this.title, required this.desc});

  final String title;
  final List<String> desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightBlue.withOpacity(0.1),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const SizedBox(width: 8.0),
          Text(
            title,
            style: const TextStyle(color: normalBlue, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 12),
          Container(
            height: 28,
            width: 1,
            color: lightBlue.withOpacity(0.5),
          ),
          const SizedBox(width: 12),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: desc
                .map((e) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                e,
                style: const TextStyle(color: lightBlue),
              ),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
