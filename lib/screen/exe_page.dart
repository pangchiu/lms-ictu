import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/bloc/screen_bloc.dart';
import 'package:lms/color.dart';
import 'package:lms/component/custom_app_bar.dart';
import 'package:lms/component/item_exe.dart';
import 'package:lms/component/side_bar.dart';
import 'package:lms/model/exe.dart';
import 'package:lms/text_style.dart';

class ExePage extends StatefulWidget {
  const ExePage({Key? key}) : super(key: key);

  @override
  State<ExePage> createState() => _ExePageState();
}

class _ExePageState extends State<ExePage> {
  final items = [
    'Công nghệ ASP.NET-2-21',
    'Công nghệ J2EE-2-21',
    'Dự án phát triển phần mềm-2-21',
    'Vận hành và bảo trì phần mềm-2-21',
    'Đảm bảo chất lượng phần mềm-2-21',
    'Thiết kế giao diện phần mềm-2-21'
  ];

  final List<Exe> exes = [
    Exe('Công nghệ ASP.NET-2-21', DateTime.now(), DateTime.now(), 'Nguyễn Thị B', null, StatusExe.short)
  ];

  List<Exe> tempExes = [];

  String? itemValue = 'Công nghệ ASP.NET-2-21';

  @override
  void initState() {
    super.initState();

    for (var e in exes) {
      if (itemValue?.compareTo(e.name) == 0) {
        tempExes.add(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ScreenBloc(screen: 1),
      child: Scaffold(
        key: scaffoldKey,
        drawer: SideBar(
          onSelected: () {
            scaffoldKey.currentState!.openEndDrawer();
          },
        ),
        appBar: customAppBar2(
            onLeadingPress: () {
              scaffoldKey.currentState!.openDrawer();
            },
            title: 'Bài tập',
            icon: SvgPicture.asset('assets/images/3dash.svg')),
        body: buildBody(size),
      ),
    );
  }

  Widget buildBody(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: size.width,
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: kPrimaryColor),
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                    value: itemValue,
                    items: buildMenuItem(size),
                    selectedItemBuilder: (context) {
                      return List.generate(items.length, (index) {
                        return Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              items[index],
                              style: kStyle,
                            ),
                          ),
                        );
                      });
                    },
                    focusColor: Colors.blueGrey,
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SvgPicture.asset(
                        'assets/images/arrow_dow.svg',
                        color: kBackgroundColor,
                      ),
                    ),
                    onChanged: (value) {
                      List<Exe> list = [];
                      for (var e in exes) {
                        if (value?.compareTo(e.name) == 0) {
                          list.add(e);
                        }
                      }
                      setState(() {
                        itemValue = value;
                        tempExes = list;
                      });
                    }),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Danh sách Bài tập',
                  style: kStyle7,
                ),
                tempExes.isEmpty
                    ? const Expanded(
                        child: Center(
                          child: Text(
                            'Trống',
                            style: kStyle7,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: tempExes.length,
                          itemBuilder: (context, index) =>
                              ItemExe(exe: tempExes[index]),
                          separatorBuilder: (context, _) => const SizedBox(
                            height: 15,
                          ),
                        ),
                      )
              ],
            ),
          ),
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> buildMenuItem(Size size) {
    return items.map((e) {
      if (e.compareTo(itemValue!) == 0) {
        return DropdownMenuItem<String>(
          child: Container(
            height: 50,
            width: size.width,
            color: kPrimaryColor,
            child: Text(
              e,
              style: kStyle,
            ),
          ),
          value: e,
        );
      } else {
        return DropdownMenuItem<String>(
          child: SizedBox(
            height: 50,
            width: size.width,
            child: Text(
              e,
              style: kStyle4,
            ),
          ),
          value: e,
        );
      }
    }).toList();
  }
}
