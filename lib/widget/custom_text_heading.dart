import 'package:flutter/material.dart';

class CustomSectionHeading extends StatelessWidget {
  final String text;

  const CustomSectionHeading({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cleanText = text.trim();

    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 6),
      child: Text(
        cleanText,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w800,
          fontSize: 32,
          letterSpacing: 0.5,
          color: isDark ? Colors.white : const Color(0xff0f172a),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class CustomSectionSubHeading extends StatelessWidget {
  final String text;

  const CustomSectionSubHeading({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cleanText = text.trim();

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Text(
        cleanText,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          fontSize: 14.5,
          color: isDark ? Colors.white60 : const Color(0xff64748b),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
