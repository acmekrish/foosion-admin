import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foosion_admin/screens/home_screen.dart';
import 'package:foosion_admin/screens/admin_users.dart';
import 'package:foosion_admin/screens/category_screen.dart';
import 'package:foosion_admin/screens/login_screen.dart';
import 'package:foosion_admin/screens/manage_banners.dart';
import 'package:foosion_admin/screens/notification_screen.dart';
import 'package:foosion_admin/screens/order-screen.dart';
import 'package:foosion_admin/screens/settings_screen.dart';
import 'package:foosion_admin/screens/splash_screen.dart';
import 'package:foosion_admin/screens/vendor_screen.dart';
import 'package:foosion_admin/services/firebase_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foosion Admin Dashboard',
      theme: ThemeData(
        primaryColor: Color(0xFF82B1FF),
       visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: {
        HomeScreen.id: (context)=> HomeScreen(),
        SplashScreen.id: (context)=> SplashScreen(),
        LoginScreen.id: (context)=> LoginScreen(),
        BannerScreen.id: (context)=> BannerScreen(),
        CategoryScreen.id: (context)=> CategoryScreen(),
        OrderScreen.id: (context)=> OrderScreen(),
        NotificationScreen.id: (context)=> NotificationScreen(),
        AdminUsers.id: (context)=> AdminUsers(),
        SettingScreen.id: (context)=> SettingScreen(),
        VendorScreen.id: (context)=> VendorScreen(),
      },
    );
  }
}


