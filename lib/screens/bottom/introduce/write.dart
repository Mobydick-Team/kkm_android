import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/screens/bottom/bottom.dart';

class Write extends StatefulWidget {
  const Write({super.key});

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  bool haskm = false;
  bool nonekm = false;
  final _writeController = TextEditingController();

  void FlutterDialog() {
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
                    Text(
                      "후기",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: const Color(0xff536DFE)),
                    ),
                    Text("를 작성하시겠어요?",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 7.h),
                Text(
                  "한 번 후기는 삭제/수정이 불가능해요.",
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Bottombar()));
                    },
                  ),
                ],
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              FlutterDialog();
            },
            child: Text(
              "완료",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xff3D5AFE),
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
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
          "후기 작성",
          style: TextStyle(
              fontSize: 22.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100.h,
                    margin: EdgeInsets.only(left: 19.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 70.w,
                          height: 74.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              image: const DecorationImage(
                                image: AssetImage(
                                  "images/cat.jpg",
                                ),
                                fit: BoxFit.fill,
                              )),
                        ),
                        SizedBox(
                          width: 9.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 14.h, bottom: 14.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 19.h,
                                    width: 20.w,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage("images/cat.jfif"),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    "이쁘나은",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: const Color(0xff757575)),
                                  )
                                ],
                              ),
                              Text(
                                "언더아머 바람막이",
                                style: TextStyle(
                                    fontSize: 13.sp, color: Colors.black),
                              ),
                              Container(
                                width: 114.w,
                                height: 24.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.r),
                                    color: const Color(0xffF5F5F5)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "최종 금액",
                                      style: TextStyle(
                                          fontSize: 10.sp, color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 14.w,
                                    ),
                                    Text(
                                      "9000원",
                                      style: TextStyle(
                                          fontSize: 13.sp, color: Colors.black),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1.h,
                    color: const Color(0xffBDBDBD),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, top: 22.h, bottom: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 18.w,
                            height: 18.h,
                            child: Image.asset(
                              "images/logo1.png",
                              fit: BoxFit.fill,
                            )),
                        SizedBox(
                          width: 13.w,
                        ),
                        Text(
                          "꼬막 지급",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 19.w, right: 19.w, bottom: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                backgroundColor: haskm
                                    ? const Color(0xffF6F6FF)
                                    : Colors.white,
                                minimumSize: Size(151.w, 55.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                side: BorderSide(
                                    color: haskm
                                        ? const Color(0xff8C9EFF)
                                        : const Color(0xffE0E0E0),
                                    width: 1.5.w)),
                            onPressed: () {
                              setState(() {
                                haskm = true;
                                nonekm = false;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: 25.w,
                                    height: 25.h,
                                    child: Image.asset(
                                      "images/logo1.png",
                                      fit: BoxFit.fill,
                                    )),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Text(
                                  "있꼬막",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xff8C9EFF)),
                                )
                              ],
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                backgroundColor: nonekm
                                    ? const Color(0xffF6F6FF)
                                    : Colors.white,
                                minimumSize: Size(151.w, 55.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                side: BorderSide(
                                    color: nonekm
                                        ? const Color(0xff8C9EFF)
                                        : const Color(0xffE0E0E0),
                                    width: 1.5.w)),
                            onPressed: () {
                              setState(() {
                                haskm = false;
                                nonekm = true;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: 25.w,
                                    height: 25.h,
                                    child: Image.asset(
                                      "images/nologo.png",
                                      fit: BoxFit.fill,
                                    )),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Text(
                                  "없꼬막",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xff9E9E9E)),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 10.h,
                    margin: EdgeInsets.only(bottom: 22.h),
                    color: const Color(0xffF5F5F5),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 21.w,
                          height: 21.h,
                          child: Image.asset(
                            "images/smile.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "상품 후기",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: const Color(0xff262626),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "(최소 20자 이상)",
                          style: TextStyle(
                              fontSize: 15.sp, color: const Color(0xff262626)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity, // 최대 너비 설정
                    height: 380.h,
                    margin: EdgeInsets.only(left: 21.w, right: 21.w, top: 19.h),
                    child: TextField(
                      controller: _writeController,
                      style: TextStyle(
                          fontSize: 12.sp, color: const Color(0xff424242)),
                      maxLines: null, // 자동 줄 바꿈을 위해 maxLines를 null로 설정

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText:
                            '*제품의 구체적인 후기를 남겨주세요.\n\n상품 상태, 판매자 매너 등을 중심으로 적어주세요.\n상품을 사용하여 좋았던 점, 아쉬웠던 점을 적어주세요.',
                        hintStyle: TextStyle(
                            fontSize: 13.sp, color: const Color(0xffBDBDBD)),
                      ),
                    ),
                  ),
                  // SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
