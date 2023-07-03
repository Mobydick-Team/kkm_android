import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    void FlutterDialog(var userdata) {
      showDialog(
          context: context,
          //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //Dialog Main Title
              title: Column(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: const Color(0xffEEEEEE),
                    size: 40.w,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("정말 ",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text("신고",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color(0xff555FFF),
                              fontWeight: FontWeight.bold)),
                      Text(" 하시겠어요?",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 7.h),
                  Text(
                    "한 번 접수된 신고는 취소할 수 없어요",
                    style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff8E8E8F)),
                  ),
                ],
              ),
              titlePadding: EdgeInsets.only(top: 13.h),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffEEEEEE),
                          elevation: 0.0,
                          minimumSize: Size(110.w, 36.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r))),
                      child: Text(
                        "취소",
                        style: TextStyle(
                            fontSize: 14.sp, color: const Color(0xff757575)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff536DFE),
                          minimumSize: Size(110.w, 36.h),
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r))),
                      child: Text(
                        "완료",
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      ),
                      onPressed: () async {},
                    ),
                  ],
                )
              ],
            );
          });
    }

    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 6.h, left: 12.w, bottom: 7.h),
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
                      "신고하기",
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffD34646)),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(top: 15.h, bottom: 15.h, left: 20.w),
                  child: Text(
                    "음란, 섹드립",
                    style: TextStyle(fontSize: 21.sp, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(top: 15.h, bottom: 15.h, left: 20.w),
                  child: Text(
                    "가스라이팅",
                    style: TextStyle(fontSize: 21.sp, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(top: 15.h, bottom: 15.h, left: 20.w),
                  child: Text(
                    "패드립",
                    style: TextStyle(fontSize: 21.sp, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(top: 15.h, bottom: 15.h, left: 20.w),
                  child: Text(
                    "남탓",
                    style: TextStyle(fontSize: 21.sp, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(top: 15.h, bottom: 15.h, left: 20.w),
                  child: Text(
                    "쌍욕",
                    style: TextStyle(fontSize: 21.sp, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
