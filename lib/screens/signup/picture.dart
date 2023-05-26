import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Picture extends StatefulWidget {
  const Picture({super.key});

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 22.h,
            color: Colors.black,
          ),
        ),
        title: Text(
          "닉네임 설정",
          style: TextStyle(
              fontSize: 22.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 19.5.w, right: 19.5.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "프로필 사진",
                    style: TextStyle(
                        fontSize: 16.sp, color: const Color(0xff8E8E8F)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 13.h, bottom: 13.h),
                child: Stack(
                  children: [
                    Container(
                      width: 322.w,
                      height: 322.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        image: const DecorationImage(
                            image: AssetImage("images/cat.jpg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      width: 322.w,
                      height: 322.h,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(6.r))),
                    ),
                    Container(
                      width: 322.w,
                      height: 322.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("images/cat.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
