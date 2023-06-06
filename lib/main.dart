import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/model/login_platform.dart';
import 'package:kkm/provider/emphasis.dart';
import 'package:kkm/provider/user.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kkm/screens/bottom/bottom.dart';
import 'package:kkm/screens/kakaowebview.dart';

import 'package:kkm/secret/secret.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  KakaoSdk.init(nativeAppKey: Secret.nativeAppKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,  // 세로 정방향만 사용할 수 있다.
      // DeviceOrientation.portraitDown,
      // DeviceOrientation.landscapeLeft,
      // DeviceOrientation.landscapeRight,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserData()),
        ChangeNotifierProvider.value(value: Emphaisis()),
      ],
      child: ScreenUtilInit(
        //screenutil 라이브러리 (뒤에 .h, .w00, .r, .sp등등 크기를 반응형으로 만들어줌)
        designSize: const Size(360, 800), // 어떤 사이즈를 기준으로 만들것인가
        builder: (BuildContext context, Widget? child) => const MaterialApp(
            title: '꼬꼬막', debugShowCheckedModeBanner: false, home: Login()),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool success = false;
  String imageurl = "";
  String id = "";

  // ignore: prefer_final_fields
  LoginPlatform _loginPlatform = LoginPlatform.none;

  @override
  Widget build(BuildContext context) {
    var userData = Provider.of<UserData>(context);
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity.w,
              height: 259.h,
              child: Image.asset(
                "images/login.png",
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Image.asset("images/logo.png"),
            SizedBox(
              height: 61.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(320.w, 50.h),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    backgroundColor: const Color(0xffFEE500)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Webviewkakao()));
                },
                child: Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 23.w, right: 61.1.w),
                        child: Image.asset("images/kakao.png")),
                    Text(
                      "카카오로 로그인",
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 285.h,
            ),
            Text(
              "@σύστημα",
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffBEBEBE)),
            ),
          ],
        ),
      ),
    );
  }
}
