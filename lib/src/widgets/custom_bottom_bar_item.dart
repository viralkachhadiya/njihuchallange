import 'package:flutter/material.dart';
import 'package:njihuchallenge/constants/color.dart';

class CustomBottomBarItem extends StatelessWidget {
  final Text text;
  final Widget icon;
  final int currentIndex;
  final Function onClick;
  final int index;
  const CustomBottomBarItem({
    this.text,
    this.icon,
    this.currentIndex = 0,
    this.onClick,
    this.index,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onClick,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            currentIndex == index
                ? Container(
                    height: 2.0,
                    decoration: BoxDecoration(color: appGreen),
                  )
                : SizedBox(
                    height: 2,
                  ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(
                  height: 5.0,
                ),
                text
              ],
            ))
          ],
        ),
      ),
    );
  }
}
