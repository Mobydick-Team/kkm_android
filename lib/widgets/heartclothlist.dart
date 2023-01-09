import 'package:flutter/material.dart';
import 'package:kkm/model/clothes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/screens/detailclothes.dart';

class HeartClothes extends StatefulWidget {
  const HeartClothes({super.key});

  @override
  State<HeartClothes> createState() => _HeartClothListState();
}

class _HeartClothListState extends State<HeartClothes> {
  final List<ClothesList> clothesList = <ClothesList>[];

  @override
  void initState() {
    // TODO: implement initState
    print("실행됨");
    for (int i = 0; i < 9; i++) {
      clothesList.add(ClothesList(
          "메린",
          100 + i,
          "https://movie-phinf.pstatic.net/20181213_264/1544692854634ss65r_JPEG/movie_image.jpg",
          "2000",
          "메린의 미친 옷"));
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
    results.add(Padding(
      padding: EdgeInsets.only(top: 14.h, right: 10.w),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InkWell(
          onTap: () {},
          child: SizedBox(
            width: 96.w,
            // height: 128.h,
            height: 136.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 96.w,
                  height: 96.h,
                  padding: EdgeInsets.only(top: 8.h, right: 8.w),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.r))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Image.asset("images/whiteheart.png")],
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  clothes[i].clothName,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Text(
                  "${clothes[i].price}원",
                  style: TextStyle(
                      fontSize: 10.sp, color: const Color(0xff797979)),
                ),
              ],
            ),
          ),
        ),
      ]),
    ));
  }
  return results;
}
