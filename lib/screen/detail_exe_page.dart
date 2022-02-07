import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/color.dart';
import 'package:lms/component/item_class.dart';
import 'package:lms/model/comment.dart';
import 'package:lms/model/exe.dart';
import 'package:lms/text_style.dart';

class DetailExe extends StatefulWidget {
  final Exe exe;
  final List<Comment> comments;
  final List<String> myExe;
  final TypeRoom type;
  const DetailExe(
      {Key? key,
      required this.exe,
      required this.comments,
      required this.myExe,
      this.type = TypeRoom.classroom})
      : super(key: key);

  @override
  _DetailExeState createState() => _DetailExeState();
}

class _DetailExeState extends State<DetailExe> {
  late TextEditingController textEditingController;
  int charLength = 0;
  bool isExpanedDetailExe = true;
  bool isExpanedMyExe = false;
  bool isExpanedComment = false;
  late List<String> myExeClone;
  late bool isUnSummited;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    myExeClone = List.of(widget.myExe);
    isUnSummited = isUnSummitedExe;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 20,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            'assets/images/cross.svg',
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          widget.exe.name,
                          style: kTitle,
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(
                  height: 2,
                  color: kShadow,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isExpanedDetailExe = !isExpanedDetailExe;
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, right: 5, bottom: 5),
                              child: isExpanedDetailExe
                                  ? SvgPicture.asset(
                                      'assets/images/arrow_dow.svg')
                                  : SvgPicture.asset(
                                      'assets/images/arrow_right.svg',
                                      width: 15,
                                      height: 15,
                                    ),
                            ),
                            const Text(
                              'Chi tiết bài tập',
                              style: kStyle7,
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isExpanedDetailExe,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Người giao : ${widget.exe.giver}',
                                      style: kStyle5,
                                    ),
                                    Text(
                                      'Thời gian giao : ${widget.exe.startTime.day}/${widget.exe.startTime.month}/${widget.exe.startTime.year}',
                                      style: kStyle5,
                                    ),
                                    Text(
                                      'Hạn nộp: ${widget.exe.deadline?.hour}: ${widget.exe.deadline?.minute}, ${widget.exe.deadline?.day}/${widget.exe.deadline?.month}/${widget.exe.deadline?.year}',
                                      style: kStyle5,
                                    )
                                  ],
                                ),
                                Visibility(
                                  visible:
                                      widget.exe.status != StatusExe.onActive,
                                  child: SizedBox(
                                    height: 50,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          formaterStatus(),
                                          style: widget.exe.status !=
                                                  StatusExe.submitted
                                              ? kStyleHightLight2
                                              : kStyleHightLight1,
                                        ),
                                        widget.exe.score != null
                                            ? Text(
                                                '${widget.exe.score} điểm',
                                                style: kStyleHightLight1,
                                              )
                                            : const Text(
                                                'chờ xét duyệt',
                                                style: kStyleHightLight3,
                                              )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 110,
                              decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  border: Border.all(color: kShadow, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Stack(
                                children: [
                                  Positioned(
                                      right: 0,
                                      top: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: kItemColor5,
                                            border: Border.all(
                                                color: kShadow, width: 1),
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10))),
                                        height: 110,
                                        width: 165,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text(
                                                'Thực hành 3.doc',
                                                style: kStyle8,
                                              ),
                                              Text(
                                                'Word',
                                                style: kStyle9,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Image.asset(
                                          'assets/images/image_doc.png'))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 2,
                  color: kShadow,
                ),
                buildComment(size),
                const Divider(
                  height: 1,
                  color: kShadow,
                ),
                buidMyExe(),
                const Divider(
                  height: 30,
                  color: kShadow,
                ),
              ],
            ),
          ),
          buildControl()
        ],
      ),
    );
  }

  Widget buildControl() {
    return Visibility(
      visible: widget.type == TypeRoom.checkroom && !isUnSummited,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: isUnSummited,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: kBackgroundColor,
                      border: Border.all(
                          color: kShadow.withOpacity(0.49), width: 1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: kShadow, offset: Offset(0, 4), blurRadius: 4)
                      ]),
                  child:
                      Center(child: SvgPicture.asset('assets/images/plus.svg')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isUnSummited = !isUnSummited;
                  });
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: isUnSummited ? kItemColor6 : kBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                      border: isUnSummited
                          ? null
                          : Border.all(
                              color: kShadow.withOpacity(0.49), width: 1)),
                  child: Center(
                      child: Text(
                    isUnSummited ? 'Nộp Bài' : 'Hủy Nộp',
                    style: isUnSummited ? kStyle1 : kStyleChoice1,
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool get isUnSummitedExe {
    return widget.exe.status != StatusExe.submitted &&
        widget.exe.status != StatusExe.late;
  }

  Widget buildComment(Size size) {
    if (isExpanedComment == true) {
      return Flexible(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isExpanedComment = !isExpanedComment;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 5, right: 5, bottom: 5),
                        child: isExpanedComment
                            ? SvgPicture.asset('assets/images/arrow_dow.svg')
                            : SvgPicture.asset(
                                'assets/images/arrow_right.svg',
                                width: 15,
                                height: 15,
                              ),
                      ),
                      const Text(
                        'Nhận xét',
                        style: kStyle7,
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Visibility(
                  visible: isExpanedComment,
                  maintainState: true,
                  maintainAnimation: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.23)),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: Image.asset('assets/images/logo.png')),
                            ),
                            SizedBox(
                              width: size.width - 100,
                              child: TextField(
                                controller: textEditingController,
                                onChanged: (str) {
                                  setState(() {
                                    charLength = str.trim().length;
                                  });
                                },
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    border: InputBorder.none,
                                    hintText: 'Nhập nhận xét của bạn...',
                                    hintStyle: kStyleHintText,
                                    suffixIconConstraints: const BoxConstraints(
                                        minHeight: 18, minWidth: 18),
                                    suffixIcon: InkWell(
                                      child: SvgPicture.asset(
                                        'assets/images/plane.svg',
                                        color: charLength > 0
                                            ? kPrimaryColor
                                            : kShadow,
                                      ),
                                      onTap: () {},
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          itemCount: widget.comments.length,
                          itemBuilder: (context, index) =>
                              buildItemComment(widget.comments[index]),
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 7,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: InkWell(
          onTap: () {
            setState(() {
              isExpanedComment = !isExpanedComment;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 5, bottom: 5),
                  child: isExpanedComment
                      ? SvgPicture.asset('assets/images/arrow_dow.svg')
                      : SvgPicture.asset(
                          'assets/images/arrow_right.svg',
                          width: 15,
                          height: 15,
                        ),
                ),
                const Text(
                  'Nhận xét',
                  style: kStyle7,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget buidMyExe() {
    if (isExpanedMyExe) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isExpanedMyExe = !isExpanedMyExe;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 5, right: 5, bottom: 5),
                        child: isExpanedMyExe
                            ? SvgPicture.asset('assets/images/arrow_dow.svg')
                            : SvgPicture.asset(
                                'assets/images/arrow_right.svg',
                                width: 15,
                                height: 15,
                              ),
                      ),
                      const Text(
                        'Bài tập',
                        style: kStyle7,
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                  visible: isExpanedMyExe,
                  child: Flexible(
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: myExeClone.length,
                        itemBuilder: (context, index) =>
                            buildItemMyExe(myExeClone[index], index)),
                  ))
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: InkWell(
          onTap: () {
            setState(() {
              isExpanedMyExe = !isExpanedMyExe;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 5, bottom: 5),
                  child: isExpanedMyExe
                      ? SvgPicture.asset('assets/images/arrow_dow.svg')
                      : SvgPicture.asset(
                          'assets/images/arrow_right.svg',
                          width: 15,
                          height: 15,
                        ),
                ),
                const Text(
                  'Bài tập',
                  style: kStyle7,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget buildItemComment(Comment comment) {
    return Container(
      height: 80,
      width: 400,
      decoration: BoxDecoration(
          color: kBackgroundColor,
          border: Border.all(color: kShadow, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset('assets/images/logo.png')),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    comment.sender,
                    style: kStyle4,
                  ),
                  Text(
                    '${comment.date.hour}: ${comment.date.minute}, ${comment.date.day}/${comment.date.month}/${comment.date.year}',
                    style: kStyleTime,
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              comment.content,
              style: kStyle4,
            ),
          )
        ],
      ),
    );
  }

  Widget buildItemMyExe(String myExe, index) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            height: 30,
            width: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: SvgPicture.asset(
                          'assets/images/doc.svg',
                          width: 10,
                          height: 10,
                          color: kShadow,
                        ),
                      ),
                      Text(
                        myExe,
                        style: kStyle4,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        'assets/images/cross.svg',
                        height: 15,
                        width: 15,
                        color: isUnSummited ? kHightLightColor2 : kShadow,
                      ),
                      onTap: () {
                        if (isUnSummited) {
                          setState(() {
                            myExeClone.removeAt(index);
                          });
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: kShadow, width: 1),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ],
    );
  }

  String formaterStatus() {
    if (widget.exe.status == StatusExe.submitted) {
      return "Đã nôp";
    } else if (widget.exe.status == StatusExe.short) {
      return "Thiếu";
    } else if (widget.exe.status == StatusExe.late) {
      return 'Muộn';
    } else {
      return '';
    }
  }
}
