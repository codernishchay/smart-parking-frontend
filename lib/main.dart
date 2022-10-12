// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names, prefer_const_declarations, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_parking_app/utils/colors_theme.dart';
import 'package:simple_parking_app/utils/data_pref.dart';
import 'package:simple_parking_app/utils/router.dart';
import 'package:simple_parking_app/utils/widgets/loading_screen.dart';
import 'package:simple_parking_app/view/auth/login_page.dart';
import 'package:simple_parking_app/view/home/home_page.dart';
import 'package:simple_parking_app/view/parking/parking_page.dart';
import 'package:simple_parking_app/view/profile/profile_page.dart';
import 'package:simple_parking_app/view/splash_screen.dart';


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';



void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Parking',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      getPages: getRoutePages,
      initialRoute: SplashScreen.TAG,
    );
  }
}

class NavBar extends StatelessWidget {
  static final String TAG = '/NavBar';

  final userID =  "nishchay" ; // Get.parameters['userID'];

  var selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    List<Widget?> screens = [HomePage(), null, ProfilePage(userID!)];
    return Obx(
      () => Scaffold(
        body: screens.elementAt(selectedIndex.value),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          unselectedItemColor: Colors.white,
          selectedItemColor: ColorsTheme.myOrange,
          backgroundColor: ColorsTheme.myDarkBlue,
          currentIndex: selectedIndex.value,
          iconSize: 25,
          items: [
            BottomNavigationBarItem(
              label: "Porch",
              icon: Icon(
                Icons.home_outlined,
                size: 30,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.home_rounded,
                size: 35,
                color: ColorsTheme.myOrange,
              ),
            ),
            BottomNavigationBarItem(
              label: "Parking",
              icon: Icon(
                Icons.local_parking_outlined,
                size: 30,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.local_parking_rounded,
                size: 35,
                color: ColorsTheme.myOrange,
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(
                Icons.person_outline,
                size: 30,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.person,
                size: 35,
                color: ColorsTheme.myOrange,
              ),
            ),
          ],
          onTap: onItemTap,
        ),
      ),
    );
  }

  void onItemTap(var index) {
    if (index == 1) {
      Get.toNamed('${ParkingPage.TAG}/$userID');
    } else {
      selectedIndex.value = index;
    }
  }
}
