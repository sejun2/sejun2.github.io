import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../ui/my_theme.dart';

class UnderlinedTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  const UnderlinedTab({
    super.key,
    required this.text,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isSelected ? normalBlue : Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 15,
              ),
            ),
            const Gap(14),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 2,
              width: isSelected ? _textSize(text, context).width + 6 : 0,
              color: normalBlue,
            ),
          ],
        ),
      ),
    );
  }

  Size _textSize(String text, BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
