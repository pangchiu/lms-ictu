import 'package:flutter/material.dart';
import 'package:lms/color.dart';
import 'package:lms/text_style.dart';

class MyDialog extends StatelessWidget {

  final Function() onYes;
  final Function() onNo;
  final String content;
  const MyDialog({Key? key,required this.onYes,required this.onNo,required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 220,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          const Padding(
            padding:   EdgeInsets.symmetric(vertical: 20),
            child:  Text('Thông báo',style: kTitle),
          ),
          const Divider(
            height: 2,
            color: kPrimaryColor,
          ),
            Padding(
             padding: const EdgeInsets.symmetric(vertical: 50),
             child: Text(content,style: kStyle4,),
           ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                InkWell(child: const Text('Có',style: kStyleChoice1,),onTap: onYes,),
                InkWell(child: const Text('Hủy',style: kStyleChoice2,),onTap: onNo,),

              ],
            ),
          )
        ],
      ),
    );
  }
}
