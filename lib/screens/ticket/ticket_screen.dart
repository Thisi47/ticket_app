import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/res/styles/media.dart';
import 'package:ticket_app/base/res/utils/all_json.dart';
import 'package:ticket_app/base/widgets/app_column_text_layout.dart';
import 'package:ticket_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/base/widgets/text_style_fourth.dart';
import 'package:ticket_app/base/widgets/text_style_third.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const SizedBox(height: 40,),
          Text("Tickets", style: AppStyles.headLineStyle1,),
          const SizedBox(height: 20,),
          const AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous",),
          const SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.only(left: 16),
            margin: const EdgeInsets.only(bottom: 0),
            child: TicketView(ticket: ticketList[0], isColor: true,)
          ),
          const SizedBox(height: 1,),
          Container(
            color: AppStyles.whiteColor,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnTextLayout(topText: "Flatter DB", bottomText: "Passenger", isColor: true,),
                    AppColumnTextLayout(topText: "5221 36869", bottomText: "Passport", isColor: true, crossAxisAlignment: CrossAxisAlignment.end,),

                  ],
                ),
                const SizedBox(height: 20,),
                const AppLayoutBuilderWidget(randomDivider: 15, width: 10, isColor: true, ),
                const SizedBox(height: 20,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnTextLayout(topText: "3489 2354", bottomText: "Number of E-ticket ", isColor: true,),
                    AppColumnTextLayout(topText: "B467823", bottomText: "Booking code", isColor: true, crossAxisAlignment: CrossAxisAlignment.end,),

                  ],
                ),
                const SizedBox(height: 10,),
                const AppLayoutBuilderWidget(randomDivider: 15, width: 10, isColor: true, ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(AppMedia.visaCard, scale: 11 ,),
                            Text(" *** 2462", style: AppStyles.headLineStyle3,)
                          ],
                        ),
                        Text("Payment Method", style: AppStyles.headLineStyle4.copyWith(
                          color: AppStyles.textFourthColor
                        ),)
                      ],
                    ),
                    const AppColumnTextLayout(topText: "\$249.99", bottomText: "Price", isColor: true, crossAxisAlignment: CrossAxisAlignment.end,),

                  ],
                ),

              ],
            ),
          ),
          const SizedBox(height: 1,),

          //Bottom of the ticket detail section
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(21), bottomLeft: Radius.circular(21)),
              color: AppStyles.whiteColor
            ),
            child: Container(
              // padding: ,
            ),

          )
        ],
      ),
    );
  }
}
