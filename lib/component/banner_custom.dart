import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/text_style.dart';

class BannerCustom extends StatelessWidget {
  final String code;
  final String teacher;
  final String? name;
  final bool showMore;
  final Color color;
  const BannerCustom(
      {Key? key,
      required this.code,
      required this.teacher,
      this.color = Colors.black12,
      this.name,
      this.showMore = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 150,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Container(
              height: 135,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: showMore ? buildMore() : buildLitle(),
              ),
            ),
          ),
          Positioned(
              left: -40,
              top: 3,
              child: SizedBox(
                  height: 100,
                  width: 150,
                  child: SvgPicture.asset('assets/images/man_holding.svg'))),
        ],
      ),
    );
  }

  Widget buildMore() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Môn:' + name!,
              style: kStyle2,
            ),
            Text(
              code,
              style: kStyle2,
            ),
          ],
        ),
        Text(
          teacher,
          style: kStyle,
        ),
      ],
    );
  }

  Widget buildLitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          code,
          style: kStyle2,
        ),
        Text(
          teacher,
          style: kStyle,
        ),
      ],
    );
  }
}
