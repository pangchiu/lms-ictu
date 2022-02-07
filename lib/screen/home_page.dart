import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/bloc/screen_bloc.dart';
import 'package:lms/color.dart';
import 'package:lms/component/custom_app_bar.dart';
import 'package:lms/component/item_class.dart';
import 'package:lms/component/item_list_rep_widget.dart';
import 'package:lms/component/item_rep.dart';
import 'package:lms/component/side_bar.dart';
import 'package:lms/model/doc.dart';
import 'package:lms/model/exe.dart';
import 'package:lms/model/item_list_rep.dart';
import 'package:lms/screen/class_page.dart';
import 'package:lms/screen/tab/discuss_tab.dart';
import 'package:lms/screen/tab/doc_tab.dart';
import 'package:lms/screen/tab/exe_tab.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocProvider(
      create: (context) => ScreenBloc(screen: 0),
      child: Scaffold(
        key: scaffoldKey,
        appBar: buildAppBar(scaffoldKey, context),
        drawer: buildSideBar(scaffoldKey),
        body: buildBody(context),
      ),
    );
  }

  PreferredSizeWidget buildAppBar(
      GlobalKey<ScaffoldState> key, BuildContext context) {
    return customAppBar1(
      title: 'Lớp Học',
      onActionPress: () async {
        await showUserDialog(context);
      },
      onLeadingPress: () {
        key.currentState!.openDrawer();
      },
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ClassPage(
                            name: 'Dự án phát triển phần mềm',
                            color: kItemColor4,
                            tabs: [
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
                                              'các bạn có khỏe không',
                                              TypeItemListReps.mess)),
                                      ItemListRepWidget(
                                          item: ItemListRep('baigiang.doc',
                                              TypeItemListReps.another)),
                                    ],
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
            backgroundColor: kItemColor1,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ClassPage(
                            name: 'Dự án phát triển phần mềm',
                            color: kItemColor1,
                            tabs: [
                              DisCussTab(
                                  color: kItemColor1,
                                  code: 'Dự án phát triển phần mềm',
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
                                  ]),
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
            backgroundColor: kItemColor2,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ClassPage(
                            name: 'Dự án phát triển phần mềm',
                            color: kItemColor2,
                            tabs: [
                              DisCussTab(
                                  color: kItemColor2,
                                  code: 'Dự án phát triển phần mềm',
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
                                  ]),
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ClassPage(
                            name: 'Dự án phát triển phần mềm',
                            color: kItemColor3,
                            tabs: [
                              DisCussTab(
                                  color: kItemColor3,
                                  code: 'Dự án phát triển phần mềm',
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
                                  ]),
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

  Widget buildSideBar(GlobalKey<ScaffoldState> key) {
    return SideBar(
      onSelected: () {
        key.currentState!.openEndDrawer();
      },
    );
  }
}
