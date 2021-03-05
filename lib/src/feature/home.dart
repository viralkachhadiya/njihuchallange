import 'package:flutter/material.dart';
import 'package:njihuchallenge/app/app_config.dart';
import 'package:njihuchallenge/app/state_container.dart';
import 'package:njihuchallenge/constants/color.dart';
import 'package:njihuchallenge/src/feature/connections/connections.dart';
import 'package:njihuchallenge/src/feature/custom_bottom_nav_bar.dart';
import 'package:njihuchallenge/src/feature/dashboard/dashboard.dart';
import 'package:njihuchallenge/src/feature/dates/dates.dart';
import 'package:njihuchallenge/src/feature/experiences/experiences.dart';
import 'package:njihuchallenge/src/feature/explore/explore.dart';
import 'package:njihuchallenge/src/provider/home_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    switch (StateContainer.of(context).globalState.env) {
      case Env.development:
        return Scaffold(
            body: Consumer<HomeProvider>(
              builder: (context, value, child) => IndexedStack(
                index: value.index,
                children: [
                  Explore(),
                  Connections(),
                  Experiences(),
                  Dates(),
                  DashBoard()
                ],
              ),
            ),
            bottomNavigationBar: CusttomBottomNavBar());
        break;
      case Env.production:
        return Scaffold(
          body: Center(
              child: RichText(
                  text: TextSpan(children: [
            TextSpan(
                text: "App is running on ",
                style: TextStyle(color: appDarkGreen)),
            TextSpan(
                text: StateContainer.of(context).globalState.appName.toString(),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: appDarkGreen))
          ]))),
        );
        break;
      case Env.staging:
        return Scaffold(
          body: Center(
              child: RichText(
                  text: TextSpan(children: [
            TextSpan(
                text: "App is running on ",
                style: TextStyle(color: appDarkGreen)),
            TextSpan(
                text: StateContainer.of(context).globalState.appName.toString(),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: appDarkGreen))
          ]))),
        );
        break;
      case Env.testing:
        return Scaffold(
          body: Center(
              child: RichText(
                  text: TextSpan(children: [
            TextSpan(
                text: "App is running on ",
                style: TextStyle(color: appDarkGreen)),
            TextSpan(
                text: StateContainer.of(context).globalState.appName.toString(),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: appDarkGreen))
          ]))),
        );
        break;
      default:
        return Scaffold(
            body: Consumer<HomeProvider>(
              builder: (context, value, child) => IndexedStack(
                index: value.index,
                children: [
                  Explore(),
                  Connections(),
                  Experiences(),
                  Dates(),
                  DashBoard()
                ],
              ),
            ),
            bottomNavigationBar: CusttomBottomNavBar());
    }
  }
}
