import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/screens/widgets/app_button.dart';
import 'package:travel_app/screens/widgets/app_large_text.dart';
import 'package:travel_app/screens/widgets/app_text.dart';
import 'package:travel_app/screens/widgets/responsive_button.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/mountain.jpeg'),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              top: 60,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      )),
                  // IconButton(onPressed: (){}, icon: Icon(Icons.notification_add, color: Colors.white,))
                ],
              )),
          Positioned(
              top: 320,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 450,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(text: 'Yosemite'),
                          AppLargeText(
                            text: '\$ 250',
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: AppColors.mainColor),
                          AppText(
                              text: 'USA, Calefornia',
                              color: AppColors.mainColor)
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                    index < gottenStars
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: AppColors.starColor)),
                          ),
                          AppText(text: ' (4.0)')
                        ],
                      ),
                      SizedBox(height: 20),
                      AppLargeText(
                        text: 'People',
                        size: 24,
                      ),
                      SizedBox(height: 5),
                      AppText(text: 'Number of people in your group'),
                      SizedBox(height: 10),
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: AppButton(
                                  widget: Center(
                                    child: Text(
                                      (index + 1).toString(),
                                      style: TextStyle(
                                          color: selectedIndex == index
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                  backGroundColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                ))),
                      ),
                      SizedBox(height: 20),
                      AppLargeText(
                        text: 'Description',
                        size: 24,
                      ),
                      AppText(
                          text: 'Yosemite park is located '
                              'in central Us'
                              'in central Us'
                              'in central Us'
                              'in central Us'
                              'in central Us'
                              'in central Us'
                              'in central Us'
                              'in central Us'
                              'in central Us'
                              'in central Us'
                              'in central Us'
                              'in central Us'
                              'in central Us'),

                    ],
                  ),
                ),
              )),
          Positioned(
            left: 20,
            bottom: 20,
            child: Row(
              children: [
                AppButton(
                  widget: Icon(Icons.favorite_border_rounded),
                  isBorder: true,
                  backGroundColor: AppColors.buttonBackground,
                ),
                SizedBox(width: 10),
                ResponsiveButton(isText: true, text: 'Book Trip Now', width: width  * .75,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
