import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/component/item_doc.dart';
import 'package:lms/model/doc.dart';
import 'package:lms/text_style.dart';

class DocTab extends StatelessWidget {
  final List<Doc> list;
  const DocTab({Key? key, required this.list}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Danh sách Tài Liệu (${list.length})',
            style: kStyle4,
          ),
        ),
        buildListDoc(size, context)
      ],
    );
  }

  Widget buildListDoc(Size size, BuildContext context) {
    if (list.isEmpty) {
      return SizedBox(
        height: size.height - 200,
        width: size.width,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: SvgPicture.asset(
                'assets/images/man_running.svg',
                fit: BoxFit.fill,
                height: 500,
                width: size.width,
              ),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Trống!',
                style: kStyle4,
              ),
            )
          ],
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) => ItemDoc(doc: list[index]),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 15,
            ),
          ),
        ),
      );
    }
  }
}
