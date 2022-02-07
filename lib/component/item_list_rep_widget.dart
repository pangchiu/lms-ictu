import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/color.dart';
import 'package:lms/model/item_list_rep.dart';
import 'package:lms/text_style.dart';

class ItemListRepWidget extends StatelessWidget {
  final ItemListRep item;
  const ItemListRepWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 25,
      width: size.width,
      child: buildChild(),
    );
  }

  Widget buildChild() {
    if (item.type == TypeItemListReps.mess) {
      return buildMess();
    } else {
      return buildAnother();
    }
  }

  Widget buildMess() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        item.name,
        style: kStyle5,
      ),
    );
  }

  Widget buildAnother() {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/pin.svg',
          width: 15,
          height: 15,
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: SvgPicture.asset(
                    'assets/images/doc.svg',
                    width: 15,
                    height: 15,
                    color: kShadow,
                  ),
                ),
                Text(
                  item.name,
                  style: kStyle5,
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              border: Border.all(color: kShadow, width: 1),
              borderRadius: BorderRadius.circular(20)),
        ),
      ],
    );
  }
}
