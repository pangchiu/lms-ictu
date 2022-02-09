import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/color.dart';
import 'package:lms/component/custom_app_bar.dart';
import 'package:lms/text_style.dart';

class ClassPage extends StatefulWidget {
  final String name;
  final Color? color;
  final bool showBottomBar;
  final List<Widget> tabs;
  const ClassPage(
      {Key? key,
      required this.name,
      this.color = Colors.black12,
      this.showBottomBar = true,
      required this.tabs})
      : super(key: key);

  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  late int indexTab;
  @override
  void initState() {
    super.initState();
    indexTab = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar2(
            onLeadingPress: () {
              Navigator.pop(context);
            },
            title: widget.name,
            icon: SvgPicture.asset('assets/images/arrow.svg')),
        bottomNavigationBar: widget.showBottomBar ? buildBottomBar() : null,
        body: widget.tabs[indexTab]);
  }

  Widget buildBottomBar() {
    return BottomNavigationBar(
        onTap: (index) {
          setState(() {
            indexTab = index;
          });
        },
        currentIndex: indexTab,
        selectedLabelStyle: kStyleSelectedTad,
        unselectedLabelStyle: kStyleUnselectedTad,
        elevation: 30,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/discussion.svg',
                height: 25,
                width: 25,
                color: kShadow,
              ),
              label: 'Thảo Luận',
              activeIcon: SvgPicture.asset(
                'assets/images/discussion.svg',
                height: 25,
                width: 25,
                color: kPrimaryColor,
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/exe.svg',
                height: 23,
                width: 23,
                color: kShadow,
              ),
              label: 'Bài tập',
              activeIcon: SvgPicture.asset(
                'assets/images/exe.svg',
                height: 23,
                width: 23,
                color: kPrimaryColor,
              )),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/doc.svg',
                height: 23,
                width: 23,
                color: kShadow,
              ),
              label: 'Tài liệu',
              activeIcon: SvgPicture.asset(
                'assets/images/doc.svg',
                height: 23,
                width: 23,
                color: kPrimaryColor,
              )),
        ]);
  }
}
