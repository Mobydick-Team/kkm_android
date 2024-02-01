import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kkm/data/http_client.dart';
import 'package:kkm/provider/user.dart';
import 'package:kkm/screens/bottom/bottom.dart';
import 'package:kkm/screens/selectct.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Write extends StatefulWidget {
  const Write({super.key});

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> with WidgetsBindingObserver {
  bool keyboardVisible = false;

  @override
  void initState() {
    super.initState();
    // WidgetsBindingObserver 등록
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // WidgetsBindingObserver 해제
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bool newKeyboardVisible =
        WidgetsBinding.instance.window.viewInsets.bottom > 0;
    setState(() {
      keyboardVisible = newKeyboardVisible;
      print(keyboardVisible);
    });
  }

  var image;
  var userImage;
  int pictureCount = 0;
  final _writeController1 = TextEditingController();
  final _writeController2 = TextEditingController();
  final _writeController3 = TextEditingController();
  final _writeController4 = TextEditingController();

  bool writing1 = false;
  bool writing2 = false;
  bool writing3 = false;
  bool writing4 = false;

  int category = 0;

  List<String> clothesName = [
    '상의',
    '스커트',
    '하의',
    '원피스',
    '액세서리',
    '신발',
    '패션소품',
    '가방',
    '기타'
  ];

  List<String> returnString = [
    'SHIRT',
    'SKIRT',
    'PANTS',
    'ONEPIECE',
    'ACCESSORY',
    'SHOES',
    'FASHION',
    'BAG',
    'ETC'
  ];

  final FocusNode focusNode = FocusNode();

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
                    Text("게시물 작성을 ",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Text(
                      "완료",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                          color: const Color(0xff536DFE)),
                    ),
                    Text("하시겠어요?",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 7.h),
                Text(
                  "게시물 작성 후 수정이 가능해요",
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
                      await postrequest(userdata, context);
                    },
                  ),
                ],
              )
            ],
          );
        });
  }

  Future<void> postrequest(UserData userdata, BuildContext context) async {
    String url = 'http://43.200.19.51:3034/post';
    var dio = Dio();

    Map<String, dynamic> body = {
      "title": _writeController1.text,
      "content": _writeController4.text,
      "price": _writeController3.text,
      "deposit": _writeController2.text,
      "category": returnString[category],
      "urls": userdata.imageUrls.length == 1
          ? [userdata.imageUrls[0]]
          : userdata.imageUrls.length == 2
              ? [userdata.imageUrls[0], userdata.imageUrls[1]]
              : [
                  userdata.imageUrls[0],
                  userdata.imageUrls[1],
                  userdata.imageUrls[2]
                ]
    };

    // dio.options.headers['content-Type'] = 'application/json';
    // dio.options.headers["Authorization"] = "Bearer ${userdata.accessToken}";
    // final response = await dio.post(
    //   url,
    //   data: body,
    // );
    // print(response.statusCode);
    // print(response.data);

    var parsingData = await sendPostRequest(url, body, context);

    print(parsingData);
    if (parsingData != null) {
      if (parsingData is String) {
        // ignore: avoid_print
        print('연동에 성공했어요!');

        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Bottombar()));
        // ignore: use_build_context_synchronously
      } else {}
    } else {
      print("오류 발생");
    }
  }

  Future<void> uploadImage(File file, UserData userdata) async {
    print("시작");
    late Response response;
    var dio = Dio();
    dio.options.headers['content-Type'] = 'multipart/form-data';

    FormData formData = FormData.fromMap({
      "images": [
        await MultipartFile.fromFile(file.path, filename: "file.jpg"),
      ]
    });
    dio.options.contentType = 'multipart/form-data';

    response = await dio.post(
      "http://43.200.19.51:3034/post/image",
      data: formData,
      options: Options(
          headers: {"authorization": "Bearer ${userdata.accessToken}"},
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          }),
    );

    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("성공했습니다");
      print(response.data);
      userdata.addPicture(userImage, response.data['urls'][0]);
      for (int i = 0; i < userdata.imageUrls.length; i++) {
        print(userdata.imageUrls[i]);
      }
    }
    print(response.toString());
  }

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
        resizeToAvoidBottomInset: false,
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
                                    });
                                    await uploadImage(userImage, userData);
                                  }
                                } else {
                                  toastmessage();
                                }
                              },
                              child: Container(
                                height: 99.h,
                                width: 97.w,
                                margin: EdgeInsets.only(right: 10.w),
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
                      margin:
                          EdgeInsets.only(left: 22.w, right: 22.w, top: 20.h),
                      child: TextField(
                        controller: _writeController1,
                        style: TextStyle(
                            fontSize: 24.sp,
                            color: const Color(0xff616161),
                            fontWeight: FontWeight.w500),
                        onChanged: (value) {
                          if (value.isEmpty == false) {
                            setState(() {
                              writing1 = true;
                            });
                          } else {
                            setState(() {
                              writing1 = false;
                            });
                          }
                        },
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
                                SizedBox(
                                  width: 60.w,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15.h),
                                    child: TextField(
                                      controller: _writeController2,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: const Color(0xffBEBEBE),
                                          fontWeight: FontWeight.w400),
                                      maxLines: 1,
                                      onChanged: (value) {
                                        if (value.isEmpty == false) {
                                          setState(() {
                                            writing2 = true;
                                          });
                                        } else {
                                          setState(() {
                                            writing2 = false;
                                          });
                                        }
                                      },
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
                                SizedBox(
                                  width: 60.w,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15.h),
                                    child: TextField(
                                      controller: _writeController3,
                                      onChanged: (value) {
                                        if (value.isEmpty == false) {
                                          setState(() {
                                            writing3 = true;
                                          });
                                        } else {
                                          setState(() {
                                            writing3 = false;
                                          });
                                        }
                                      },
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: const Color(0xffBEBEBE),
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
                                ),
                              ],
                            ),
                          )
                        ],
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
                    InkWell(
                      onTap: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SelectCategory()));
                        setState(() {
                          category = result;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                          top: 21.5.h,
                        ),
                        child: Container(
                          height: 30.h,
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                category == 0
                                    ? "카테고리 없음"
                                    : clothesName[category],
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xff424242),
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: const Color(0xff424242),
                                size: 12.w,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity, // 최대 너비 설정
                      height: 264.h,
                      margin:
                          EdgeInsets.only(left: 22.w, right: 22.w, top: 10.h),
                      child: TextField(
                        controller: _writeController4,
                        style: TextStyle(
                            fontSize: 14.sp, color: const Color(0xff424242)),
                        maxLines: null, // 자동 줄 바꿈을 위해 maxLines를 null로 설정
                        onChanged: (value) {
                          setState(() {});
                          if (value.isEmpty == false) {
                            setState(() {
                              writing4 = true;
                            });
                          } else {
                            setState(() {
                              writing4 = false;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: '상품에 대한 자세한 설명을 적어주세요',
                          hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xffBDBDBD),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: keyboardVisible == true ? 380.h : 0.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomSheet: Builder(
          builder: (context) => SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.only(
                          bottom:
                              MediaQuery.of(context).viewInsets.bottom + 25.h),
                      child: ElevatedButton(
                        onPressed: pictureCount > 0 &&
                                writing1 == true &&
                                writing2 == true &&
                                writing3 == true &&
                                writing4 == true &&
                                category != 0
                            ? () {
                                FlutterDialog(userData);
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: pictureCount > 0 &&
                                    writing1 == true &&
                                    writing2 == true &&
                                    writing3 == true &&
                                    writing4 == true &&
                                    category != 0
                                ? const Color(0xff595FFF)
                                : const Color(0xffDFE6FF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r)),
                            minimumSize: Size(320.w, 50.h)),
                        child: Text("완료",
                            style: TextStyle(
                                fontSize: 16.sp, color: Colors.white)),
                      )),
                ),
              ],
            ),
          ),
        )
        //bottomsheet
        );
  }

  List<Widget> makePictrue(BuildContext context, UserData userData) {
    List<Widget> results = [];
    for (var i = 0; i < userData.pictureList.length; i++) {
      results.add(Padding(
        padding: EdgeInsets.only(left: 5.w),
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
