import 'package:demo_app/my_shipment.dart';
import 'package:demo_app/my_shipment_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create:  (_)=> MyShipmentState(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.white,
        centerTitle: true,
          elevation: 1,
          toolbarTextStyle: TextStyle(
          color: Colors.grey[700],

        )
      )
      ),
      home: MyShipment()
    );
  }
}
