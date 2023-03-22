import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/model/selection.dart';

class SelectionWidget extends StatefulWidget {
  const SelectionWidget({Key? key}) : super(key: key);

  @override
  State<SelectionWidget> createState() => _SelectionWidgetState();
}

class _SelectionWidgetState extends State<SelectionWidget> {
  final List<Selection> selection = <Selection>[];
  final List<String> _values = [
    "전체",
    "상의",
    "스커트",
    "하의",
    "원피스",
    "가방",
    "패션용품",
    "신발",
    "액세서리",
    "기타"
  ];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      selection.add(Selection(_values[i], i == 0 ? true : false));
    }
    print("모두 끝남");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: makeSelection(context, selection)),
      ),
    );
  }
}

List<Widget> makeSelection(BuildContext context, List<Selection> selections) {
  List<Widget> results = [];

  for (int i = 0; i < selections.length; i++) {
    results.add(Padding(
      padding: EdgeInsets.only(right: 6.w),
      child: InkWell(
        onTap: () {
          for (int j = 0; j < 10; j++) {
            if (i == j) {
              selections[i].ispressed = true;
            } else {
              selections[i].ispressed = false;
            }
          }
        },
        child: Container(
          height: 21.h,
          width: selections[i].name.length == 4
              ? 62.w
              : selections[i].name.length == 3
                  ? 52.w
                  : 43.w,
          decoration: BoxDecoration(
            color: selections[i].ispressed
                ? const Color(0xff262626)
                : Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: selections[i].ispressed
                ? null
                : Border.all(width: 1.w, color: const Color(0xffE0E0E0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                selections[i].name,
                style: TextStyle(
                    fontSize: 11.sp,
                    color: selections[i].ispressed
                        ? Colors.white
                        : const Color(0xff262626)),
              )
            ],
          ),
        ),
      ),
    ));
  }
  return results;
}
