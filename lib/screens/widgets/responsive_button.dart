import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  bool  isText;
  String? text;
  ResponsiveButton({super.key, this.isResponsive, this.width, required this.isText, this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        width:  width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor
        ),
        child: isText ? Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(text!, style: TextStyle(color: Colors.white),),
            Image.asset('assets/img/button-one.png'),
          ],),
        ) : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/button-one.png'),
          ],
        ),
      ),
    );
  }
}
