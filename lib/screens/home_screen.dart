import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:foosion_admin/services/sidebar.dart';


class HomeScreen extends StatelessWidget {
  static const String id = 'home-screen';
  @override
  Widget build(BuildContext context){

    SideBarWidget _sideBar = SideBarWidget();
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: const Text('Foosion Dashboard', style: TextStyle(color: Colors.white),),
      ),
      sideBar: _sideBar.sideBarMenus(context, HomeScreen.id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Text(
            'Dashboard',
            style: TextStyle(
              fontWeight: FontWeight.w700,color: Colors.blue,
              fontSize: 36,
            ),
          ),
        ),
      ),
    );
  }
}