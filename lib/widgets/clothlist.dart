import 'package:flutter/material.dart';
import 'package:kkm/model/clothes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/screens/detailclothes.dart';

class Clothes extends StatefulWidget {
  final List<ClothesList> clothes;
  const Clothes({super.key, required this.clothes});

  @override
  State<Clothes> createState() => _ClothListState();
}

class _ClothListState extends State<Clothes> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: makeClothes(context, widget.clothes),
    );
  }
}

List<Widget> makeClothes(BuildContext context, List<ClothesList> clothes) {
  List<Widget> results = [];
  bool odd = clothes.length % 2 == 1 ? true : false;
  for (var i = 0; i < clothes.length; i = i + 2) {
    results.add(Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 19.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const DetailClothes()));
            },
            child: SizedBox(
              width: 150.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150.w,
                    height: 190.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              clothes[i].image[0],
                            )),
                        border: Border.all(width: 0.0),
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: Stack(
                      children: [
                        clothes[i].transaction
                            ? const Text("")
                            : Container(
                                width: 150.w,
                                height: 190.h,
                                color: Colors.black.withOpacity(0.4),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "거래중",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 8.h, right: 8.w, left: 8.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 16.w, // 원의 너비
                                      height: 16.h, // 원의 높이
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              clothes[i].profileImage),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 3.h),
                                      child: Text(
                                        clothes[i].userName,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              clothes[i].isheart
                                  ? Padding(
                                      padding: EdgeInsets.only(top: 2.h),
                                      child: Icon(
                                        Icons.favorite,
                                        color: const Color(0xffEA5858),
                                        size: 13.w,
                                      ),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(top: 2.h),
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: const Color(0xffEA5858),
                                        size: 13.w,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 13.w,
                        color: const Color(0xff8E8E8E),
                      ),
                      Text(
                        clothes[i].location,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff747474)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    clothes[i].clothName,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 31.h,
                        width: 72.w,
                        color: const Color(0xffF5F5F5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "보증금",
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.black),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              "${clothes[i].deposit}원",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 31.h,
                        width: 72.w,
                        color: const Color(0xffF5F5F5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "대여비",
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.black),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "${clothes[i].rentalfee}원",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          odd
              ? //index가 홀수고
              i == clothes.length - 1
                  ? //마지막 index면
                  Text("") //출력 x
                  : InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const DetailClothes()));
                      },
                      child: SizedBox(
                        width: 150.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150.w,
                              height: 190.h,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        clothes[i + 1].image[0],
                                      )),
                                  border: Border.all(width: 0.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.r))),
                              child: Stack(
                                children: [
                                  clothes[i + 1].transaction
                                      ? const Text("")
                                      : Container(
                                          width: 150.w,
                                          height: 190.h,
                                          color: Colors.black.withOpacity(0.4),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "거래중",
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 8.h, right: 8.w, left: 8.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 16.w, // 원의 너비
                                                height: 16.h, // 원의 높이
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        clothes[i + 1]
                                                            .profileImage),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 3.h),
                                                child: Text(
                                                  clothes[i + 1].userName,
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        clothes[i + 1].isheart
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(top: 2.h),
                                                child: Icon(
                                                  Icons.favorite,
                                                  color:
                                                      const Color(0xffEA5858),
                                                  size: 13.w,
                                                ),
                                              )
                                            : Padding(
                                                padding:
                                                    EdgeInsets.only(top: 2.h),
                                                child: Icon(
                                                  Icons.favorite_border,
                                                  color:
                                                      const Color(0xffEA5858),
                                                  size: 13.w,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 13.w,
                                  color: const Color(0xff8E8E8E),
                                ),
                                Text(
                                  clothes[i + 1].location,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff747474)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              clothes[i + 1].clothName,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 31.h,
                                  width: 72.w,
                                  color: const Color(0xffF5F5F5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "보증금",
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        "${clothes[i + 1].deposit}원",
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 31.h,
                                  width: 72.w,
                                  color: const Color(0xffF5F5F5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "대여비",
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        "${clothes[i + 1].rentalfee}원",
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )

              //여기까지
              : InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DetailClothes()));
                  },
                  child: SizedBox(
                    width: 150.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150.w,
                          height: 190.h,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    clothes[i + 1].image[0],
                                  )),
                              border: Border.all(width: 0.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r))),
                          child: Stack(
                            children: [
                              clothes[i + 1].transaction
                                  ? const Text("")
                                  : Container(
                                      width: 150.w,
                                      height: 190.h,
                                      color: Colors.black.withOpacity(0.4),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "거래중",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 8.h, right: 8.w, left: 8.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 16.w, // 원의 너비
                                            height: 16.h, // 원의 높이
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    clothes[i + 1]
                                                        .profileImage),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 3.h),
                                            child: Text(
                                              clothes[i + 1].userName,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    clothes[i + 1].isheart
                                        ? Padding(
                                            padding: EdgeInsets.only(top: 2.h),
                                            child: Icon(
                                              Icons.favorite,
                                              color: const Color(0xffEA5858),
                                              size: 13.w,
                                            ),
                                          )
                                        : Padding(
                                            padding: EdgeInsets.only(top: 2.h),
                                            child: Icon(
                                              Icons.favorite_border,
                                              color: const Color(0xffEA5858),
                                              size: 13.w,
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 13.w,
                              color: const Color(0xff8E8E8E),
                            ),
                            Text(
                              clothes[i + 1].location,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff747474)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          clothes[i + 1].clothName,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 31.h,
                              width: 72.w,
                              color: const Color(0xffF5F5F5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "보증금",
                                    style: TextStyle(
                                        fontSize: 10.sp, color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    "${clothes[i + 1].deposit}원",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 31.h,
                              width: 72.w,
                              color: const Color(0xffF5F5F5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "대여비",
                                    style: TextStyle(
                                        fontSize: 10.sp, color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    "${clothes[i + 1].rentalfee}원",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
        ],
      ),
    ));
  }
  return results;
}
