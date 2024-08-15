import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/res/styles/media.dart';
import 'package:ticket_app/base/res/utils/app_routes.dart';
import 'package:ticket_app/screens/search/widgets/app_text_icon.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';
import 'package:ticket_app/screens/search/widgets/find_ticket.dart';

import '../../base/widgets/app_double_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const SizedBox(height: 40,),
          Text("What are\n you looking for?", style: AppStyles.headLineStyle1.copyWith(
            fontSize: 35
          ),),
          const SizedBox(height: 20,),
          const AppTicketTabs(),
          const SizedBox(height: 25,),
          const AppTextIcon(icon: Icons.flight_takeoff_rounded, text: "Departure",),
          const SizedBox(height: 25,),
          const AppTextIcon(icon: Icons.flight_land_rounded, text: "Arrival",),
          const SizedBox(height: 25,),
          const FindTicket(),
          const SizedBox(height: 40,),
          AppDoubleText(
            bigText: "Upcoming Flights",
            smallText: "View all",
            func: () => Navigator.pushNamed(context,AppRoutes.allTickets,),
          ),
          const SizedBox(height: 15,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                width: size.width * 0.42,
                height: 435,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: CupertinoColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 5,
                      spreadRadius: 1
                    )
                  ]
                ),
                child:Column(
                  children: [
                    Container(
                      height: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image:const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppMedia.planeSit)
                        )

                      ),
                    ),
                    const SizedBox(height: 12,),
                    Text("20% discount of the early booking for this flight. Don't miss.", style: AppStyles.headLineStyle2,)
                  ],
                ),
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        width: size.width * 0.44,
                        height: 210,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: const Color(0xFF3AB8B8)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Discount\nfor survey", style: AppStyles.headLineStyle2.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),),
                            const SizedBox(height: 10,),
                            Text(
                              "Take the survey for our services and get discount ",
                              style: AppStyles.headLineStyle2.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18
                              ),),
                          ],
                        ),
                      ),
                      Positioned(
                        right: -45,
                        top: -40,
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 18,
                                  color: AppStyles.circleColor,
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    width: size.width * 0.44,
                    height: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xFFEC6545)
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Take Love",
                          style: AppStyles.headLineStyle2.copyWith(color: Colors.white),),

                      ],
                    ),
                  )
                ],
              ),
            ],
          )

        ],
      ),
    );
  }
}
