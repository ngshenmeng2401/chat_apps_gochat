import 'package:chat_apps_gochat/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyPostDetailsView extends StatelessWidget {

  final PostModal postModel;
  MyPostDetailsView(this.postModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String dateYearPosted = DateFormat('dd MMM yyyy HH:mm').format(postModel.dateTime!);

    return Scaffold(
      appBar: AppBar(
        title: Text(dateYearPosted),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: Container(
                color: Colors.black,
                child: Stack(
                  children: [
                    Container(
                      height: screenHeight,
                      width: screenWidth,
                      child: Image.asset(postModel.img!,
                      fit: BoxFit.contain,),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: screenHeight/6,
                        color: Colors.black26,
                        child: Text(postModel.content!,
                          textAlign: TextAlign.left,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}