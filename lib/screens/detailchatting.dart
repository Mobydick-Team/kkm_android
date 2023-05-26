import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kkm/screens/report.dart';

class DetailChatting extends StatefulWidget {
  const DetailChatting({super.key});

  @override
  State<DetailChatting> createState() => _DetailChattingState();
}

class _DetailChattingState extends State<DetailChatting> {
  bool status1 = false;
  bool status2 = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        endDrawer: SafeArea(
          child: SizedBox(
              width: double.infinity,
              child: Drawer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 6.h, left: 12.w, bottom: 20.5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 21.w,
                                color: Colors.black,
                              )),
                          Text(
                            "상세정보",
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_none,
                          color: Colors.black,
                          size: 22.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.w, right: 147.w),
                          child: Text(
                            "메시지 알림",
                            style:
                                TextStyle(fontSize: 20.sp, color: Colors.black),
                          ),
                        ),
                        FlutterSwitch(
                          width: 45.w,
                          height: 25.h,
                          value: status1,
                          valueFontSize: 0.sp,
                          padding: 2.h,
                          activeColor: const Color(0xff555FFF),
                          duration: const Duration(milliseconds: 100),
                          onToggle: (val) {
                            setState(() {
                              status1 = val;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                          size: 22.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.w, right: 165.w),
                          child: Text(
                            "약속 알림",
                            style:
                                TextStyle(fontSize: 20.sp, color: Colors.black),
                          ),
                        ),
                        FlutterSwitch(
                          width: 45.w,
                          height: 25.h,
                          value: status2,
                          valueFontSize: 0.sp,
                          padding: 2.h,
                          activeColor: const Color(0xff555FFF),
                          duration: const Duration(milliseconds: 100),
                          onToggle: (val) {
                            setState(() {
                              status2 = val;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const Report(),
                            transitionDuration:
                                const Duration(milliseconds: 300),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 22.w, top: 10.h, bottom: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: const Color(0xffD34646),
                              size: 22.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 165.w),
                              child: Text(
                                "신고하기",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    color: const Color(0xffD34646)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 22.w, top: 15.h, bottom: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.logout,
                              color: const Color(0xffD34646),
                              size: 22.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, right: 165.w),
                              child: Text(
                                "채팅방 나가기",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    color: const Color(0xffD34646)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 35.w,
          leading: Padding(
            padding: EdgeInsets.only(left: 13.w),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 21.w,
                  color: Colors.black,
                )),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 37.w,
                    height: 40.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child: Image.network(
                        "https://user-images.githubusercontent.com/89582664/211428663-3d57f82b-5ee3-4cc7-be21-f6be99d37caa.png",
                        fit: BoxFit.fill,
                      ), // Text(key['title']),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "qkqh.5",
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  size: 25.w,
                  color: Colors.black,
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Scaffold.of(context).openEndDrawer();

                  FocusScope.of(context).unfocus();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ],
          elevation: 0.0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Center(
            child: Column(children: const [
              SizedBox(
                height: 50,
              ),
              Text("채팅창이 곧 생길 예정")
            ]),
          )),
        ),
        bottomSheet: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom), //위 상태바 없애기
              child: Container(
                height: 55.h,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, bottom: 12.h, top: 4.h),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(color: Colors.black, fontSize: 16.sp),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        contentPadding: EdgeInsets.only(left: 16.w),
                        filled: true,
                        suffixIcon: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.control_point,
                            color: Colors.black,
                            size: 23.75.w,
                          ),
                        ),
                        fillColor: Colors.white70),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
