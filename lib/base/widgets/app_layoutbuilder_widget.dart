import 'package:flutter/material.dart';

class AppLayoutBuilderWidget extends StatelessWidget {
  const AppLayoutBuilderWidget({super.key, required this.randomDivider, this.width = 3});
  final int randomDivider;
  final double width;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints contraints){
      print("${contraints.constrainWidth()}");
      return Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: List.generate((contraints.constrainWidth()/randomDivider).floor(), (index) =>
            SizedBox(
              width: width,
              height: 1,
              child: const DecoratedBox(
                decoration:BoxDecoration(
                  color: Colors.white,
                ),
              )
            )
        )
      );
    });
  }
}
