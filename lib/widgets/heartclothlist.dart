import 'package:flutter/material.dart';
import 'package:kkm/model/clothes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeartClothes extends StatefulWidget {
  const HeartClothes({super.key});

  @override
  State<HeartClothes> createState() => _HeartClothListState();
}

class _HeartClothListState extends State<HeartClothes> {
  final List<ClothesList> clothesList = <ClothesList>[];

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    print("실행됨");
    for (int i = 0; i < 9; i++) {
      clothesList.add(ClothesList(
          "메린",
          false,
          "https://movie-phinf.pstatic.net/20181213_264/1544692854634ss65r_JPEG/movie_image.jpg",
          "2000",
          "메린의 미친 옷",
          1000,
          3000,
          "부산광역시 연제구",
          false,
          false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Row(
        children: makeClothes(context, clothesList),
      ),
    );
  }
}

List<Widget> makeClothes(BuildContext context, List<ClothesList> clothes) {
  List<Widget> results = [];
  for (var i = 0; i < clothes.length; i++) {
    results.add(
      Padding(
        padding: EdgeInsets.only(right: 10.w, top: 14.h),
        child: Container(
          width: 110.w,
          height: 130.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              image: const DecorationImage(
                  image: AssetImage("images/cat.jpg"), fit: BoxFit.fill)),
          child: Padding(
            padding: EdgeInsets.only(top: 7.5.h, bottom: 3.39.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 7.w,
                    right: 7.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        clothes[i].clothName,
                        style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      // clothes[i].isheartpressed
                      //     ?
                      Icon(
                        Icons.favorite,
                        color: const Color(0xffD34646),
                        size: 13.h,
                      )
                      // : Icon(
                      //     Icons.favorite_border,
                      //     size: 13.h,
                      //     color: Colors.white,
                      //   ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 5.5.w, right: 5.5.w, bottom: 3.h),
                  child: Container(
                    height: 28.h,
                    width: 116.67.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white.withOpacity(0.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "보증금",
                              style: TextStyle(
                                fontSize: 7.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "${clothes[i].deposit}원",
                              style: TextStyle(
                                  fontSize: 8.sp, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "대여료",
                              style: TextStyle(
                                fontSize: 7.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "${clothes[i].rentalfee}원",
                              style: TextStyle(
                                  fontSize: 8.sp, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  return results;
}
