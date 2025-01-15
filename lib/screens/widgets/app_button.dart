import 'package:flutter/cupertino.dart';
import 'package:travel_app/misc/colors.dart';

class AppButton extends StatelessWidget {
  final Widget widget;
  bool isBorder;
  Color backGroundColor;
  AppButton({super.key, required this.widget, this.isBorder = false, required this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height:  60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backGroundColor,
          border: isBorder ? Border.all() : null
      ),
      child: widget,
    );
  }
}
