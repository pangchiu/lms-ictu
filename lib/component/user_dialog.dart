import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/color.dart';
import 'package:lms/text_style.dart';

class UserDialog extends StatelessWidget {
  final Function() onSignOut;
  const UserDialog({Key? key, required this.onSignOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 270,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            width: 300,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: IconButton(
                    icon: SvgPicture.asset('assets/images/cross.svg'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 20,
                  child: SizedBox(
                      width: 120,
                      height: 60,
                      child: Column(
                        children: [
                          SizedBox(width: 40,height: 40,child: Image.asset('assets/images/logo.png')),
                          const Text('dtc18548xxxxxx',style: kStyle4,)
                        ],
                      )),
                ),
              ],
            ),
          ),
           const Divider(
            height: 2,
             color: kShadow,
          ),
          InkWell(
            child: Row(
              children: [
                IconButton(
                    color: Colors.grey,
                    iconSize: 24,
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/images/sig_out.svg')),
                const Text('Đăng xuất',style: kStyle4,)
              ],
            ),
            onTap: onSignOut,
          ),
          const Divider(
            height: 2,
            color: kShadow,
          ),
        ],
      ),
    );
  }
}
