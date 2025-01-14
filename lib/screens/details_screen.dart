import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.menu, color: Colors.white,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.notification_add, color: Colors.white,))
                ],)),
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/img/mountain.jpeg'),fit: BoxFit.cover)
                ),
              )),

        ],
      ),
    );
  }
}
