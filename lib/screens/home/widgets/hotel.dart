import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/res/styles/media.dart';

class Hotel extends StatelessWidget {
  final bool wholeScreen;
  final Map<String, dynamic> hotel;
  const Hotel({super.key, this.wholeScreen = true, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(right: wholeScreen?16:0),
      width: size.width * 0.6,
      height: 350,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppStyles.primaryColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            // margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppStyles.primaryColor,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/assets/images/${hotel['image']}"),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(hotel['place'], style: AppStyles.headLineStyle2.copyWith(
              color: AppStyles.kakiColor
            ),),
          ),
           const SizedBox(height: 5,),
           Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(hotel['destination'], style: AppStyles.headLineStyle2.copyWith(
              color: Colors.white
            ),),
          ),
           const SizedBox(height: 5,),
           Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text("\$${hotel['price']}/night", style: AppStyles.headLineStyle2.copyWith(
              color: AppStyles.kakiColor
            ),),
          ),


        ],
      ),
    );
  }
}
