import 'package:diagonal_scrollview/diagonal_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:njihuchallenge/constants/color.dart';
import 'package:njihuchallenge/src/provider/explore_provider.dart';
import 'package:njihuchallenge/src/widgets/shap_painder.dart';
import 'package:provider/provider.dart';

class ExploreDates extends StatelessWidget {
  DiagonalScrollViewController _controlPanelController;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _diagonalScrollView(),
        _dismissibleSnackbar(context),
        messageBot,
      ],
    );
  }

  //all users profile thumbnail
  DiagonalScrollView _diagonalScrollView() {
    return DiagonalScrollView(
        onCreated: (DiagonalScrollViewController controller) {
          Offset offset = Offset(500, 200);

          _controlPanelController = controller;
          _controlPanelController.moveTo(location: offset);
        },
        child: Consumer<ExploreProvider>(
          builder: (context, value, child) => value.bodyThumbnailList.isNotEmpty
              ? Column(
                  children: [
                    for (int i = 0; i < value.bodyThumbnailList.length; i++)
                      Row(
                        children: [
                          SizedBox(
                            width: i % 2 == 0 ? 120.0 : 0.0,
                          ),
                          Row(
                            children: value.bodyThumbnailList[i].map((e) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Draggable(
                                  data: {"index": i, "data": e},
                                  feedback: Container(
                                    height: 120.0,
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(e),
                                            fit: BoxFit.cover),
                                        shape: BoxShape.circle,
                                        color: appWhite),
                                  ),
                                  childWhenDragging: SizedBox.shrink(),
                                  child: Container(
                                    height: 120.0,
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(e),
                                            fit: BoxFit.cover),
                                        shape: BoxShape.circle,
                                        color: appWhite),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      )
                  ],
                )
              : Column(
                  children: [
                    for (int i = 0; i < 10; i++)
                      Row(
                        children: [
                          SizedBox(
                            width: i % 2 == 0 ? 120.0 : 0.0,
                          ),
                          Row(
                              children: List.generate(5, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                height: 120.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: appWhite),
                              ),
                            );
                          }).toList()),
                        ],
                      )
                  ],
                ),
        ));
  }

  //messagebot that are show on bottom
  Align get messageBot {
    return Align(
      alignment: Alignment.bottomRight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: CustomPaint(
              painter: ShapPainter(),
              child: Container(
                height: 55.0,
                width: 150.0,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Do you want to set your intent?",
                  maxLines: 2,
                  style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 40.0,
              backgroundImage: AssetImage("assets/images/Asset 22@3x.png")),
        ],
      ),
    );
  }

  //top of snakebar
  Consumer _dismissibleSnackbar(BuildContext context) {
    return Consumer<ExploreProvider>(
      builder: (context, value, child) => !value.isDismissible
          ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  height: 30.0,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "We have 66 matches for your today",
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.w600),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          value.dismissible();
                        },
                        child: Icon(
                          Icons.close,
                          size: 20.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
