import 'package:flutter/material.dart';

class ContactMenu extends StatelessWidget {

  final String? text;
  final Icon? icon;
  final bool? hasNavigation;
  final VoidCallback? press;

  const ContactMenu({
    Key? key, 
    this.text, 
    this.icon, 
    this.press, 
    this.hasNavigation = true, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        InkWell(
          onTap: press,
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            height: screenHeight/13,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: screenHeight/3,
                    color: Colors.blue,
                    child: icon,
                  )
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(text!,
                          style: const TextStyle(
                            fontSize: 18
                          ),),
                      ],
                    ),
                  )
                ),
                Expanded(
                  flex: 2,
                  child: Container()
                ),
              ],
            ),
          ),
        ),
        const Divider(
          height: 2,
          color: Colors.black,
        ),
      ],
    );
  }
}