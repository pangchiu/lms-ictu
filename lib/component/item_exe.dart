import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/color.dart';
import 'package:lms/model/comment.dart';
import 'package:lms/model/exe.dart';
import 'package:lms/screen/detail_exe_page.dart';
import 'package:lms/text_style.dart';

class ItemExe extends StatelessWidget {
  final Exe exe;
  const ItemExe({Key? key, required this.exe}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailExe(exe: exe, comments: [
                      Comment("Nguyễn Văn A", "Bài khó quá", DateTime.now()),
                    ], myExe: const [
                      "kt.doc"
                    ])));
      },
      child: Container(
        height: 65,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 45,
                height: 45,
                child: SizedBox(
                  width: 10,
                  height: 10,
                  child: SvgPicture.asset(
                    'assets/images/exe.svg',
                    color: kBackgroundColor,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                decoration: const BoxDecoration(
                    color: kPrimaryColor, shape: BoxShape.circle),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exe.name,
                          style: kStyle4,
                        ),
                        Text(
                          formaterDate(),
                          style: kStyleHintText,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: exe.status != StatusExe.onActive,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            formaterStatus(),
                            style: exe.status != StatusExe.submitted
                                ? kStyleHightLight2
                                : kStyleHightLight1,
                          ),
                          exe.score != null
                              ? Text(
                                  '${exe.score} điểm',
                                  style: kStyleHightLight1,
                                )
                              : const Text(
                                  'chờ xét duyệt',
                                  style: kStyleHightLight1,
                                )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: kBackgroundColor,
            border: Border.all(
              color: kShadow.withOpacity(0.25),
              width: 1,
            ),
            boxShadow: const [
              BoxShadow(offset: Offset(0, 1.5), blurRadius: 2, color: kShadow)
            ]),
      ),
    );
  }

  Widget builDetail() {
    return Container();
  }

  String formaterDate() => exe.deadline == null
      ? 'Không có ngày đến hạn'
      : 'Hạn nộp: ${exe.deadline?.hour}: ${exe.deadline?.minute} - ${exe.deadline?.day}/${exe.deadline?.month}/${exe.deadline?.year}';

  String formaterStatus() {
    if (exe.status == StatusExe.submitted) {
      return "Đã nôp";
    } else if (exe.status == StatusExe.short) {
      return "Thiếu";
    } else if (exe.status == StatusExe.late) {
      return 'Muộn';
    } else {
      return '';
    }
  }
}
