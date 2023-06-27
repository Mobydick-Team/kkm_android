import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kkm/provider/user.dart';
import 'package:provider/provider.dart';

class Write extends StatefulWidget {
  const Write({super.key});

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  var image;
  var userImage;
  int pictureCount = 0;
  final _writeController = TextEditingController();

  void toastmessage() {
    Fluttertoast.showToast(
        msg: "이미지는 3개까지 올릴 수 있어요",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 13.sp);
  }

  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<UserData>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 22.w, top: 12.5.h, bottom: 20.5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "글 작성",
                          style: TextStyle(
                              fontSize: 22.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 10.w),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () async {
                              if (pictureCount < 3) {
                                var picker = ImagePicker();
                                image = await picker.pickImage(
                                    source: ImageSource.gallery);
                                if (image != null) {
                                  setState(() {
                                    userImage = File(image.path);
                                    pictureCount++;
                                    userData.addPicture(userImage);
                                  });
                                }
                              } else {
                                toastmessage();
                              }
                            },
                            child: Container(
                              height: 99.h,
                              width: 97.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: const Color(0xffF5F5F5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("images/camera3.png"),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    "사진 추가",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: const Color(0xffBDBDBD),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "($pictureCount/3)",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: const Color(0xffBDBDBD),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: makePictrue(context, userData),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 5.h,
                    color: const Color(0xffEEEEEE),
                  ),
                  Container(
                    width: double.infinity, // 최대 너비 설정
                    height: 40.h,
                    margin: EdgeInsets.only(left: 22.w, right: 22.w, top: 20.h),
                    child: TextField(
                      controller: _writeController,
                      style: TextStyle(
                          fontSize: 24.sp,
                          color: const Color(0xff616161),
                          fontWeight: FontWeight.w500),
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: '제목을 입력해주세요',
                        hintStyle: TextStyle(
                            fontSize: 24.sp,
                            color: const Color(0xffBDBDBD),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 70.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "3일 대여비",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xff424242)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Container(
                          height: 35.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              color: const Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(7.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "₩",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xffBEBEBE)),
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              Container(
                                width: 60.w,
                                child: TextField(
                                  controller: _writeController,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xff424242),
                                      fontWeight: FontWeight.w400),
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    hintText: '금액 입력',
                                    hintStyle: TextStyle(
                                        fontSize: 14.sp,
                                        color: const Color(0xffBEBEBE),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 70.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "보증금",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xff424242)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Align(
                          child: Container(
                            height: 35.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: const Color(0xffF5F5F5),
                                borderRadius: BorderRadius.circular(7.r)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "₩",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xffBEBEBE)),
                                ),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Container(
                                  width: 60.w,
                                  child: TextField(
                                    controller: _writeController,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: const Color(0xff424242),
                                        fontWeight: FontWeight.w400),
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: '금액 입력',
                                      hintStyle: TextStyle(
                                          fontSize: 14.sp,
                                          color: const Color(0xffBEBEBE),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> makePictrue(BuildContext context, UserData userData) {
    List<Widget> results = [];
    for (var i = 0; i < userData.pictureList.length; i++) {
      results.add(Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: SizedBox(
          height: 130.h,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 99.h,
                    width: 97.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: DecorationImage(
                            image: FileImage(userData.pictureList[i]),
                            fit: BoxFit.fill),
                        color: const Color(0xffF5F5F5)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 82.w, top: 7.h),
                child: Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: IconButton(
                      color: Colors.white,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        setState(() {
                          userData.removePicture(i);
                          pictureCount--;
                        });
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: const Color(0xffBDBDBD),
                        size: 22.w,
                      )),
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return results;
  }
}
