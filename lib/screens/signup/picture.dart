import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kkm/common/common.dart';
import 'package:kkm/data/http_client.dart';
import 'package:kkm/provider/user.dart';
import 'package:kkm/screens/bottom/bottom.dart';
import 'package:kpostal/kpostal.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class Picture extends StatefulWidget {
  const Picture({super.key});

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  bool error = false;
  var image;
  var userImage;
  bool isImage = false;
  String postCode = '-';
  String address = '-';
  double latitude = 0.0;
  double longitude = 0.0;
  String kakaoLatitude = '-';
  String kakaoLongitude = '-';
  String imageUrl = '';

  void successmessage() {
    Fluttertoast.showToast(
        msg: "환영합니다!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(5),
          child: SizedBox(
            height: 140.h,
            width: 60.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }

  // Future<void> postrequest(var userdata, BuildContext context) async {
  //   try {
  //     String url = 'http://43.200.19.51:3034/user/signup';
  //     Map<String, dynamic> body = {
  //       'nickname': userdata.userName,
  //       'userId': userdata.userId,
  //       'latitude': userdata.lat,
  //       'longitude': userdata.lon,
  //       'address': userdata.useraddress
  //     };
  //     var parsingData = await sendPostRequest(url, body, context);
  //     print(parsingData);
  //     if (parsingData != null) {
  //       if (parsingData is String) {
  //         // ignore: avoid_print
  //         print('연동에 성공했어요!');
  //         // ignore: use_build_context_synchronously
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (_) => const Bottombar()));
  //         successmessage();
  //       } else {}
  //     } else {
  //       print("오류 발생");
  //     }
  //   } catch (e) {
  //     // ignore: avoid_print
  //     print("예외가 발생했어요");
  //     // ignore: avoid_print
  //     print(e.toString());
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (_) => const Bottombar()));
  //     successmessage();
  //   }
  // }

  void FlutterDialog1(var userdata) {
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
                      "회원가입",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: const Color(0xff536DFE)),
                    ),
                    Text("를 완료했어요!",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 7.h),
                Text(
                  "꼬꼬막의 일원이 돼 주셔서 감사해요",
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

  Future<void> uploadImage(UserData userdata, File file) async {
    print("getImageUrl 시작");
    late Response response;
    var dio = Dio();
    dio.options.headers['content-Type'] = 'multipart/form-data';

    FormData formData = FormData.fromMap({
      "profileImg": [
        await MultipartFile.fromFile(file.path, filename: "file.jpg"),
      ]
    });
    dio.options.contentType = 'multipart/form-data';

    response = await dio.post(
      "http://43.200.19.51:3034/user/signup/image/${userdata.userId}",
      data: formData,
      options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          }),
    );

    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("성공했습니다");
      print(response.data);
      FlutterDialog1(userdata);
      FlutterDialog1(userdata);
    }
    print(response.toString());
  }

  Future<void> postRequest(UserData userdata, File file) async {
    print("postRequest 시작");
    String url = 'http://43.200.19.51:3034/user/signup/request';

    Map<String, dynamic> body = {
      "nickname": userdata.userName,
      "userId": userdata.userId,
      "latitude": userdata.lat,
      "longitude": userdata.lon,
      "address": userdata.useraddress,
    };

    var parsingData = await sendPostRequest(url, body, context);

    print(parsingData);
    if (parsingData != null) {
      if (parsingData is String) {
        // ignore: avoid_print
        print('연동에 성공했어요!');
        uploadImage(userdata, file);
        // ignore: use_build_context_synchronously
      } else {}
    } else {
      print("오류 발생");
    }
  }

  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<UserData>(context);
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
          "프로필 설정",
          style: TextStyle(
              fontSize: 22.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
          child: Center(
              child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 19.5.w, right: 19.5.w),
              child: Column(children: [
                SizedBox(height: 89.h),
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
                          print(userImage);
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
                            color: Colors.black.withOpacity(0.4),
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
                        Positioned.fill(
                            bottom: 13.h,
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "이미지 업로드",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xffBDBDBD)),
                                    ),
                                    Icon(
                                      Icons.upload,
                                      color: const Color(0xffBDBDBD),
                                      size: 20.w,
                                    )
                                  ],
                                ))),
                      ],
                    ),
                  ),
                ),
              ])),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(320.w, 50.h),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    backgroundColor: CommonColor.blue),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => KpostalView(
                        useLocalServer: true,
                        localPort: 1024,
                        callback: (Kpostal result) {
                          setState(() {
                            userData.inputUserAddress(result.address);
                          });
                        },
                      ),
                    ),
                  );
                  await postRequest(userData, userImage);

                  // ignore: use_build_context_synchronously
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (_) => const Bottombar()));
                  // await uploadImage(userImage, userData);
                },
                child: Text(
                  "다음",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
          ),
        ],
      ))),
    );
  }
}
