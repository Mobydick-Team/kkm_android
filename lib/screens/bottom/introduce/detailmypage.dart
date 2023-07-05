import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/provider/emphasis.dart';
import 'package:kkm/screens/profile.dart';
import 'package:kkm/widgets/anotherclothes.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailMyClothes extends StatefulWidget {
  const DetailMyClothes({super.key});

  @override
  State<DetailMyClothes> createState() => _DetailClothesState();
}

class _DetailClothesState extends State<DetailMyClothes> {
  bool isfavorite = false;
  int i = 0;

  String? selectedValue;
  final controller = PageController(keepPage: true);
  final pages = List.generate(
    3,
    (index) => Container(
      width: double.infinity,
      height: 407.h,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage("images/cat.jpg"))),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var emphaisis = Provider.of<Emphaisis>(context);
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.black,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: 903.h,
                      width: 360.w,
                      color: Colors.white,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          emphaisis.change();
                        });
                        print("클릭됨");
                      },
                      child: SizedBox(
                        height: 407.h,
                        child: PageView.builder(
                          controller: controller,
                          itemCount: pages.length,
                          itemBuilder: (_, index) {
                            return pages[index % pages.length];
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: 337.h,
                      left: 140.w,
                      child: SmoothPageIndicator(
                          controller: controller,
                          count: pages.length,
                          effect: ExpandingDotsEffect(
                              radius: 4.0,
                              dotWidth: 12.w,
                              dotHeight: 9.h,
                              strokeWidth: 1.5,
                              dotColor:
                                  const Color(0xffFFFFFF).withOpacity(0.5),
                              activeDotColor: const Color(0xffFFFFFF))),
                    ),
                    Positioned(
                      top: 12.5.h,
                      left: 22.w,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              constraints: BoxConstraints(),
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 19.h,
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "상세정보",
                            style: TextStyle(
                                fontSize: 22.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 190.w,
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              customButton: Icon(
                                Icons.more_horiz,
                                size: 18.w,
                                color: Colors.white,
                              ),
                              items: [
                                ...MenuItems.firstItems.map(
                                  (item) => DropdownMenuItem<MenuItem>(
                                    value: item,
                                    child: MenuItems.buildItem(item),
                                  ),
                                ),
                                const DropdownMenuItem<Divider>(
                                    enabled: false, child: Divider()),
                                ...MenuItems.secondItems.map(
                                  (item) => DropdownMenuItem<MenuItem>(
                                    value: item,
                                    child: MenuItems.buildItem(item),
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                MenuItems.onChanged(
                                  context,
                                  value! as MenuItem,
                                );
                              },
                              dropdownStyleData: DropdownStyleData(
                                width: 90.w,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: Colors.white.withOpacity(0.5),
                                ),
                                offset: const Offset(0, -10),
                              ),
                              menuItemStyleData: MenuItemStyleData(
                                customHeights: [
                                  ...List<double>.filled(
                                      MenuItems.firstItems.length, 30.w),
                                  0.w,
                                  ...List<double>.filled(
                                      MenuItems.secondItems.length, 30.w),
                                ],
                                padding: EdgeInsets.only(left: 20.w),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 358.h,
                        child: Container(
                          width: 360.w,
                          height: 950.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.r),
                                  topRight: Radius.circular(30.r))),
                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 17.h, left: 18.w),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              PageRouteBuilder(
                                                transitionDuration:
                                                    const Duration(
                                                        milliseconds: 400),
                                                pageBuilder: (context,
                                                        animation,
                                                        secondaryAnimation) =>
                                                    const Profile(),
                                                transitionsBuilder: (context,
                                                    animation,
                                                    secondaryAnimation,
                                                    child) {
                                                  return FadeTransition(
                                                    opacity: animation,
                                                    child: child,
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: 35.w,
                                            height: 35.h,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                    "images/cat.jpg"),
                                              ),
                                            ),
                                          ),
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.w, top: 11.5.h),
                                      child: Text(
                                        "나재민",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 22.w, top: 9.h, bottom: 15.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "검정 싱글 크롭 자켓",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.w, right: 20.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "보증금",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: const Color(0xffBDBDBD),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            "3000원",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "3일 대여료",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: const Color(0xffBDBDBD),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            "1000원",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "거래후기",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: const Color(0xffBDBDBD),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            "12건",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.w, top: 20.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "소개",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: const Color(0xffBDBDBD)),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.w, right: 20.w, top: 3.h),
                                  child: Container(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: RichText(
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 5,
                                                strutStyle:
                                                    StrutStyle(fontSize: 16.sp),
                                                text: TextSpan(
                                                  text:
                                                      '김혜린과 유나은은 바보다. 이것은 절대 부정할 수 없는 사실이다. 그 이유는 조용제가 천재이기 때문이다. 반박시 사형. 아 코로난데 슈발 게임을 못하는게 말이 되냐. 나는 우리 가족이 밉다.',
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xff212121),
                                                      height: 1.4,
                                                      fontSize: 14.5.sp),
                                                )),
                                          ),
                                        ],
                                      )),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 10.h,
                                  margin: EdgeInsets.only(top: 25.h),
                                  color: const Color(0xffEEEEEE),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 20.w, top: 28.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "사용자의 다른 게시물",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: const Color(0xffBDBDBD)),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 50.h),
                                    child: AnotherClothes()),
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                        top: 333.h,
                        left: 287.h,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isfavorite = !isfavorite;
                            });
                          },
                          child: Container(
                            height: 49.h,
                            width: 49.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  spreadRadius: 0,
                                  blurRadius: 6.0,
                                  offset: Offset(
                                      0, 5.h), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                    isfavorite
                                        ? Icons.favorite_border
                                        : Icons.favorite,
                                    size: 22.h,
                                    color: const Color(0xffD34646)),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          emphaisis.ispressed
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 372.h,
                        child: Image.asset(
                          "images/cat.jpg",
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
          emphaisis.ispressed
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Positioned(
                      top: 15.h,
                      right: 14.w,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              emphaisis.change();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0.0,
                            fixedSize: Size(50.w, 50.h),
                            shape: const CircleBorder(),
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 30.w,
                          )),
                    ),
                  ],
                )
              : Container()
          // emphaisis.ispressed
          //     ? Row(
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         children: [
          //           Positioned(
          //             top: 9.h,
          //             right: 14.w,
          //             child: IconButton(
          //                 onPressed: () {

          //                 },
          //                 icon: Icon(
          //                   Icons.clear,
          //                   size: 28.w,
          //                 )),
          //           )
          //         ],
          //       )
          //     : Container()
        ],
      ),
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.color,
  });

  final String text;
  final int color;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [first, second];
  static const List<MenuItem> secondItems = [third];
  static const first = MenuItem(text: '수정하기', color: 0xff000000);
  static const second = MenuItem(text: '공유하기', color: 0xff000000);
  static const third = MenuItem(text: '삭제하기', color: 0xffD34646);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Expanded(
          child: Text(
            item.text,
            style: TextStyle(
                color: Color(item.color),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    void FlutterDialog() {
      showDialog(
          context: context,
          //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color(0xffF5F5F5).withOpacity(0.9),
              // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              //Dialog Main Title
              title: Column(
                children: [
                  Text("정말 게시물을 삭제하시겠어요?",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xff404040),
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: 6.h),
                  Text(
                    "한 번 삭제한 게시물은 복구할 수 없습니다.",
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
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
                          backgroundColor: const Color(0xff536DFE),
                          elevation: 0.0,
                          minimumSize: Size(105.w, 36.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r))),
                      child: Text(
                        "취소",
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: Size(105.w, 36.h),
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r))),
                      child: Text(
                        "삭제",
                        style: TextStyle(
                            fontSize: 14.sp, color: const Color(0xffFF5160)),
                      ),
                      onPressed: () async {},
                    ),
                  ],
                )
              ],
            );
          });
    }

    switch (item) {
      case MenuItems.first:
        break;
      case MenuItems.second:
        //Do something
        break;
      case MenuItems.third:
        FlutterDialog();
        //Do something
        break;
    }
  }
}
