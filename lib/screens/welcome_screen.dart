import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/screens/widgets/app_large_text.dart';
import 'package:travel_app/screens/widgets/app_text.dart';
import 'package:travel_app/screens/widgets/responsive_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List images = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png',
  ];

  List texts = ['Trips', 'Mountains', 'Seas'];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/' + images[index]),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin: EdgeInsets.only(
                    top: height * .15, left: width * .1, right: width * .1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text and buttons
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: texts[index]),
                        AppText(
                          text: 'Mountain',
                          size: 24,
                          color: Colors.black87,
                        ),
                        SizedBox(height: height * .01),
                        AppText(
                          text:
                              'Mountain hikes give you\nan incredible sense of freedom\nalong with endurance tests',
                        ),
                        SizedBox(height: height * .01),
                        ResponsiveButton(
                          width: width * .25,
                        )
                      ],
                    ),
                    // Sliders
                    Column(
                      children: List.generate(
                          3,
                          (indexDots) => AnimatedContainer(
                            duration: Duration(milliseconds: 3),
                            margin: EdgeInsets.only(bottom: 5),
                            width: width * .013,
                            height: index == indexDots ? height * .03 : height * .01,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(.3)
                            ),
                              )),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
