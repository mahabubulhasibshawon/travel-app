import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/screens/widgets/app_large_text.dart';
import 'package:travel_app/screens/widgets/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var images = {
    'balloning.png': 'Balloning',
    'hiking.png': 'Hiking',
    'kayaking.png': 'Kayaking',
    'snorkling.png': 'Snorkling'
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu),
                  Container(
                    height: width * .1,
                    width: width * .1,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTMqcCXSPd1GayrYoUaN2o4vaBaiZCOa7v7Q&s')),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(.5)),
                  )
                ],
              ),
              SizedBox(height: height * .04),
              Text(
                'Discover',
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: height * .04, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: height * .03
              ),
              // tab bar
              Container(
                height: height * .04,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      dividerColor: Colors.transparent,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicator: CircleTabIndicator(
                          color: AppColors.mainColor, radius: 4),
                      controller: _tabController,
                      tabs: [
                        const Tab(
                          text: 'Places'
                        ),
                        const Tab(
                          text: 'Inspiration'
                        ),
                        const Tab(
                          text: 'Emotions'
                        ),
                      ]),
                ),
              ),
              SizedBox(height: height * .02),
              // tabbar view
              Container(
                height: height * .3,
                child: TabBarView(controller: _tabController, children: [
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.only(right: 20),
                            height: height * .3,
                            width: width * .5,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/img/mountain.jpeg'),
                                    fit: BoxFit.cover)),
                          )),
                  const Text('insipration'),
                  const Text('emotions'),
                ]),
              ),
              SizedBox(height: height * .02),
              Row(
                children: [
                  AppLargeText(text: 'Explore more'),
                  Expanded(child: Container()),
                  AppText(
                    text: 'See all',
                    color: AppColors.mainColor,
                  )
                ],
              ),
              SizedBox(height: height * .02),
              Container(
                height: height * .15,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              // image
                              Container(
                                // margin: EdgeInsets.only(right: 20),
                                height: height * .09,
                                width: height * .09,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage('assets/img/' +
                                            images.keys.elementAt(index)),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(height: height * .01),
                              // text
                              Container(
                                child: AppText(
                                  text: images.values.elementAt(index),
                                  color: AppColors.textColor2,
                                ),
                              )
                            ],
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2, configuration.size!.height);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}