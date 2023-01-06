import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                        style: TextStyle(fontSize: 26.sp, color: Colors.black),
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
                        onTap: () {},
                        child: Text(
                          "정보수정",
                          style: TextStyle(
                              color: const Color(0xff8E8E8F),
                              fontSize: 12.sp,
                              decoration: TextDecoration.underline,
                              decorationThickness: 3),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // SizedBox(
            //   height: 28.h,
            // ),
            SizedBox(
              height: 28.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 21.w, right: 21.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 155.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffF6F8FF),
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 14.w, right: 14.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "보유 꼬막",
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: const Color(0xff828282),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "1,000,000",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Image.asset(
                                "images/logo1.png",
                                scale: 3.5,
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: const Color(0xff8E8E8F),
                                size: 15.h,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 155.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffF6F8FF),
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 14.w, right: 14.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "거래 내역",
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: const Color(0xff828282),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "12 건",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: const Color(0xff8E8E8F),
                                size: 15.h,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 28.h,
            ),
            Padding(
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
            const SingleChildScrollView(
                scrollDirection: Axis.horizontal, child: HeartClothes()),
            Padding(
              padding: EdgeInsets.only(left: 21.w, right: 21.w, top: 20.h),
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
            const SingleChildScrollView(
                scrollDirection: Axis.horizontal, child: HeartClothes()),
            // SizedBox(
            //   height: 32.w,
            // ),
            SizedBox(
              height: 10.w,
            ),
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
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.black),
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
