import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExploreProvider extends ChangeNotifier {
  bool isDismissible = false;
  List<String> thumbnailList = [];
  List<List<String>> bodyThumbnailList = [];
  int count = 0;

  //snackbar dismissible
  dismissible() {
    isDismissible = true;
    notifyListeners();
  }

//get random user
  Future getRandomUser() async {
    try {
      http.Response response =
          await http.get("https://randomuser.me/api/?results=2");
      if (response.statusCode == 200) {
        print(response.body);
        (json.decode(response.body)["results"] as List)
            .map((e) => thumbnailList.add(e["picture"]["large"]))
            .toList();
        //print(thumbnailList.toString());
      }
    } catch (e) {
      print("something went wrong" + e.toString());
    } finally {
      notifyListeners();
    }
  }

//get body part random users
  Future getBodyThumbnail() async {
    List<String> thumbnail = [];
    try {
      http.Response response =
          await http.get("https://randomuser.me/api/?results=10");
      if (response.statusCode == 200) {
        (json.decode(response.body)["results"] as List)
            .map((e) => thumbnail.add(e["picture"]["large"]))
            .toList();
        bodyThumbnailList.add(thumbnail);
        print(thumbnail.toString());
      }
    } catch (e) {
      print("something went wrong" + e.toString());
    } finally {
      if (count == 6) {
        print(bodyThumbnailList.toString());
        notifyListeners();
      } else {
        count++;
        getBodyThumbnail();
      }
    }
  }

  //accepting data from daragable sources
  acceptDragabledata(Map data) {
    bodyThumbnailList[data["index"]]
        .removeAt(bodyThumbnailList[data["index"]].indexOf(data["data"]));
    thumbnailList.add(data["data"]);
    notifyListeners();
  }
}
