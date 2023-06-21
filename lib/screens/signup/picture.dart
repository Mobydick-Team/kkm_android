import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kkm/common/common.dart';
import 'package:kkm/provider/user.dart';
import 'package:kkm/screens/bottom/bottom.dart';
import 'package:kpostal/kpostal.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

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

  Future<void> uploadImage(File file, var userData) async {
    print("실행됨");
    _onLoading();
    var dio = Dio();

    FormData formData = FormData.fromMap({
      "data": {
        "nickname": userData.userName,
        "userId": userData.userId,
        "latitude": userData.lat,
        "longitude": userData.lon,
        "address": "연수로 192번지"
      },
      "profileImg": {
        await MultipartFile.fromFile(file.path, filename: "file"),
      }
    });

    Response response =
        await dio.post("http://43.200.19.51:3034/user/signup", data: formData);

    Navigator.pop(context);
    print(response.statusCode);
    print(response.data);
    if (response.statusCode == 200) {
      print("statuscode가 200임");
      FlutterDialog1(userData);
    } else {
      print("statuscode를 가 이상함");
    }
  }

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

  Future<void> sendRequest(UserData userData, File imageFile) async {
    try {
      var url = Uri.parse('http://43.200.19.51:3034/user/signup');

      var request = http.MultipartRequest('POST', url);
      request.headers['Content-Type'] =
          'multipart/form-data; charset=utf-8'; // Set the content type to multipart/form-data

      // JSON 데이터를 추가합니다.
      request.fields['data'] = jsonEncode({
        "nickname": userData.userName,
        "userId": userData.userId,
        "latitude": userData.lat,
        "longitude": userData.lon,
        "address": userData.useraddress
      });

      // 파일을 추가합니다.
      var file = await http.MultipartFile.fromPath(
        'profileImg',
        imageFile.path,
      );
      request.files.add(file);

      var response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('요청 성공');
        FlutterDialog1(userData);
        FlutterDialog1(userData);
        // 성공적인 응답을 받았을 때 실행할 작업을 추가하세요
      } else {
        print('요청 실패');
        // 실패한 경우에 대한 예외 처리 또는 오류 메시지 표시 등을 수행하세요
      }
    } catch (e) {
      print('요청 중 오류 발생: $e');
      // 오류 처리를 수행하세요
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
                        // kakaoKey: '{Add your KAKAO DEVELOPERS JS KEY}',
                        callback: (Kpostal result) {
                          setState(() {});
                        },
                      ),
                    ),
                  );
                  print("하이");
                  FlutterDialog1(userData);
                  FlutterDialog1(userData);
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
