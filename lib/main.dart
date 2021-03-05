// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:njihuchallenge/src/feature/home.dart';
// import 'package:njihuchallenge/src/provider/explore_provider.dart';
// import 'package:njihuchallenge/src/provider/home_provider.dart';
// import 'package:provider/provider.dart';

// void main() {
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.dark));
//   runApp(MultiProvider(providers: [
//     ChangeNotifierProvider<HomeProvider>(
//       create: (_) => HomeProvider(),
//     ),
//     ChangeNotifierProvider<ExploreProvider>(
//         create: (_) => ExploreProvider()
//           ..getRandomUser()
//           ..getBodyThumbnail())
//   ], child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           fontFamily: 'Roboto',
//           primaryColor: Colors.white,
//           accentColor: Colors.white,
//           scaffoldBackgroundColor: Colors.white),
//       home: Home(),
//     );
//   }
// }

//ignore this file but it is needed
void main() {}
