import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:foosion_admin/services/sidebar.dart';
import 'package:foosion_admin/widgets/category/category_list_widget.dart';
import 'package:foosion_admin/widgets/category/category_upload_widget.dart';
import 'package:foosion_admin/widgets/vendor/vendor_datatable_widget.dart';

class CategoryScreen extends StatefulWidget {
  static const String id = 'category-screen';

  @override
  _CategoryScreenState createState() => _CategoryScreenState();

}

class _CategoryScreenState extends State<CategoryScreen>{

  Widget build(BuildContext context) {
    SideBarWidget _sideBar = SideBarWidget();
    return AdminScaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        title: const Text('Foosion Dashboard', style: TextStyle(color: Colors.white),),
      ),
      sideBar: _sideBar.sideBarMenus(context, CategoryScreen.id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'Category Screen',
                style: TextStyle(
                  fontWeight: FontWeight.w700,color: Colors.blue,
                  fontSize: 36,
                ),
              ),
              Text('Add New Categories and Sub Categories'),
              Divider(thickness: 5,),
              CategoryCreateWidget(),
              Divider(thickness: 5,),
              CategoryListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
