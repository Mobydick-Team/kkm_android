import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/screens/name.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return ScreenUtilInit(
      //screenutil 라이브러리 (뒤에 .h, .w, .r, .sp등등 크기를 반응형으로 만들어줌)
      designSize: const Size(360, 800), // 어떤 사이즈를 기준으로 만들것인가
      builder: (BuildContext context, Widget? child) => const MaterialApp(
          title: 'Welcome',
          debugShowCheckedModeBanner: false,
          home: Login() // widget/bottombar.dart 코드
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
  @override
  Widget build(BuildContext context) {
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
                fit: BoxFit.cover,
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
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const Name()));
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
            )
          ],
        ),
      ),
    );
  }
}
