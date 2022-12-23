import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/common/common.dart';
import 'package:kkm/provider/user.dart';
import 'package:kkm/screens/bottom/bottom.dart';
import 'package:http/http.dart' as http;
import 'package:kpostal/kpostal.dart';
import 'package:provider/provider.dart';

class Name extends StatefulWidget {
  const Name({super.key});

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  final _nameController = TextEditingController();

  String postCode = '-';
  String address = '-';
  String latitude = '-';
  String longitude = '-';
  String kakaoLatitude = '-';
  String kakaoLongitude = '-';
  

  void postrequest(var userdata) async {
    try {
      
      
      String url = 'http://3.38.220.42:3031/join/user';
     
      // http.Response response =
      //     await http.post(Uri.parse(url), body: <String, String>{});

      // userdata.inputAccessToken();

    } catch (e) {
      print(e);
    }
  }

  void FlutterDialog(var userdata) {
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
                Text("정말 닉네임을",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _nameController.text,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18.sp,
                          color: Colors.black),
                    ),
                    Text(
                      " 으로 하실 건가요?",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "닉네임은 이후에 변경 가능합니다",
                  style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff8E8E8F)),
                ),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text("취소"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: const Text("확인"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => KpostalView(
        useLocalServer: true,
        localPort: 1024,
        kakaoKey: 'bef258d41292f6783323f982c395e203', //api키 native 키가 아닌 javascript 키로 바꾸기
        callback: (Kpostal result) {
                        setState(() {
                          postCode = result.postCode;
                          address = result.address;
                          latitude = result.latitude.toString();
                          longitude = result.longitude.toString();
                          kakaoLatitude = result.kakaoLatitude.toString();
                          kakaoLongitude =
                              result.kakaoLongitude.toString();
                        });
                      },
      )));
                  // postrequest(userdata);

                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (_) => const Bottombar()));
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<UserData>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
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
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 195.h, bottom: 12.h, left: 22.w),
                    child: Text(
                      "닉네임을 설정해주세요",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff8E8E8F)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: const Color(0xffF5F5F5),
                      border: Border.all(
                        color: const Color(0xffF5F5F5),
                        width: 2.0.w,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(13.r))),
                  child: TextField(
                    controller: _nameController,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 16.w,
                            top: _nameController.text == "" ? 0.h : 16.h),
                        hintText: '멋진 닉네임을 지어보세요!',
                        hintStyle: TextStyle(
                            fontSize: 16.sp, color: const Color(0xff8E8E8F)),
                        border: InputBorder.none,
                        suffixIcon: _nameController.text == ""
                            ? null
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
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 53.h),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(320.w, 50.h),
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        backgroundColor: CommonColor.blue),
                    onPressed: _nameController.text == ""
                        ? null
                        : () {
                            print("실행됨");
                            FlutterDialog(userData);
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
          ),
        ),
      ),
    );
  }
}
