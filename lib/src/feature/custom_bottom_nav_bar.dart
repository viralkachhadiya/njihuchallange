import 'package:flutter/material.dart';
import 'package:njihuchallenge/constants/color.dart';
import 'package:njihuchallenge/src/provider/home_provider.dart';
import 'package:njihuchallenge/src/widgets/custom_bottom_bar_item.dart';
import 'package:provider/provider.dart';

class CusttomBottomNavBar extends StatelessWidget {
  const CusttomBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) => Container(
          height: 70.0,
          decoration:
              BoxDecoration(border: Border(top: BorderSide(color: appWhite))),
          child: Row(
            children: [
              SizedBox(
                width: 5.0,
              ),
              CustomBottomBarItem(
                onClick: () {
                  value.setCurrentIndex(0);
                },
                currentIndex: value.index,
                index: 0,
                text: Text(
                  "Explore",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10.0, color: Colors.grey),
                ),
                icon: Image.asset(
                  "assets/images/Combined Shape@3x.png",
                  color: value.index == 0 ? appGreen : Colors.grey,
                  width: 20.0,
                  height: 20.0,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              CustomBottomBarItem(
                onClick: () {
                  value.setCurrentIndex(1);
                },
                currentIndex: value.index,
                index: 1,
                text: Text(
                  "Connections",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10.0, color: Colors.grey),
                ),
                icon: Container(
                  width: 25.0,
                  height: 25.0,
                  child: Stack(
                    children: [
                      Align(
                        child: Image.asset(
                          "assets/images/Fill 1 Copy 4@3x.png",
                          color: value.index == 1 ? appGreen : Colors.grey,
                          width: 20.0,
                          height: 20.0,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 12.0,
                          width: 12.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: appGreen),
                          child: Text(
                            "5",
                            style: TextStyle(
                                fontSize: 7.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              CustomBottomBarItem(
                onClick: () {
                  value.setCurrentIndex(2);
                },
                currentIndex: value.index,
                index: 2,
                text: Text(
                  "Experiences",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10.0, color: Colors.grey),
                ),
                icon: Image.asset(
                  "assets/images/Fill 1 Copy 11.png",
                  color: value.index == 2 ? appGreen : Colors.grey,
                  width: 20.0,
                  height: 20.0,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              CustomBottomBarItem(
                onClick: () {
                  value.setCurrentIndex(3);
                },
                currentIndex: value.index,
                index: 3,
                text: Text(
                  "Dates",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10.0, color: Colors.grey),
                ),
                icon: Image.asset(
                  "assets/images/Fill 1 Copy 12.png",
                  color: value.index == 3 ? appGreen : Colors.grey,
                  width: 20.0,
                  height: 20.0,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              CustomBottomBarItem(
                onClick: () {
                  value.setCurrentIndex(4);
                },
                currentIndex: value.index,
                index: 4,
                text: Text(
                  "DashBoard",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10.0, color: Colors.grey),
                ),
                icon: Image.asset(
                  "assets/images/Fill 1 Copy 14.png",
                  color: value.index == 4 ? appGreen : Colors.grey,
                  width: 20.0,
                  height: 20.0,
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
            ],
          )),
    );
  }
}
