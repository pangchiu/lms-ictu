import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/color.dart';
import 'package:lms/model/doc.dart';
import 'package:lms/text_style.dart';

class ItemDoc extends StatelessWidget {
  final Doc doc;
  const ItemDoc({Key? key, required this.doc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: 45,
              height: 45,
              child: SizedBox(
                width: 10,
                height: 10,
                child: SvgPicture.asset(
                  'assets/images/doc.svg',
                  color: kBackgroundColor,
                  fit: BoxFit.scaleDown,
                ),
              ),
              decoration: const BoxDecoration(
                  color: kPrimaryColor, shape: BoxShape.circle),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  doc.name,
                  style: kStyle4,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: SvgPicture.asset(
                    'assets/images/download.svg',
                    width: 14,
                    height: 18,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: kBackgroundColor,
          border: Border.all(
            color: kShadow.withOpacity(0.25),
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(offset: Offset(0, 1.5), blurRadius: 2, color: kShadow)
          ]),
    );
  }
}
