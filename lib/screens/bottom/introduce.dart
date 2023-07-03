import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/screens/bottom/introduce/myclothes.dart';
import 'package:kkm/screens/bottom/introduce/review.dart';
import 'package:kkm/screens/bottom/introduce/updateprofile.dart';
import 'package:kkm/screens/bottom/introduce/zaamclothes.dart';
import 'package:kkm/widgets/heartclothlist.dart';

class Introduce extends StatefulWidget {
  const Introduce({super.key});

  @override
  State<Introduce> createState() => _IntroduceState();
}

class _IntroduceState extends State<Introduce> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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
                        style: TextStyle(fontSize: 23.sp, color: Colors.black),
                      ), //provider로 바꾸기
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "부산광역시 강서구 가락동",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const UpdateProfile()));
                        },
                        child: Text(
                          "내 정보 수정",
                          style: TextStyle(
                              color: const Color(0xff8E8E8F),
                              fontSize: 12.sp,
                              decoration: TextDecoration.underline,
                              decorationThickness: 1.5.h),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 23.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.5.w, right: 20.5.w),
              child: Container(
                height: 66.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffF6F8FF),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 36.5.w, right: 36.5.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "거래 내역",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xffBDBDBD)),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "369",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: const Color(0xff304FFE)),
                          )
                        ],
                      ),
                      Container(
                        width: 1.w,
                        height: 44.h,
                        color: const Color(0xffEEEEEE),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const Review()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "거래후기",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xffBDBDBD)),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              "12",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: const Color(0xff304FFE)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 1.w,
                        height: 44.h,
                        color: const Color(0xffEEEEEE),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "보유꼬막",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xffBDBDBD)),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "24",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: const Color(0xff304FFE)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const MyClohtes()));
              },
              child: Padding(
                padding: EdgeInsets.only(left: 21.w, right: 21.w, top: 28.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("images/post1.png"),
                    Text(
                      "내 게시물",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      width: 205.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: const Color(0xff8E8E8F),
                      size: 15.h,
                    ),
                  ],
                ),
              ),
            ),
            const SingleChildScrollView(
                scrollDirection: Axis.horizontal, child: HeartClothes()),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ZaamClothes()));
              },
              child: Padding(
                padding: EdgeInsets.only(left: 21.w, right: 21.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: const Color(0xffFF5160),
                      size: 15.h,
                    ),
                    Text(
                      "쩀한 게시물",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      width: 205.w,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: const Color(0xff8E8E8F),
                      size: 15.h,
                    ),
                  ],
                ),
              ),
            ),
            const SingleChildScrollView(
                scrollDirection: Axis.horizontal, child: HeartClothes()),

            SizedBox(
              height: 25.h,
            ),
            // SizedBox(
            //   height: 10.w,
            // ),
            Padding(
              padding: EdgeInsets.only(left: 21.w, right: 21.w),
              child: Container(
                padding: EdgeInsets.only(left: 16.w, right: 20.w),
                width: double.infinity,
                height: 72.h,
                decoration: BoxDecoration(
                  color: const Color(0xffF6F8FF),
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "꼬꼬막에게 말해주세요!",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "꼬꼬막을 사용하시면서 아쉬웠던 점은 없으셨나요?",
                          style: TextStyle(
                              fontSize: 10.sp, color: const Color(0xff828282)),
                        ),
                      ],
                    ),
                    Image.asset("images/email.png")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
