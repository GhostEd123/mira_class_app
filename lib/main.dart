import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mira_class_app/constants.dart';
import 'package:mira_class_app/homePage.dart';
import 'package:mira_class_app/loginPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mira_class_app/navigation.dart';

void main() async {
  //Initialising GetX
  await GetStorage.init();
  runApp(const MyApp());
}

final getX = GetStorage();
Constants user_details = Constants();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => const MyHomePage(
      //         title: "title",
      //         name: "",
      //       ),
      //   "/s": (context) => const LoginPage(),
      //   // "giG"
      // },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: ScreensControl()
    );
  }
}

