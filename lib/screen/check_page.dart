import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/bloc/screen_bloc.dart';
import 'package:lms/color.dart';
import 'package:lms/component/custom_app_bar.dart';
import 'package:lms/component/item_check.dart';
import 'package:lms/component/item_class.dart';
import 'package:lms/component/item_list_rep_widget.dart';
import 'package:lms/component/item_rep.dart';
import 'package:lms/component/side_bar.dart';
import 'package:lms/model/doc.dart';
import 'package:lms/model/exe.dart';
import 'package:lms/model/item_list_rep.dart';
import 'package:lms/screen/class/class_page.dart';
import 'package:lms/screen/class/tab/discuss_tab.dart';
import 'package:lms/screen/class/tab/doc_tab.dart';
import 'package:lms/screen/class/tab/exe_tab.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocProvider(
      create: (context) => ScreenBloc(screen: 2),
      child: Scaffold(
        key: scaffoldKey,
        appBar: customAppBar1(
            onLeadingPress: () {
              scaffoldKey.currentState!.openDrawer();
            },
            title: 'Kiểm Tra',
            onActionPress: () async {
              await showUserDialog(context);
            }),
        drawer: SideBar(
          onSelected: () {
            scaffoldKey.currentState!.openEndDrawer();
          },
        ),
        body: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Scrollbar(
      thickness: 5,
      radius: const Radius.circular(2),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        children: [
          ItemClass(
            name: 'Dự án phát triển phần mềm',
            subName: 'KTPMK17A.k2.D1.N01',
            teacher: 'Nguyễn Thu Phương',
            phone: '0982483420',
            email: 'ntphuong@ictu.edu.vn',
            type: TypeRoom.checkroom,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ClassPage(
                            name: 'Phòng thi số 1',
                            color: kItemColor4,
                            showBottomBar: false,
                            tabs: [
                              DisCussTab(
                                color: kItemColor4,
                                code: 'KTPMK17A.k2.D1.N01',
                                teacher: 'Nguyễn Thu Phương',
                                posts: [
                                  ItemRep(
                                    name: 'Nguyễn Văn A',
                                    date: DateTime.now(),
                                    items: [
                                      ItemListRepWidget(
                                          item: ItemListRep(
                                              'các bạn có khỏe không',
                                              TypeItemListReps.mess)),
                                      ItemListRepWidget(
                                          item: ItemListRep('baigiang.doc',
                                              TypeItemListReps.another)),
                                    ],
                                  ),
                                  ItemCheck(
                                    exe: Exe(
                                        'Bài kiểm tra số 2',
                                        DateTime.now(),
                                        DateTime.now(),
                                        'Nguyễn Thu Phương',
                                        null,
                                        StatusExe.late),
                                    date: DateTime.now(),
                                    items: const [],
                                  ),
                                ],
                              ),
                              ExeTab(
                                list: [
                                  Exe(
                                      'Bài kiểm tra số 2',
                                      DateTime.now(),
                                      DateTime.now(),
                                      'Nguyễn Thu Phương',
                                      9,
                                      StatusExe.submitted),
                                  Exe(
                                      'Bài kiểm tra số 3',
                                      DateTime.now(),
                                      DateTime.now(),
                                      'Nguyễn Thu Phương',
                                      null,
                                      StatusExe.late),
                                  Exe(
                                      'Bài kiểm tra số 3',
                                      DateTime.now(),
                                      DateTime.now(),
                                      'Nguyễn Thu Phương',
                                      null,
                                      StatusExe.onActive)
                                ],
                              ),
                              DocTab(
                                list: [Doc('pdf', 'tailieu.pdf')],
                              )
                            ],
                          )));
            },
          ),
          ItemClass(
            name: 'Dự án phát triển phần mềm',
            subName: 'KTPMK17A.k2.D1.N01',
            teacher: 'Nguyễn Thu Phương',
            phone: '0982483420',
            email: 'ntphuong@ictu.edu.vn',
            backgroundColor: kItemColor3,
            type: TypeRoom.checkroom,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ClassPage(
                            name: 'Phòng thi số 2',
                            color: kItemColor3,
                            showBottomBar: false,
                            tabs: [
                              DisCussTab(
                                color: kItemColor3,
                                code: 'KTPMK17A.k2.D1.N01',
                                teacher: 'Nguyễn Thu Phương',
                                posts: [
                                  ItemCheck(
                                    exe: Exe(
                                        'Bài kiểm tra số 2',
                                        DateTime.now(),
                                        DateTime.now(),
                                        'Nguyễn Thu Phương',
                                        null,
                                        StatusExe.late),
                                    date: DateTime.now(),
                                    items: const [],
                                  ),
                                ],
                              ),
                              ExeTab(
                                list: [
                                  Exe(
                                      'Bài kiểm tra số 2',
                                      DateTime.now(),
                                      DateTime.now(),
                                      'Nguyễn Thu Phương',
                                      9,
                                      StatusExe.submitted),
                                  Exe(
                                      'Bài kiểm tra số 3',
                                      DateTime.now(),
                                      DateTime.now(),
                                      'Nguyễn Thu Phương',
                                      null,
                                      StatusExe.late),
                                  Exe(
                                      'Bài kiểm tra số 3',
                                      DateTime.now(),
                                      DateTime.now(),
                                      'Nguyễn Thu Phương',
                                      null,
                                      StatusExe.onActive)
                                ],
                              ),
                              DocTab(
                                list: [Doc('pdf', 'tailieu.pdf')],
                              )
                            ],
                          )));
            },
          )
        ],
      ),
    );
  }
}
