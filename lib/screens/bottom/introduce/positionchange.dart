import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/screens/bottom/introduce/kakaomapview.dart';

class PositionChange extends StatefulWidget {
  const PositionChange({super.key});

  @override
  State<PositionChange> createState() => _PositionChangeState();
}

class _PositionChangeState extends State<PositionChange> {
  String address = "경남 양산시 평산회야로 167 KCC 아파트";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 35.w,
        title: Text(
          "위치 설정",
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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "현재 나의 위치예요!",
                    style: TextStyle(
                        fontSize: 19.sp,
                        color: const Color(0xff262626),
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 3.h, bottom: 30.h),
              child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            strutStyle: StrutStyle(fontSize: 16.sp),
                            text: TextSpan(
                              text: address,
                              style: TextStyle(
                                  color: const Color(0xff212121),
                                  height: 1.4,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19.sp),
                            )),
                      ),
                    ],
                  )),
            ),
            Padding(
                padding: EdgeInsets.only(left: 19.5.w, right: 19.5.w),
                child: KakaoMapWebView())
          ],
        ),
      ),
    );
  }
}
