import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/color.dart';
import 'package:lms/text_style.dart';

class ItemRep extends StatefulWidget {
  final String name;
  final DateTime date;
  final List<Widget> items;
  final String avatar;
  const ItemRep(
      {Key? key,
      required this.name,
      required this.date,
      required this.items,
      this.avatar = 'assets/images/logo.png'})
      : super(key: key);

  @override
  State<ItemRep> createState() => _ItemRepState();
}

class _ItemRepState extends State<ItemRep> {
  TextEditingController textEditingController = TextEditingController();
  int charLength = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
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
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: ClipOval(
                                child: Image.asset(widget.avatar),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
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
                              hintText: 'Nhập nội dung phản hồi',
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
    );
  }
}
