import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  PageController controller = PageController();
  int select = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 35.w,
        title: Text(
          "거래 내역",
          style: TextStyle(
              fontSize: 22.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500),
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
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          select = 0;
                        });
                      },
                      child: SizedBox(
                        height: 34.h,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "거래 중",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xff262626),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          select = 1;
                        });
                      },
                      child: SizedBox(
                        height: 34.h,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "거래 완료",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xff262626),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AnimatedPadding(
                    padding: EdgeInsets.only(
                        left: select == 0
                            ? 0.w
                            : MediaQuery.of(context).size.width / 2,
                        right: select == 0
                            ? MediaQuery.of(context).size.width / 2
                            : 0.w),
                    duration: const Duration(milliseconds: 100),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 2.h,
                      color: const Color(0xff262626),
                    ),
                  )
                ],
              )
              // PageView(
              //   controller: controller,
              //   onPageChanged: ((value) {
              //     if (value == 0) {
              //       setState(() {
              //         select = 0;
              //       });
              //     } else {
              //       setState(() {
              //         select = 1;
              //       });
              //     }
              //   }),
              //   children: const [

              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
