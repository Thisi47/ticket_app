import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/res/utils/all_json.dart';
import 'package:ticket_app/screens/home/widgets/hotel.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppBar(
        title: const Center(child: Text("All Hotels"),),
        backgroundColor: AppStyles.backgroundColor,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: hotelList.length,
                  itemBuilder: (context, index) {
                      var hotel = hotelList[index];
                      return HotelGridView(hotel: hotel);
                  },
          ),
        ),
      ),
    );
  }
}


class HotelGridView extends StatelessWidget {
  final bool wholeScreen;
  final Map<String, dynamic> hotel;
  const HotelGridView({super.key, this.wholeScreen = true, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: wholeScreen?8:0),
        // width: size.width * 0.6,
        height: 350,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppStyles.primaryColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppStyles.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/assets/images/${hotel['image']}"),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(hotel['place'], style: AppStyles.headLineStyle3.copyWith(
                  color: AppStyles.textFourthColor
              ),),
            ),
            const SizedBox(height: 5,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(hotel['destination'], style: AppStyles.headLineStyle3.copyWith(
                      color: Colors.white
                  ),),
                ),
                const SizedBox(width: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text("\$${hotel['price']}/night", style: AppStyles.headLineStyle4.copyWith(
                      color: AppStyles.textFourthColor
                  ),),
                ),
              ],
            )
      
      
          ],
        ),
      ),
    );
  }
}