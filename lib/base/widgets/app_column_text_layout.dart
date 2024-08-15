import 'package:flutter/material.dart';
import 'package:ticket_app/base/widgets/text_style_fourth.dart';
import 'package:ticket_app/base/widgets/text_style_third.dart';

class AppColumnTextLayout extends StatelessWidget {
  final String topText, bottomText;
  final crossAxisAlignment;
  const AppColumnTextLayout({super.key, required this.topText, required this.bottomText, this.crossAxisAlignment = CrossAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        TextStyleThird(text: topText),
        const SizedBox(height: 5,),
        TextStyleFourth(text: bottomText),
      ],
    );
  }
}
