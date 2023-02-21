import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailChatting extends StatefulWidget {
  const DetailChatting({super.key});

  @override
  State<DetailChatting> createState() => _DetailChattingState();
}

class _DetailChattingState extends State<DetailChatting> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        endDrawer: SizedBox(
            width: double.infinity,
            child: Drawer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 6.h, left: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 21.w,
                              color: Colors.black,
                            )),
                        Text(
                          "상세정보",
                          style:
                              TextStyle(fontSize: 22.sp, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                    ],
                  )
                ],
              ),
            )),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 35.w,
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
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 37.w,
                    height: 40.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child: Image.network(
                        "https://user-images.githubusercontent.com/89582664/211428663-3d57f82b-5ee3-4cc7-be21-f6be99d37caa.png",
                        fit: BoxFit.fill,
                      ), // Text(key['title']),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "qkqh.h",
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  size: 25.w,
                  color: Colors.black,
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Scaffold.of(context).openEndDrawer();

                  FocusScope.of(context).unfocus();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ],
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Column(children: const [
            SizedBox(
              height: 50,
            ),
            Text("채팅창이 곧 생길 예정")
          ]),
        )),
        bottomSheet: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom), //위 상태바 없애기
              child: Container(
                height: 55.h,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, bottom: 12.h, top: 4.h),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(color: Colors.black, fontSize: 16.sp),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        contentPadding: EdgeInsets.only(left: 16.w),
                        filled: true,
                        suffixIcon: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.control_point,
                            color: Colors.black,
                            size: 23.75.w,
                          ),
                        ),
                        fillColor: Colors.white70),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
