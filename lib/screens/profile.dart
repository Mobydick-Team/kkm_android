import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/model/clothes.dart';
import 'package:kkm/model/user.dart';
import 'package:kkm/widgets/clothlist.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int change = 369;
  int writing = 12;
  int km = 24;
  ScrollController scrollController = ScrollController();
  bool showbtn = false;

  final List<ClothesList> userClothesList = <ClothesList>[];
  @override
  void initState() {
    for (int i = 0; i < 9; i++) {
      userClothesList.add(ClothesList(
          "메린",
          false,
          "https://movie-phinf.pstatic.net/20181213_264/1544692854634ss65r_JPEG/movie_image.jpg",
          "2000",
          "메린의 미친 옷",
          1000,
          3000,
          "부산광역시 연제구"));
    }
    scrollController.addListener(() {
      //scroll listener
      double showoffset =
          85.h; //Back to top botton will show on scroll offset 10.0

      if (scrollController.offset > showoffset) {
        showbtn = true;
        setState(() {
          //update state
        });
      } else {
        showbtn = false;
        setState(() {
          //update state
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Stack(children: [
            Container(
              width: double.infinity,
              height: 190.h,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [Color(0xffE8EAF6), Color(0xff595FFF)])),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 86.h),
              child: Container(
                width: double.infinity,
                height: 191.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 0,
                        blurRadius: 3.0,
                        offset: Offset(0, 1.h), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 59.h, bottom: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "나재민",
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "경상남도 양산시 평산동",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xff616161)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 1.5.h,
                      width: double.infinity,
                      color: const Color(0xffEEEEEE),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "거래수",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xffBDBDBD),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "$change",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff304FFE),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 29.w,
                        ),
                        Container(
                          height: 80.h,
                          width: 1.5.w,
                          color: const Color(0xffEEEEEE),
                        ),
                        SizedBox(
                          width: 29.w,
                        ),
                        Column(
                          children: [
                            Text(
                              "거래후기",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xffBDBDBD),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "$writing",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff304FFE),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 29.w,
                        ),
                        Container(
                          height: 80.h,
                          width: 1.5.w,
                          color: const Color(0xffEEEEEE),
                        ),
                        SizedBox(
                          width: 29.w,
                        ),
                        Column(
                          children: [
                            Text(
                              "보유꼬막",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xffBDBDBD),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "$km",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff304FFE),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 40.h, left: 133.5.w, right: 133.5.w),
              child: Container(
                width: 93.w,
                height: 93.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "images/cat.jpg",
                      )),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  top: 312.h,
                  left: 20.w,
                ),
                child: Row(
                  children: [
                    Text(
                      "📝",
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                    SizedBox(
                      width: 8.h,
                    ),
                    Text(
                      "사용자 게시물",
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    )
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(top: 339.h),
              child: const Clothes(),
            )
          ]),
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 0), //show/hide animation
        opacity: showbtn ? 1.0 : 0.0, //set obacity to 1 on visible, or hide
        child: Container(
          height: 55.h,
          width: 55.w,
          child: FittedBox(
            child: FloatingActionButton(
                elevation: 10.0,
                onPressed: () {
                  scrollController.animateTo(
                      //go to top of scroll
                      0.0,
                      duration: const Duration(
                          milliseconds: 450), //duration of scroll
                      curve: Curves.fastOutSlowIn //scroll type
                      );
                },
                child: Icon(
                  Icons.keyboard_arrow_up,
                  size: 30.w,
                  color: Colors.black,
                ),
                backgroundColor: Colors.white.withOpacity(0.79)),
          ),
        ),
      ),
    );
  }
}
