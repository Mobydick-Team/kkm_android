import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  String nowName = "부소마여신";
  String nowAddress = "부산광역시 연제구 연수로 192";

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController(text: nowName);
    final _addressController = TextEditingController(text: nowAddress);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 35.w,
        title: Text(
          "내 정보 수정",
          style: TextStyle(
            fontSize: 22.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
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
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r))),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "내 닉네임",
                        style: TextStyle(
                            fontSize: 16.sp, color: const Color(0xff8E8E8F)),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13.r)),
                      color: const Color(0xffE9E9EA),
                    ),
                    margin: EdgeInsets.only(top: 8.h, bottom: 20.h),
                    child: TextField(
                      controller: _nameController,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          hintText: '',
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xff8E8E8F),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 16.w, right: 0, top: 0, bottom: 0),
                          suffixIcon: _nameController.text == ""
                              ? IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(null))
                              : IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    setState(() {
                                      _nameController.clear();
                                      FocusScope.of(context).unfocus();
                                    });
                                  },
                                  icon: const Icon(Icons.cancel_outlined))),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "위치",
                        style: TextStyle(
                            fontSize: 16.sp, color: const Color(0xff8E8E8F)),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13.r)),
                      color: const Color(0xffE9E9EA),
                    ),
                    margin: EdgeInsets.only(top: 8.h),
                    child: TextField(
                      controller: _addressController,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: '',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xff8E8E8F),
                        ),
                        suffixIcon: _nameController.text == ""
                            ? IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: const Icon(null))
                            : IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    _nameController.clear();
                                    FocusScope.of(context).unfocus();
                                  });
                                },
                                icon: const Icon(null)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 16.w, right: 0, top: 0, bottom: 0),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
