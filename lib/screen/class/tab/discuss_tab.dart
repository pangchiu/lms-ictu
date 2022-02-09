import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/color.dart';
import 'package:lms/component/banner_custom.dart';
import 'package:lms/text_style.dart';

class DisCussTab extends StatefulWidget {
  final Color? color;
  final String code;
  final String teacher;
  final List<Widget> posts;
  const DisCussTab(
      {Key? key,
      this.color = Colors.black12,
      required this.code,
      required this.teacher,
      required this.posts})
      : super(key: key);

  @override
  _DisCussTabState createState() => _DisCussTabState();
}

class _DisCussTabState extends State<DisCussTab> {
  TextEditingController textEditingController = TextEditingController();
  int charLength = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BannerCustom(
                code: widget.code,
                teacher: widget.teacher,
                color: widget.color!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: size.width,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black.withOpacity(0.23)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset('assets/images/logo.png')),
                    ),
                    SizedBox(
                      width: size.width - 100,
                      child: TextField(
                        controller: textEditingController,
                        onChanged: (str) {
                          setState(() {
                            charLength = str.trim().length;
                          });
                        },
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 3),
                            border: InputBorder.none,
                            hintText: 'Viết gì đó cho lớp của bạn...',
                            hintStyle: kStyleHintText,
                            suffixIconConstraints: const BoxConstraints(
                                minHeight: 18, minWidth: 18),
                            suffixIcon: InkWell(
                              child: SvgPicture.asset(
                                'assets/images/plane.svg',
                                color: charLength > 0 ? kPrimaryColor : kShadow,
                              ),
                              onTap: () {},
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: widget.posts,
            )
          ],
        ),
      ),
    );
  }
}
