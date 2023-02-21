import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
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
    );
  }
}
