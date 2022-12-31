import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Introduce extends StatelessWidget {
  const Introduce({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 21.w, top: 25.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(130.r),

                    child: Image.asset(
                      "images/cat.jfif",
                      fit: BoxFit.fill,
                      height: 100.h,
                    ), // Text(key['title']),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "k99._.e",
                        style: TextStyle(fontSize: 24.sp, color: Colors.black),
                      ), //provider로 바꾸기
                      Text(
                        "부산광역시 강서구 가락동",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ), //provider로 바꾸기
                      Text(
                        "정보 수정",
                        style: TextStyle(
                            color: const Color(0xff8E8E8F), fontSize: 12.sp),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 28.h,
            ),
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
