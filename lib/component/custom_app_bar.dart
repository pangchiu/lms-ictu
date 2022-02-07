import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/color.dart';
import 'package:lms/component/my_dialog.dart';
import 'package:lms/component/user_dialog.dart';
import 'package:lms/text_style.dart';

PreferredSizeWidget customAppBar1(
    {required void Function() onLeadingPress,
    required void Function() onActionPress,required String title}) {
  return AppBar(
    backgroundColor: kBackgroundColor,
    title: Text(
      title,
      style: kTitleApp,
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        onLeadingPress();
      },
      icon: SvgPicture.asset('assets/images/3dash.svg'),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Container(
          height: 30,
          width: 30,
          child: GestureDetector(
            onTap: () {
              onActionPress();
            },
            child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset('assets/images/logo.png')),
          ),
          decoration: BoxDecoration(
            color: kBackgroundColor,
              border: Border.all(color: kPrimaryColor, width: 1),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: kShadow.withOpacity(0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 4)
              ]),
        ),
      )
    ],
    shape: Border(
      bottom: BorderSide(color: kShadow.withOpacity(0.25), width: 0.5),
    ),
  );
}

PreferredSizeWidget customAppBar2({required void Function() onLeadingPress,required String title,required Widget icon}) {
  return AppBar(
    backgroundColor: kBackgroundColor,
    title: Text(
      title,
      style: kTitleApp,
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        onLeadingPress();
      },
      icon: icon,
    ),
    shape: Border(
      bottom: BorderSide(color: kShadow.withOpacity(0.25), width: 0.5),
    ),
  );
}


  Future<void> showUserDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) => Dialog(
              child: WillPopScope(
                // Chặn quay lại màn hình khi ấn nút back
                onWillPop: () => Future.value(false),
                child: UserDialog(
                  onSignOut: () async {
                    Navigator.pop(context);
                    await showSigOutDialog(context);
                  },
                ),
              ),
            ));
  }

  Future<void> showSigOutDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) => Dialog(
              child: MyDialog(
                content: 'Xác nhận xóa?',
                onYes: () {
                  SystemNavigator.pop();
                },
                onNo: () {
                  Navigator.pop(context);
                },
              ),
            ));
  }
