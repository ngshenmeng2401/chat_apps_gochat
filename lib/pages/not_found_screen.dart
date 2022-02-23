import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotfoundScreen extends StatelessWidget {
  const NotfoundScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Not Found".tr),
      ),
      body: Center(
        child: Container(),
      ),
    );
  }
}