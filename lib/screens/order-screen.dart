import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  static const String id = 'order-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Order Screen',style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 36,color: Colors.blue,
      ),
      ),
      ),
    );
  }
}
