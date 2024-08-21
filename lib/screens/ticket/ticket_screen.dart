import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/res/styles/media.dart';
import 'package:ticket_app/base/res/utils/all_json.dart';
import 'package:ticket_app/base/widgets/app_column_text_layout.dart';
import 'package:ticket_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';
import 'package:ticket_app/screens/ticket/widgets/ticket_positioned_circles.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late int ticketIndex = 0;

  @override
  void didChangeDependencies() {

    if(ModalRoute.of(context)!.settings.arguments != null) {
      var args = ModalRoute.of(context)!.settings.arguments as Map;
      ticketIndex = args['index'];
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppBar(
        title: const Center(child: Text("Tickets")),
        backgroundColor: AppStyles.backgroundColor,

      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              const AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous",),
              const SizedBox(height: 20,),
              //White
              Container(
                  padding: const EdgeInsets.only(left: 16),
                  margin: const EdgeInsets.only(bottom: 0),
                  child: TicketView(ticket: ticketList[ticketIndex], isColor: true,)
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
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(21), bottomLeft: Radius.circular(21)),
                    color: AppStyles.whiteColor
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BarcodeWidget(
                      height: 70,
                      data: 'https://www.dbestech.com',
                      barcode: Barcode.code128(),
                      drawText: false,
                      color: AppStyles.textColor,
                      width: double.infinity,

                    ),
                  ),
                ),

              ),
              const SizedBox(height: 20,),
              //Colorful ticket
              Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: TicketView(ticket: ticketList[ticketIndex])
              ),

            ],
          ),
          const TicketPositionedCircles(),
          const TicketPositionedCircles(isRight: true,),

        ]
      ),
    );
  }
}
