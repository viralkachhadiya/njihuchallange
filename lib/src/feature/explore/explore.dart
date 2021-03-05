import 'package:flutter/material.dart';
import 'package:njihuchallenge/constants/color.dart';
import 'package:njihuchallenge/src/feature/explore/explore_dates.dart';
import 'package:njihuchallenge/src/feature/explore/explore_mates.dart';
import 'package:njihuchallenge/src/provider/explore_provider.dart';
import 'package:provider/provider.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBar,
        body: TabBarView(physics: NeverScrollableScrollPhysics(), children: [
          ExploreDates(),
          ExploreMates(),
        ]),
      ),
    );
  }

  //custome appbar
  PreferredSize get appBar {
    return PreferredSize(
        preferredSize: Size.fromHeight(207.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 90.0,
              padding: EdgeInsets.only(left: 15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Explore",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Consumer<ExploreProvider>(
              builder: (context, value, child) => value.thumbnailList.isEmpty
                  ? emptyThumbnailList()
                  : thumbnailList(value),
            ),
            Container(
              height: 45.0,
              child: TabBar(indicatorColor: appGreen, tabs: [
                Tab(
                  child: Text(
                    "Dates",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "Mates",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ),
            Container(
              height: 2,
              color: appGrey,
            ),
          ],
        ));
  }

  //this is users story view
  thumbnailList(ExploreProvider value) {
    return Consumer<ExploreProvider>(
      builder: (context, value, child) => Container(
        height: 80.0,
        color: appGrey,
        padding: EdgeInsets.all(5),
        child: DragTarget<Map<String, Object>>(
          onWillAccept: (data) => true,
          onAccept: (data) {
            print("accepting data" + data["data"]);
            value.acceptDragabledata(data);
          },
          builder: (context, candidateData, rejectedData) => ListView.builder(
              addAutomaticKeepAlives: true,
              scrollDirection: Axis.horizontal,
              itemCount: value.thumbnailList.length,
              itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 55.0,
                      width: 55.0,
                      child: Stack(
                        children: [
                          Align(
                            child: Container(
                              height: 55.0,
                              width: 55.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          value.thumbnailList[index]),
                                      fit: BoxFit.cover),
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: index == 0
                                          ? appGreen
                                          : Colors.transparent,
                                      width: 3)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Container(
                                height: 17.0,
                                width: 17.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    shape: BoxShape.circle,
                                    color: Colors.green[400]),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
        ),
      ),
    );
  }

  //if we connection the user story that time show it
  Container emptyThumbnailList() {
    return Container(
      height: 80.0,
      color: appGrey,
      padding: EdgeInsets.all(5),
      child: ListView.builder(
          addAutomaticKeepAlives: true,
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 55.0,
                  width: 55.0,
                  child: Stack(
                    children: [
                      Align(
                        child: Container(
                          height: 55.0,
                          width: 55.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: index == 0
                                      ? appGreen
                                      : Colors.transparent,
                                  width: 3)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            height: 17.0,
                            width: 17.0,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                shape: BoxShape.circle,
                                color: Colors.green[400]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}
