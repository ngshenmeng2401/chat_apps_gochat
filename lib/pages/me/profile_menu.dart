import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {

  final String? text;
  final Icon? icon;
  final bool? hasNavigation;
  final VoidCallback? press;

  const ProfileMenu({
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
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            height: screenHeight/13,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: icon!
                ),
                Expanded(
                  flex: 7,
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
                  flex: 1,
                  child: Container(
                    child: hasNavigation == true 
                     ? const Icon(Icons.arrow_forward_ios,size: 20,)
                     : null,
                  )
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
          color: Colors.grey[100],
        ),
      ],
    );
  }
}