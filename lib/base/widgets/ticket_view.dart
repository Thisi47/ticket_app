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
  const TicketView({super.key, required this.ticket, this.wholeScreen = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width*0.85,
      height: 190,
      child: Container(
        margin: EdgeInsets.only(right: wholeScreen?0:16),
        child: Column(
          children: [

            //Blue part of the ticket
            Container(
             padding: const EdgeInsets.all(16),
             decoration: BoxDecoration(
               color: AppStyles.ticketBlue,
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
                      Text(
                          ticket['from']['code'],
                          style: AppStyles.headLineStyle3.copyWith(
                            color: Colors.white
                          ),
                      ),
                      Expanded(child: Container()),
                      const BigDot(),
                      Expanded(child: Stack(
                          children: [
                            const SizedBox(
                              height: 24,
                              child: AppLayoutBuilderWidget(randomDivider: 6,),
                            ),
                            Center(child: Transform.rotate(
                                angle: 1.57,
                                child: const Icon(
                                  Icons.local_airport_rounded,
                                  color: Colors.white,
                                )
                              )
                            ,)
                          ]
                      )
                      ),
                      const BigDot(),
                      Expanded(child: Container()),

                      Text(
                          ticket['to']['code'],
                          style: AppStyles.headLineStyle3.copyWith(
                            color: Colors.white
                          ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 4,),
                  //Show departure and destination names with times
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(text: ticket['from']['name']),
                      ),
                      Expanded(child: Container()),
                      TextStyleFourth(text: ticket['flying_time']),
                      Expanded(child: Container()),

                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(text: ticket['to']['name'], align: TextAlign.end,),
                      ),

                    ],
                  ),
                ],
              ),
            ),

            //circles and dots
            Container(
              color: AppStyles.ticketOrange,
              child: const Row(
                children: [
                  BigCircular(isRight: false,),
                  Expanded(child: AppLayoutBuilderWidget(randomDivider: 16, width: 6,)),
                  BigCircular(isRight: true,),
                ],
              ),
            ),

            //Orange part of the ticket
            Container(
             padding: const EdgeInsets.all(16),
             decoration: BoxDecoration(
               color: AppStyles.ticketOrange,
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
                         bottomText: "DATE"),
                     AppColumnTextLayout(
                       topText: ticket['departure_time'],
                       bottomText: "Departure time",
                       crossAxisAlignment: CrossAxisAlignment.center,),
                     AppColumnTextLayout(
                       topText: ticket['number'].toString(),
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
