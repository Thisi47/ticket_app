import 'package:flutter/material.dart';

import '../../../base/res/styles/app_styles.dart';

class TicketPositionedCircles extends StatelessWidget {
  const TicketPositionedCircles({super.key, this.isRight});
  final bool? isRight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: isRight==null?22:null,
        right: isRight==true?22:null,
        top: 255,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: AppStyles.textColor),
          ),
          child: CircleAvatar(
            maxRadius: 4,
            backgroundColor: AppStyles.textColor,
          ),
        ));
  }
}
