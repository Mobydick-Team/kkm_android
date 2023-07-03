import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kkm/screens/bottom/bottom.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  String nowName = "부소마여신";
  String nowAddress = "부산광역시 연제구 연수로 192";

  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool error = false;
  bool input = false;
  var image;
  var userImage;
  bool isImage = false;

  @override
  void initState() {
    super.initState();
    _addressController.text = nowAddress;
  }

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
                    Text("내 정보를 ",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text(
                      "변경",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: const Color(0xff536DFE)),
                    ),
                    Text("하시겠어요?",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 7.h),
                Text(
                  "정보는 계속 변경할 수 있어요",
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
      resizeToAvoidBottomInset: false,
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
            ),
          ),
        ),
      ),
      bottomSheet: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 19.h,
            left: 21.w,
            right: 21.w,
          ),
          child: ElevatedButton(
            onPressed: () {
              FlutterDialog();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: input == true
                  ? const Color(0xff595FFF)
                  : const Color(0xffDFE6FF),
              elevation: 0.0,
              minimumSize: Size(double.infinity, 46.h),
            ),
            child: Text(
              "완료",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            print("눌렀음");
            FocusScope.of(context).unfocus();
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 19.5.w, right: 19.5.w),
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "프로필 사진",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xff8E8E8F),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 13.h, bottom: 13.h),
                    child: InkWell(
                      onTap: () async {
                        var picker = ImagePicker();
                        image =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          setState(() {
                            userImage = File(image.path);
                            isImage = true;
                          });
                        }
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 322.w,
                            height: 322.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: isImage == true
                                ? Image.file(
                                    userImage,
                                    fit: BoxFit.fill,
                                  )
                                : Image.asset(
                                    "images/cat.jpg",
                                    fit: BoxFit.fill,
                                  ),
                          ),
                          Container(
                            width: 322.w,
                            height: 322.h,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.r)),
                            ),
                            child: SizedBox(
                              width: 100.w,
                              height: 100.h,
                            ),
                          ),
                          ClipOval(
                            child: SizedBox(
                              width: 322.w,
                              height: 322.h,
                              child: isImage == true
                                  ? Image.file(
                                      userImage,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.asset(
                                      "images/cat.jpg",
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 322.h,
                            width: 322.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "내 닉네임",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xff8E8E8F),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8.h, bottom: 20.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13.r)),
                      border: error
                          ? Border.all(
                              width: 1.w,
                              color: const Color(0xffD34646),
                            )
                          : null,
                      color: const Color(0xffE9E9EA),
                    ),
                    child: TextField(
                      focusNode: _focusNode,
                      controller: _nameController,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: nowName,
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xff8E8E8F),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                          left: 16.w,
                          right: 0,
                          top: 0,
                          bottom: 0,
                        ),
                        suffixIcon: _nameController.text == ""
                            ? IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: const Icon(null),
                              )
                            : IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    _nameController.clear();
                                    FocusScope.of(context).unfocus();
                                  });
                                },
                                icon: const Icon(Icons.cancel_outlined),
                              ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (_nameController.text.length > 1) {
                            setState(() {
                              input = true;
                            });
                          } else {
                            setState(() {
                              input = false;
                            });
                          }
                        });
                      },
                      onTap: () {
                        if (!_focusNode.hasFocus) {
                          FocusScope.of(context).requestFocus(_focusNode);
                          setState(() {
                            error = false;
                          });
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "위치",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xff8E8E8F),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (_) => const PositionChange()));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 48.h,
                      margin: EdgeInsets.only(top: 8.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(13.r)),
                        color: const Color(0xffE9E9EA),
                      ),
                      padding: EdgeInsets.only(left: 16.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nowAddress,
                            style: TextStyle(
                              fontSize: 14.8.sp,
                              color: const Color(0xff424242),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom +
                          100.h), // 수정된 코드
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
