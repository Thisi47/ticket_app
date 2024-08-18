import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/widgets/app_column_text_layout.dart';
import 'package:ticket_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/base/widgets/big_circular.dart';
import 'package:ticket_app/base/widgets/big_dot.dart';
import 'package:ticket_app/base/widgets/text_style_fourth.dart';
import 'package:ticket_app/base/widgets/text_style_third.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  final bool? isColor;
  const TicketView({super.key, required this.ticket, this.wholeScreen = false, this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width*0.85,
      height: 187,
      child: Container(
        margin: EdgeInsets.only(right: wholeScreen?0:16, bottom: 0),
        child: Column(
          children: [

            //Blue part of the ticket
            Container(

             padding: const EdgeInsets.all(16),
             decoration: BoxDecoration(
               color: isColor==null?AppStyles.ticketBlue:AppStyles.whiteColor,
               borderRadius:const BorderRadius.only(
                   topLeft: Radius.circular(21),
                   topRight: Radius.circular(21)
               )
             ),
              child: Column(
                children: [

                  //Show departure and destination with icons first line
                  Row(
                    children: [
                      TextStyleThird(text: ticket['from']['code'], isColor: isColor,),
                      Expanded(child: Container()),
                      BigDot(isColor: isColor,),
                      Expanded(child: Stack(
                          children: [
                            const SizedBox(
                              height: 24,
                              child: AppLayoutBuilderWidget(randomDivider: 6,),
                            ),
                            Center(child: Transform.rotate(
                                angle: 1.57,
                                child: Icon(
                                  Icons.local_airport_rounded,
                                  color: isColor==null?AppStyles.whiteColor:AppStyles.planeColor2,
                                )
                              )
                            ,)
                          ]
                      )
                      ),
                      BigDot(isColor: isColor,),
                      Expanded(child: Container()),

                      TextStyleThird(text: ticket['to']['code'], isColor: isColor,),

                    ],
                  ),
                  const SizedBox(height: 4,),
                  //Show departure and destination names with times
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(text: ticket['from']['name'], isColor: isColor,),
                      ),
                      Expanded(child: Container()),
                      TextStyleFourth(text: ticket['flying_time'], isColor: isColor,),
                      Expanded(child: Container()),

                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(text: ticket['to']['name'], align: TextAlign.end, isColor: isColor,),
                      ),

                    ],
                  ),
                ],
              ),
            ),

            //circles and dots
            Container(
              color: isColor==null?AppStyles.ticketOrange:AppStyles.whiteColor,
              child: Row(
                children: [
                  BigCircular(isRight: false, isColor: isColor),
                  Expanded(child: AppLayoutBuilderWidget(randomDivider: 16, width: 6, isColor: isColor,)),
                  BigCircular(isRight: true, isColor: isColor,),
                ],
              ),
            ),

            //Orange part of the ticket
            Container(
             padding: const EdgeInsets.all(16),
             decoration: BoxDecoration(
               color: isColor==null?AppStyles.ticketOrange:AppStyles.whiteColor,
               borderRadius:const BorderRadius.only(
                   bottomLeft: Radius.circular(21),
                   bottomRight: Radius.circular(21)
               )
             ),
              child: Column(
                children: [

                  //Show departure and destination with icons first line
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     AppColumnTextLayout(
                         topText: ticket['date'],
                         bottomText: "DATE",
                         isColor: isColor,
                     ),
                     AppColumnTextLayout(
                       topText: ticket['departure_time'],
                       isColor: isColor,
                       bottomText: "Departure time",
                       crossAxisAlignment: CrossAxisAlignment.center,),
                     AppColumnTextLayout(
                       topText: ticket['number'].toString(),
                       isColor: isColor,
                       bottomText: "Number",
                       crossAxisAlignment: CrossAxisAlignment.end,),
                    ],
                  ),
                  const SizedBox(height: 4,),
                  //Show departure and destination names with times
                  // Row(
                  //   children: [
                  //     const TextStyleFourth(text: "Date"),
                  //     Expanded(child: Container()),
                  //     const TextStyleFourth(text: "Departure time", align: TextAlign.end,),
                  //     Expanded(child: Container()),
                  //     const TextStyleFourth(text: "Number", align: TextAlign.end,),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
