import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/screens/test1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailClothes extends StatefulWidget {
  const DetailClothes({super.key});

  @override
  State<DetailClothes> createState() => _DetailClothesState();
}

class _DetailClothesState extends State<DetailClothes> {
  bool isfavorite = false;
  int i = 0;
  final controller = PageController(keepPage: true);
  final pages = List.generate(
    3,
    (index) => Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Container(
        width: double.infinity,
        height: 372.h,
        color: Colors.grey,
        child: Center(
            child: Text(
          "Page $index",
          style: const TextStyle(color: Colors.indigo),
        )),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Column(
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
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 372.h,
                          child: PageView.builder(
                            controller: controller,
                            itemCount: pages.length,
                            itemBuilder: (_, index) {
                              return pages[index % pages.length];
                            },
                          ),
                        ),
                        Positioned(
                          top: 345.h,
                          left: 109.w,
                          child: SmoothPageIndicator(
                              controller: controller,
                              count: pages.length,
                              effect: ExpandingDotsEffect(
                                  spacing: 8.0,
                                  radius: 4.0,
                                  dotWidth: 24.0,
                                  dotHeight: 16.0,
                                  strokeWidth: 1.5,
                                  dotColor: Colors.white,
                                  activeDotColor: Colors.indigo)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 12.w),
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
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 6.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "검정 싱글 크롭 자켓",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: 5.h,
                                ),
                                child: Text(
                                  "3000원",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, bottom: 5.h),
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
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          "상품 상태",
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 70.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "오염 O",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff797979)),
                          ),
                          Text(
                            "변색 X",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff797979)),
                          ),
                          Text(
                            "찢어짐 X",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff797979)),
                          ),
                          Text(
                            "구겨짐 X",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff797979)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SafeArea(
                  child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context)
                              .viewInsets
                              .bottom), //위 상태바 없애기
                      child: Container(
                        width: double.infinity,
                        height: 62.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: const Color(0xffBEBEBE), width: 1.w),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight: Radius.circular(20.r))),
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.w, right: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (isfavorite) {
                                      i--;
                                    } else {
                                      i++;
                                    }
                                    isfavorite = !isfavorite;
                                  });
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.favorite_border,
                                      size: 22.h,
                                      color: isfavorite
                                          ? const Color(0xffD34646)
                                          : Colors.black,
                                    ),
                                    Text(
                                      "$i",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: isfavorite
                                              ? const Color(0xffD34646)
                                              : Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(260.w, 37.h),
                                      backgroundColor: const Color(0xff595FFF),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.r))),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => const TestOne()));
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset("images/chat.png"),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        "대화하기",
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
