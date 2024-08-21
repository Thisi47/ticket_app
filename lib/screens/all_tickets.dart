import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/res/utils/app_routes.dart';

import '../base/res/utils/all_json.dart';
import '../base/widgets/ticket_view.dart';

class AllTickets extends StatelessWidget {
  const AllTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppBar(
        title: const Center(child:  Text("All Tickets")),
        backgroundColor: AppStyles.backgroundColor,
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ticketList.map((singleTicket) =>
                    GestureDetector(
                      onTap: () {
                        var index = ticketList.indexOf(singleTicket);
                        Navigator.pushNamed(context, AppRoutes.ticketScreen, arguments: {"index" : index});
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                          child: TicketView(ticket: singleTicket, wholeScreen: true,)
                        ),
                      )
                ).toList(),
              ),
            )
        ),
      ]
      ),
    );
  }
}
