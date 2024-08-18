import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';

class AppTicketTabs extends StatelessWidget {
  final String firstTab, secondTab;
  const AppTicketTabs({super.key, required this.firstTab, required this.secondTab});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xFFF4F6FD),
      ),
      child:Row(
        children: [
          AppTabs(tabText: firstTab),
          AppTabs(tabText: secondTab, tabBorderRight: true, tabColor: true,),
        ],
      ),
    );
  }
}

class AppTabs extends StatelessWidget {
  final String tabText;
  final bool tabBorderRight;
  final bool tabColor;
  const AppTabs({super.key, required this.tabText, this.tabBorderRight = false, this.tabColor = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      width: size.width * 0.44,
      decoration: BoxDecoration(
          color: tabColor?Colors.transparent:Colors.white,
          borderRadius: tabBorderRight?
          const BorderRadius.horizontal(right: Radius.circular(50))
              :const BorderRadius.horizontal(left: Radius.circular(50))
      ),
      child: Center(child: Text(tabText, style: AppStyles.headLineStyle3,)),
    );
  }
}

