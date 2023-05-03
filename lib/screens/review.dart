import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/widgets/writed_review.dart';
import 'package:kkm/widgets/writing_review.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  bool first = true;
  bool second = false;
  bool third = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 35.w,
        title: Text(
          "거래 후기",
          style: TextStyle(
              fontSize: 22.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0.0,
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
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            first = true;
                            second = false;
                            third = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(100.w, 30.h),
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            backgroundColor:
                                first ? const Color(0xff476FFF) : Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "후기 작성",
                              style: TextStyle(
                                  color: first ? Colors.white : Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            first = false;
                            second = true;
                            third = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(100.w, 30.h),
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            backgroundColor: second
                                ? const Color(0xff476FFF)
                                : Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "작성한 후기",
                              style: TextStyle(
                                  color: second ? Colors.white : Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            first = false;
                            second = false;
                            third = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(100.w, 30.h),
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            backgroundColor:
                                third ? const Color(0xff476FFF) : Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "받은 후기",
                              style: TextStyle(
                                  color: third ? Colors.white : Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ))
                  ],
                ),
              ),
              first
                  ? Container(
                      width: double.infinity,
                      height: 71.h,
                      margin: EdgeInsets.only(
                          left: 20.w, right: 20.w, top: 10.h, bottom: 5.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: const Color(0xffEEF1FF)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("images/logo2.png"),
                          SizedBox(
                            width: 15.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "후기만 작성해도 ",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "꼬막",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff3D5AFE)),
                                  ),
                                  Text(
                                    "이?",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text(
                                "거래 후기 작성하고 지금 당장 꼬막 받으러 달려 가세요!",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color: const Color(0xff9E9E9E)),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  : Container(),
              if (first)
                const WritingReviews()
              else if (second)
                const WritedReviews()
              else
                const WritedReviews()
            ],
          ),
        )),
      ),
    );
  }
}
