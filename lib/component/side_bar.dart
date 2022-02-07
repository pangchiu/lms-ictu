import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/bloc/screen_bloc.dart';
import 'package:lms/color.dart';
import 'package:lms/screen/check_page.dart';
import 'package:lms/screen/doc_page.dart';
import 'package:lms/screen/exe_page.dart';
import 'package:lms/screen/home_page.dart';
import 'package:lms/screen/nofity_page.dart';
import 'package:lms/text_style.dart';

class SideBar extends StatelessWidget {
  final void Function()? onSelected;
  const SideBar({Key? key, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: Drawer(
        backgroundColor: kBackgroundColor,
        child: BlocBuilder<ScreenBloc, int>(builder: (context, selectedItem) {
          return ListView(
            children: [
              SizedBox(
                height: 80,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 30,
                        width: 30,
                        child: FittedBox(
                            fit: BoxFit.contain,
                            child: Image.asset('assets/images/logo.png')),
                        decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor, width: 1),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: kShadow.withOpacity(0.25),
                                  offset: const Offset(0, 4),
                                  blurRadius: 4)
                            ]),
                      ),
                    ),
                    const Text(
                      'LMS ICTU',
                      style: kTitle,
                    )
                  ],
                ),
              ),
              const Divider(
                height: 1,
                color: kPrimaryColor,
              ),
              ListTile(
                selectedTileColor: kPrimaryColor,
                selected: selectedItem == 0,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                leading: SvgPicture.asset(
                  'assets/images/home.svg',
                  color: selectedItem == 0 ? Colors.white : kPrimaryColor,
                ),
                horizontalTitleGap: 0,
                title: Text(
                  'Lớp học phần',
                  style: selectedItem == 0 ? kStyle : kStyle3,
                ),
                onTap: () => onSelectedItem(0, context),
              ),
              ListTile(
                selectedTileColor: kPrimaryColor,
                selected: selectedItem == 1,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                leading: SvgPicture.asset(
                  'assets/images/exe.svg',
                  color: selectedItem == 1 ? Colors.white : kPrimaryColor,
                ),
                horizontalTitleGap: 0,
                title: Text(
                  'Bài tập',
                  style: selectedItem == 1 ? kStyle : kStyle3,
                ),
                onTap: () => onSelectedItem(1, context),
              ),
              ListTile(
                selectedTileColor: kPrimaryColor,
                selected: selectedItem == 2,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                leading: SvgPicture.asset(
                  'assets/images/doc_pen.svg',
                  color: selectedItem == 2 ? Colors.white : kPrimaryColor,
                ),
                horizontalTitleGap: 0,
                title: Text(
                  'Kiểm tra',
                  style: selectedItem == 2 ? kStyle : kStyle3,
                ),
                onTap: () => onSelectedItem(2, context),
              ),
              ListTile(
                selectedTileColor: kPrimaryColor,
                selected: selectedItem == 3,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                leading: SvgPicture.asset(
                  'assets/images/doc.svg',
                  color: selectedItem == 3 ? Colors.white : kPrimaryColor,
                ),
                horizontalTitleGap: 0,
                title: Text(
                  'Tài liệu',
                  style: selectedItem == 3 ? kStyle : kStyle3,
                ),
                onTap: () => onSelectedItem(3, context),
              ),
              ListTile(
                selectedTileColor: kPrimaryColor,
                selected: selectedItem == 4,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                leading: SvgPicture.asset(
                  'assets/images/bell.svg',
                  color: selectedItem == 4 ? Colors.white : kPrimaryColor,
                ),
                horizontalTitleGap: 0,
                title: Text(
                  'Thông báo',
                  style: selectedItem == 4 ? kStyle : kStyle3,
                ),
                onTap: () => onSelectedItem(4, context),
              ),
            ],
          );
        }),
      ),
    );
  }

  void onSelectedItem(int index, BuildContext context) {
    final bloc = context.read<ScreenBloc>();
    switch (index) {
      case 0:
        if (onSelected != null) {
          onSelected!();
        }
        if (bloc.state != 0) {
          bloc.add(ScreenEvent.classClick);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HomePage()));
        }

        break;
      case 1:
        if (onSelected != null) {
          onSelected!();
        }
        if (bloc.state != 1) {
          bloc.add(ScreenEvent.exeClick);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const ExePage()));
        }

        break;
      case 2:
        if (onSelected != null) {
          onSelected!();
        }
        if (bloc.state != 2) {
          bloc.add(ScreenEvent.checkClick);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const CheckPage()));
        }

        break;
      case 3:
        if (onSelected != null) {
          onSelected!();
        }
        if (bloc.state != 3) {
          bloc.add(ScreenEvent.docClick);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const DocPage()));
        }

        break;
      case 4:

       if (onSelected != null) {
          onSelected!();
        }
        if (bloc.state != 4) {
          bloc.add(ScreenEvent.notifyClick);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const NofityPage()));
        }

       
        break;
    }
  }
}
