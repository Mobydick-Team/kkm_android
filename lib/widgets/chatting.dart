import 'package:flutter/material.dart';
import 'package:kkm/model/chattingmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/screens/detailchatting.dart';

class Chatting extends StatefulWidget {
  const Chatting({super.key});

  @override
  State<Chatting> createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  final List<ChattingModel> chattingList = <ChattingModel>[];

  @override
  void initState() {
    for (int i = 0; i < 15; i++) {
      chattingList.add(ChattingModel("조용제", "연제구$i동", "$i분전", "고양이는 최고야!",
          "images/cat.jpg", i % 2 == 1 ? 1 : 0, i % 2 == 1 ? "거래 완료" : "거래 전"));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: makeChattingList(context, chattingList));
  }
}

List<Widget> makeChattingList(
    BuildContext context, List<ChattingModel> chattings) {
  List<Widget> results = [];
  for (var i = 0; i < chattings.length; i++) {
    results.add(
      Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const DetailChatting()));
          },
          child: SizedBox(
            height: 60.h,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  width: 49.w,
                  height: 49.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: Image.asset(
                      chattings[i].profile,
                      fit: BoxFit.fill,
                    ), // Text(key['title']),
                  ),
                ),
                SizedBox(
                  width: 200.w,
                  height: 60.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.h, right: 4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                chattings[i].name,
                                style: TextStyle(
                                    fontSize: 17.sp, color: Colors.black),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                "${chattings[i].location} • ${chattings[i].time}",
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color: const Color(0xff797979)),
                              )
                            ],
                          ),
                        ),
                        Text(
                          chattings[i].lastChatting,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 23.w,
                  height: 23.h,
                  margin: EdgeInsets.only(left: 35.w),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xff555FFF)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${chattings[i].alarm}",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  return results;
}
