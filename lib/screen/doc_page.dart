import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/bloc/screen_bloc.dart';
import 'package:lms/color.dart';
import 'package:lms/component/custom_app_bar.dart';
import 'package:lms/component/item_doc.dart';
import 'package:lms/component/side_bar.dart';
import 'package:lms/model/doc.dart';
import 'package:lms/text_style.dart';

class DocPage extends StatefulWidget {
  const DocPage({Key? key}) : super(key: key);

  @override
  State<DocPage> createState() => _DocPageState();
}

class _DocPageState extends State<DocPage> {
  final items = [
    'Công nghệ ASP.NET-2-21',
    'Công nghệ J2EE-2-21',
    'Dự án phát triển phần mềm-2-21',
    'Vận hành và bảo trì phần mềm-2-21',
    'Đảm bảo chất lượng phần mềm-2-21',
    'Thiết kế giao diện phần mềm-2-21'
  ];

  final List<Doc> docs = [
    Doc('pdf', 'tl.pdf', subject: 'Dự án phát triển phần mềm-2-21'),
    Doc('pdf', 'tl.pdf', subject: 'Dự án phát triển phần mềm-2-21')
  ];

  List<Doc> tempDocs = [];

  String? itemValue = 'Công nghệ ASP.NET-2-21';

  @override
  void initState() {
    super.initState();

    for (var e in docs) {
      if (itemValue?.compareTo(e.subject) == 0) {
        tempDocs.add(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ScreenBloc(screen: 3),
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
            title: 'Tài Liệu',
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
                      List<Doc> list = [];
                      for (var e in docs) {
                        if (value?.compareTo(e.subject) == 0) {
                          list.add(e);
                        }
                      }
                      setState(() {
                        itemValue = value;
                        tempDocs = list;
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
                  'Danh sách tài liệu',
                  style: kStyle7,
                ),
                tempDocs.isEmpty
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
                          itemCount: tempDocs.length,
                          itemBuilder: (context, index) =>
                              ItemDoc(doc: tempDocs[index]),
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
