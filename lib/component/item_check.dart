import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/color.dart';
import 'package:lms/model/exe.dart';
import 'package:lms/screen/detail_exe_page.dart';
import 'package:lms/text_style.dart';

class ItemCheck extends StatefulWidget {
  final Exe exe;
  final DateTime date;
  final List<Widget> items;
  const ItemCheck({
    Key? key,
    required this.items,
    required this.exe,
    required this.date,
  }) : super(key: key);

  @override
  State<ItemCheck> createState() => _ItemCheckState();
}

class _ItemCheckState extends State<ItemCheck> {
  TextEditingController textEditingController = TextEditingController();
  int charLength = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailExe(
                    exe: widget.exe,
                    comments: const [],
                    myExe: const ["kt.doc"])));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          width: size.width,
          height: 120 + widget.items.length.toDouble() * 26.5,
          child: Stack(children: [
            Positioned(
              top: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: size.width - 40,
                  decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black.withOpacity(0.17)),
                      boxShadow: [
                        BoxShadow(
                            color: kShadow.withOpacity(0.23),
                            blurRadius: 2,
                            offset: const Offset(0, 3))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                    color: kPrimaryColor,
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                  'assets/images/exe.svg',
                                  color: Colors.white,
                                  fit: BoxFit.scaleDown,
                                  width: 20,
                                  height: 25,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.exe.name,
                                  style: kStyleUser,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${widget.date.hour}:${widget.date.minute}, ${widget.date.day}-${widget.date.month}-${widget.date.year}',
                                  style: kStyleTime,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: widget.items.length.toDouble() * 26.5,
                      ),
                      const Divider(
                        color: kShadow,
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          width: size.width,
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(color: kStrokeColor),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            controller: textEditingController,
                            onChanged: (value) {
                              setState(() {
                                charLength = value.length;
                              });
                            },
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                border: InputBorder.none,
                                hintText: 'Nh???p n???i dung ph???n h???i',
                                hintStyle: kStyleHintText,
                                suffixIconConstraints: const BoxConstraints(
                                    minHeight: 18, minWidth: 18),
                                suffixIcon: InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: SvgPicture.asset(
                                      'assets/images/plane.svg',
                                      color: charLength > 0
                                          ? kPrimaryColor
                                          : kShadow,
                                    ),
                                  ),
                                  onTap: () {},
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                left: 0,
                top: 50,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: widget.items,
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
