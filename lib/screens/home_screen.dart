import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/misc/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    final height = MediaQuery
        .sizeOf(context)
        .height;
    final width = MediaQuery
        .sizeOf(context)
        .width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu),
                Container(
                  height: width * .1,
                  width: width * .1,
                  decoration: BoxDecoration(
                      image: DecorationImage(fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTMqcCXSPd1GayrYoUaN2o4vaBaiZCOa7v7Q&s')),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(.5)
                  ),
                )
              ],
            ),
            SizedBox(height: height * .02,),
            Text('Discover', style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: height * .04,
                    fontWeight: FontWeight.bold
                )
            ),),
            SizedBox(height: height * .02,),
            Container(
              height: height * .04,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    labelPadding: EdgeInsets.only(left: 20, right: 20),
                    dividerColor: Colors.transparent,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicator : CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                    controller: _tabController,
                    tabs: [
                      Tab(text: 'Places',),
                      Tab(text: 'Inspiration',),
                      Tab(text: 'Emotions',),
                    ]),
              ),
            ),
            SizedBox(height: height * .02,),
            Container(
              height: height * .3,
              child: TabBarView(
                  controller: _tabController,
                  children: [
                    Text('Places'),
                    Text('insipration'),
                    Text('emotions'),
                  ]),
            )
          ],
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
    final Offset circleOffset = Offset(configuration.size!.width/2 -radius/2, configuration.size!.height);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
  
}