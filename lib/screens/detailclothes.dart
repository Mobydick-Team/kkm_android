import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailClothes extends StatefulWidget {
  const DetailClothes({super.key});

  @override
  State<DetailClothes> createState() => _DetailClothesState();
}

class _DetailClothesState extends State<DetailClothes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 27.h,
                        )),
                  ),
                  Text(
                    "상세정보",
                    style:
                        TextStyle(fontSize: 23.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Container(
                  width: double.infinity,
                  height: 400.h,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 7.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, right: 12.w),
                      child: Container(
                        width: 35.w,
                        height: 35.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Text(
                        "k99._.e",
                        style: TextStyle(fontSize: 14.sp, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 14.w, top: 8.h, right: 14.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "검정 싱글 크롭 자켓",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 12.h,
                          ),
                          child: Text(
                            "3000원",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 5.h),
                child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              strutStyle: StrutStyle(fontSize: 16.sp),
                              text: TextSpan(
                                text:
                                    '김혜린과 유나은은 바보다. 이것은 절대 부정할 수 없는 사실이다. 그 이유는 조용제가 천재이기 때문이다. 반박시 사형',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    height: 1.4,
                                    fontSize: 14.sp),
                              )),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 5.h,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
