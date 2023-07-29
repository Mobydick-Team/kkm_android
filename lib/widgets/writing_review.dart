import 'package:flutter/material.dart';
import 'package:kkm/model/writingreview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/screens/bottom/introduce/write.dart';

class WritingReviews extends StatefulWidget {
  const WritingReviews({super.key});

  @override
  State<WritingReviews> createState() => _WirintingReviewState();
}

class _WirintingReviewState extends State<WritingReviews> {
  final List<WritingReview> reviews = <WritingReview>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 4; i++) {
      reviews.add(WritingReview(
          "images/cat.jpg", "images/cat.jfif", "언더아머 바람막이", "이쁘나은", 9000));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: makeReviews(context, reviews));
  }
}

List<Widget> makeReviews(BuildContext context, List<WritingReview> reviews) {
  List<Widget> results = [];
  for (var i = 0; i < reviews.length; i++) {
    results.add(Container(
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2.w, color: const Color(0xffF5F5F5)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70.w,
            height: 74.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                image: DecorationImage(
                  image: AssetImage(
                    reviews[i].clothImage,
                  ),
                  fit: BoxFit.fill,
                )),
          ),
          SizedBox(
            width: 9.w,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 19.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(reviews[i].userImage),
                            fit: BoxFit.fill),
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      reviews[i].userName,
                      style: TextStyle(
                          fontSize: 13.sp, color: const Color(0xff757575)),
                    )
                  ],
                ),
                Text(
                  reviews[i].clothName,
                  style: TextStyle(fontSize: 13.sp, color: Colors.black),
                ),
                Container(
                  width: 114.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: const Color(0xffF5F5F5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "최종 금액",
                        style: TextStyle(fontSize: 10.sp, color: Colors.black),
                      ),
                      SizedBox(
                        width: 14.w,
                      ),
                      Text(
                        "${reviews[i].clothprice}원",
                        style: TextStyle(fontSize: 13.sp, color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 66.w,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Write()));
            },
            child: Text(
              "후기 작성",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xff3D5AFE),
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    ));
  }
  return results;
}
