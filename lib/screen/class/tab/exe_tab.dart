import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/component/item_exe.dart';
import 'package:lms/model/exe.dart';
import 'package:lms/text_style.dart';

class ExeTab extends StatelessWidget {
  final List<Exe> list;
  const ExeTab({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Danh sách bài tập (${list.length})',
            style: kStyle4,
          ),
        ),
        buildListExe(size, context)
      ],
    );
  }

  Widget buildListExe(Size size, BuildContext context) {
    if (list.isEmpty) {
      return SizedBox(
        height: size.height - 200,
        width: size.width,
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/man_work.svg',
              height: 500,
              width: size.width,
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Bạn rảnh!',
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
            itemBuilder: (context, index) => ItemExe(exe: list[index]),
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
