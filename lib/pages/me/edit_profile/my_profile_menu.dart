import 'package:flutter/material.dart';

class EditProfileMenu extends StatelessWidget {

  final String? text;
  final String? title;
  final String? img;
  final String? imgStatus;
  final bool? hasImage;
  final double? height;
  final VoidCallback? press;

  const EditProfileMenu({
    Key? key, 
    this.text, 
    this.title,
    this.imgStatus,
    this.press, 
    this.img,
    this.height,
    this.hasImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        InkWell(
          onTap: press,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            height: height!,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                    child: Text(title!,
                      style: const TextStyle(
                        fontSize: 18
                      ),),
                  )
                ),
                Expanded(
                  flex: 3,
                  child: hasImage == true
                    ? Align(
                      alignment: Alignment.centerRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: imgStatus == "noimage" 
                        ? Image.asset(img!,fit: BoxFit.fill,)
                        : Image.network(img!,
                          fit: BoxFit.fill,),
                      ),
                    )
                    : Text(text!,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 18
                      ),),
                ),
                const Expanded(
                  flex: 1,
                  child: Icon(Icons.arrow_forward_ios,size: 20,)
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