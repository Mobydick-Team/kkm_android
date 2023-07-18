import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kkm/common/common.dart';
import 'package:kkm/data/http_client.dart';
import 'package:kkm/data/my_loaction.dart';
import 'package:kkm/provider/user.dart';
import 'package:kkm/screens/bottom/bottom.dart';
import 'package:kkm/screens/signup/picture.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

class Name extends StatefulWidget {
  const Name({super.key});

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  final _nameController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool sameCheck = false;
  bool error = false;
  String postCode = '-';
  String address = '-';
  double latitude = 0.0;
  double longitude = 0.0;
  String kakaoLatitude = '-';
  String kakaoLongitude = '-';

  var dio = Dio();

  @override
  void dispose() {
    _focusNode.dispose(); // FocusNode를 dispose합니다.
    super.dispose();
  }

  void errormessage() {
    Fluttertoast.showToast(
        msg: "회원가입에 실패하셨습니다. 다시 시도해주세요.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  void successmessage() {
    Fluttertoast.showToast(
        msg: "회원가입에 성공하셨습니다!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  void getrequest(var userData) async {
    try {
      String url =
          'http://43.200.19.51:3034/user/check/${_nameController.text}';
      var parsingData = await sendGetRequest(url, null, context);
      print(parsingData);
      if (parsingData != null) {
        if (parsingData['exist'] == true) {
          setState(() {
            sameCheck = true;
          });
        } else {
          setState(() {
            sameCheck = false;
          });
          userData.inputName(_nameController.text);
          userData.inputLocation(latitude, longitude);
          FlutterDialog(userData);
        }
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude = myLocation.latitude2;
    longitude = myLocation.longitude2;
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
                    Text("닉네임을 ",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text(
                      _nameController.text,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: const Color(0xff536DFE)),
                    ),
                  ],
                ),
                Text(
                  "으로 하시겠어요?",
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 7.h),
                Text(
                  "닉네임은 추후 변경 가능해요",
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
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Picture()));
                    },
                  ),
                ],
              )
            ],
          );
        });
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

  @override
  void initState() {
    super.initState();
    getLocation();
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
                        hintText: '멋진 닉네임을 지어보세요!',
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
              ),
              error
                  ? Padding(
                      padding: EdgeInsets.only(top: 13.h, left: 21.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "닉네임은 2~10글자여야 해요(${_nameController.text.length}/10)",
                            style: TextStyle(
                                fontSize: 11.sp,
                                color: const Color(0xffD34646)),
                          )
                        ],
                      ))
                  : sameCheck
                      ? Padding(
                          padding: EdgeInsets.only(top: 13.h, left: 21.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "이미 사용 중인 닉네임이에요",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    color: const Color(0xffD34646)),
                              )
                            ],
                          ))
                      : Padding(
                          padding: EdgeInsets.only(top: 13.h),
                          child: Text(""),
                        ),
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
                    onPressed: _nameController.text == ""
                        ? null
                        : () {
                            if (_nameController.text.length > 1 &&
                                _nameController.text.length <= 10) {
                              setState(() {
                                error = false;
                              });
                              getrequest(userData);
                            } else {
                              setState(() {
                                error = true;
                              });
                            }
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
