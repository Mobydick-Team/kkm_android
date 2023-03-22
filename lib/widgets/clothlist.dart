import 'package:flutter/material.dart';
import 'package:kkm/model/clothes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/model/selection.dart';
import 'package:kkm/screens/detailclothes.dart';

class Clothes extends StatefulWidget {
  const Clothes({super.key});

  @override
  State<Clothes> createState() => _ClothListState();
}

class _ClothListState extends State<Clothes> {
  final List<ClothesList> clothesList = <ClothesList>[];
  final List<Selection> selection = <Selection>[];
  final List<String> _values = [
    "전체",
    "상의",
    "스커트",
    "하의",
    "원피스",
    "가방",
    "패션용품",
    "신발",
    "액세서리",
    "기타"
  ];

  @override
  void initState() {
    for (int i = 0; i < 9; i++) {
      clothesList.add(ClothesList(
          "메린",
          100 + i,
          "https://movie-phinf.pstatic.net/20181213_264/1544692854634ss65r_JPEG/movie_image.jpg",
          "2000",
          "메린의 미친 옷"));
      print("추가되는중");
    }
    for (int i = 0; i < _values.length; i++) {
      selection.add(Selection(_values[i], i == 0 ? true : false));
      print("추가되는중 2222");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: makeClothes(context, clothesList),
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
              height: 250.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150.w,
                    height: 190.h,
                    padding: EdgeInsets.only(top: 8.h, left: 8.w, right: 8.w),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(width: 0.0),
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                              size: 15.h,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              clothes[i].userName,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: Icon(
                                Icons.favorite,
                                color: const Color(0xffD34646),
                                size: 15.h,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 3.h),
                              child: Text(
                                "${clothes[i].heart}",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${clothes[i].price}원",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Text(
                    clothes[i].clothName,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
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
                      onTap: () {},
                      child: SizedBox(
                        width: 150.w,
                        height: 250.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150.w,
                              height: 190.h,
                              padding: EdgeInsets.only(
                                  top: 8.h, left: 8.w, right: 8.w),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(width: 0.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.r))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.account_circle,
                                        size: 15.h,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        clothes[i + 1].userName,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.h),
                                        child: Icon(
                                          Icons.favorite,
                                          color: const Color(0xffD34646),
                                          size: 15.h,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3.h),
                                        child: Text(
                                          "${clothes[i + 1].heart}",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "${clothes[i + 1].price}원",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            Text(
                              clothes[i + 1].clothName,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    )
              : InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: 150.w,
                    height: 250.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150.w,
                          height: 190.h,
                          padding:
                              EdgeInsets.only(top: 8.h, left: 8.w, right: 8.w),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(width: 0.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.account_circle,
                                    size: 15.h,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    clothes[i + 1].userName,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.h),
                                    child: Icon(
                                      Icons.favorite,
                                      color: const Color(0xffD34646),
                                      size: 15.h,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 3.h),
                                    child: Text(
                                      "${clothes[i + 1].heart}",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "${clothes[i + 1].price}원",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Text(
                          clothes[i + 1].clothName,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                )
        ],
      ),
    ));
  }
  return results;
}

