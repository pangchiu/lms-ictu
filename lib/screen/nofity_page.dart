import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/bloc/screen_bloc.dart';
import 'package:lms/color.dart';
import 'package:lms/component/custom_app_bar.dart';
import 'package:lms/component/item_list_rep_widget.dart';
import 'package:lms/component/item_rep.dart';
import 'package:lms/component/my_dialog.dart';
import 'package:lms/component/nofity_item.dart';
import 'package:lms/component/side_bar.dart';
import 'package:lms/model/doc.dart';
import 'package:lms/model/exe.dart';
import 'package:lms/model/item_list_rep.dart';
import 'package:lms/model/nofity.dart';
import 'package:lms/screen/class/class_page.dart';
import 'package:lms/screen/class/tab/discuss_tab.dart';
import 'package:lms/screen/class/tab/doc_tab.dart';
import 'package:lms/screen/class/tab/exe_tab.dart';
import 'package:lms/text_style.dart';

class NofityPage extends StatefulWidget {
  const NofityPage({Key? key}) : super(key: key);

  @override
  _NofityPageState createState() => _NofityPageState();
}

class _NofityPageState extends State<NofityPage> {
  bool isChooseAll = false;

  List<Nofity> listNofity = [
    Nofity('Bạn có một bài tập chưa làm hạn nộp là hết hôm nay', DateTime.now(),
        'Thiết kế giao diện'),
    Nofity('Bạn có một bài tập chưa làm hạn nộp là hết hôm nay', DateTime.now(),
        'Dự án phát triển phần mềm')
  ];

  List<bool> listCheck = [false, true];

  List<List<Widget>> widgets = [
    [
      DisCussTab(
        color: kItemColor4,
        code: 'Thiết kế giao diện',
        teacher: 'Nguyễn Thu Phương',
        posts: [
          ItemRep(
            name: 'Nguyễn Văn A',
            date: DateTime.now(),
            items: [
              ItemListRepWidget(
                  item: ItemListRep(
                      'các bạn có khỏe không', TypeItemListReps.mess)),
              ItemListRepWidget(
                  item: ItemListRep('baigiang.doc', TypeItemListReps.another)),
            ],
          ),
        ],
      ),
      ExeTab(
        list: [
          Exe('Bài kiểm tra số 2', DateTime.now(), DateTime.now(),
              'Nguyễn Thu Phương', 9, StatusExe.submitted),
          Exe('Bài kiểm tra số 3', DateTime.now(), DateTime.now(),
              'Nguyễn Thu Phương', null, StatusExe.late),
          Exe('Bài kiểm tra số 3', DateTime.now(), DateTime.now(),
              'Nguyễn Thu Phương', null, StatusExe.onActive)
        ],
      ),
      DocTab(
        list: [Doc('pdf', 'tailieu.pdf')],
      )
    ],
    [
      DisCussTab(
        color: kItemColor4,
        code: 'Dự án phát triển phần mềm',
        teacher: 'Nguyễn Thu Phương',
        posts: [
          ItemRep(
            name: 'Nguyễn Văn A',
            date: DateTime.now(),
            items: [
              ItemListRepWidget(
                  item: ItemListRep(
                      'các bạn có khỏe không', TypeItemListReps.mess)),
              ItemListRepWidget(
                  item: ItemListRep('baigiang.doc', TypeItemListReps.another)),
            ],
          ),
        ],
      ),
      ExeTab(
        list: [
          Exe('Bài kiểm tra số 2', DateTime.now(), DateTime.now(),
              'Nguyễn Thu Phương', 9, StatusExe.submitted),
          Exe('Bài kiểm tra số 3', DateTime.now(), DateTime.now(),
              'Nguyễn Thu Phương', null, StatusExe.late),
          Exe('Bài kiểm tra số 3', DateTime.now(), DateTime.now(),
              'Nguyễn Thu Phương', null, StatusExe.onActive)
        ],
      ),
      DocTab(
        list: [Doc('pdf', 'tailieu.pdf')],
      )
    ]
  ];

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ScreenBloc(screen: 4),
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
            title: 'Thông báo',
            icon: SvgPicture.asset('assets/images/3dash.svg')),
        body: buildBody(size),
      ),
    );
  }

  void onChooseAll(bool value) {
    for (int i = 0; i < listCheck.length; i++) {
      if (value) {
        listCheck[i] = true;
      } else {
        listCheck[i] = false;
      }
    }
  }

  Future<void> showDeleteDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) => Dialog(
              child: WillPopScope(
                // Chặn quay lại màn hình khi ấn nút back
                onWillPop: () => Future.value(false),
                child: MyDialog(
                    onYes: () {
                      Navigator.pop(context);
                      setState(() {
                        for (int i = 0; i < listCheck.length; i++) {
                          if (listCheck[i]) {
                            listNofity.removeAt(i);
                            listCheck.removeAt(i);
                            widgets.removeAt(i);
                            i--;
                          }
                        }
                      });
                    },
                    onNo: () {
                      Navigator.pop(context);
                    },
                    content: 'Bạn có muốn xóa không?'),
              ),
            ));
  }

  Widget buildBody(Size size) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: kHightLightColor),
      child: Column(
        children: [
          Container(
            height: 60,
            width: size.width,
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(color: kShadow.withOpacity(0.63)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isChooseAll,
                      checkColor: Colors.white,
                      activeColor: kHightLightColor,
                      onChanged: (value) {
                        setState(() {
                          isChooseAll = value!;
                          onChooseAll(value);
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Tất cả',
                        style: kStyleHightLight5,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Xóa',
                        style: kStyleHightLight4,
                      ),
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/re.svg',
                        color: kHightLightColor2,
                      ),
                      onPressed: () async {
                        await showDeleteDialog(context);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => NofityItem(
                color: index % 2 == 0 ? kItemColor4 : kItemColor3,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ClassPage(
                              name: listNofity[index].title,
                              tabs: widgets[index])));
                },
                nofity: listNofity[index],
                check: listCheck[index],
                onCheckBox: () {
                  setState(() {
                    listCheck[index] = !listCheck[index];
                  });
                },
              ),
              itemCount: listNofity.length,
              separatorBuilder: (context, _) => const SizedBox(
                height: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
