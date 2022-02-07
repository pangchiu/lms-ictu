import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/color.dart';
import 'package:lms/model/nofity.dart';
import 'package:lms/text_style.dart';

class NofityItem extends StatelessWidget {
  final bool? check;
  final Color? color;
  final Nofity nofity;
  final Function()? onCheckBox;
  final Function()? onTap;
  const NofityItem(
      {Key? key, this.check, this.color, required this.nofity, this.onCheckBox, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: 225,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color ?? kBackgroundColor,
            boxShadow: [
              BoxShadow(
                  color: kShadow.withOpacity(0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Từ ' + nofity.title,
                        style: kStyle,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.white,
                        ),
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                              color: kBackgroundColor,
                              border: Border.all(color: Colors.white, width: 2)),
                          child: Checkbox(
                            value: check,
                            checkColor: color,
                            activeColor: Colors.white,
                            onChanged: (_) {
                              if (onCheckBox != null) {
                                onCheckBox!();
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    nofity.content,
                    style: kStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/images/bell_reng.svg',
                    color: Colors.white,
                    height: 25,
                    width: 30,
                  ),
                  Text(
                    '${nofity.date.hour}:${nofity.date.minute}, ${nofity.date.day}-${nofity.date.month}-${nofity.date.year}',
                    style: kStyle,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
