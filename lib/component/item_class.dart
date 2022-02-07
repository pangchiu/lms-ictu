import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/color.dart';
import 'package:lms/text_style.dart';

enum TypeRoom { classroom, checkroom }

class ItemClass extends StatelessWidget {
  final String name;
  final String? subName;
  final String teacher;
  final String phone;
  final String email;
  final Color? backgroundColor;
  final TypeRoom type;
  final Function() onTap;
  const ItemClass(
      {Key? key,
      required this.name,
      this.subName,
      required this.teacher,
      required this.phone,
      required this.email,
      this.backgroundColor = const Color(0xff07957B),
      required this.onTap,
      this.type = TypeRoom.classroom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 160,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      type == TypeRoom.checkroom
                          ? buildForCheckRoom()
                          : buildForClassRoom(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: RichText(
                                text: TextSpan(children: [
                              WidgetSpan(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child:
                                    SvgPicture.asset('assets/images/user.svg'),
                              )),
                              TextSpan(text: teacher, style: kStyle2)
                            ])),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: RichText(
                                text: TextSpan(children: [
                              WidgetSpan(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child:
                                    SvgPicture.asset('assets/images/phone.svg'),
                              )),
                              TextSpan(text: phone, style: kStyle2)
                            ])),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: RichText(
                                text: TextSpan(children: [
                              WidgetSpan(
                                  child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child:
                                    SvgPicture.asset('assets/images/mess.svg'),
                              )),
                              TextSpan(text: email, style: kStyle2)
                            ])),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/images/three_dot.svg',
                              color: Colors.white,
                            )),
                        IconButton(
                            iconSize: 30,
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: Image.asset('assets/images/meet.png'))
                      ]),
                ]),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                    color: kShadow.withOpacity(0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 4)
              ]),
        ),
      ),
    );
  }

  Widget buildForClassRoom() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: kStyle,
        ),
        Text(
          subName!,
          style: kStyle2,
        ),
      ],
    );
  }

  Widget buildForCheckRoom() {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/medal.svg',
          color: Colors.white,
          width: 17,
          height: 19,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          name,
          style: kStyle,
        ),
      ],
    );
  }
}
