import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:foosion_admin/services/sidebar.dart';
import 'package:foosion_admin/widgets/vendor/vendor_datatable_widget.dart';


class VendorScreen extends StatefulWidget {
  static const String id = 'vendor-screen';
  @override
  _VendorScreenState createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  @override
  Widget build(BuildContext context) {
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
      sideBar: _sideBar.sideBarMenus(context, VendorScreen.id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Manage Vendors',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36, color: Colors.blue,
                ),
              ),
              Text('Manage all the Vendors Activities'),
              Divider(thickness: 5,),
              VendorDataTable(),
              Divider(thickness: 5,),
            ],
          ),
        ),
      ),
    );
  }
}
