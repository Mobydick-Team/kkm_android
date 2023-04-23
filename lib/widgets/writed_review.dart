import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/model/writedreview.dart';

class WritedReviews extends StatefulWidget {
  const WritedReviews({super.key});

  @override
  State<WritedReviews> createState() => _WritedReviewState();
}

class _WritedReviewState extends State<WritedReviews> {
  final List<WritedReview> reviews = <WritedReview>[];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 4; i++) {
      reviews.add(WritedReview(
          "images/cat.jpg",
          "images/cat.jfif",
          "언더아머 바람막이",
          "이쁘나은",
          "현재 시각 새벽 1시.. 아 슈방 자고싶다. 으아아아. 하지만 이걸 안하면 내 인생은 망해. 또 뭐라 적지. 대충 3줄 채워야 하는데. 나는 낭만 고양이~ 슬픈 도시를~~",
          i % 2 == 0 ? true : false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: makeReviews(context, reviews),
    );
  }
}

List<Widget> makeReviews(BuildContext context, List<WritedReview> reviews) {
  List<Widget> results = [];
  for (var i = 0; i < reviews.length; i++) {
    results.add(Container(
      width: double.infinity,
      height: 180.h,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2.w, color: const Color(0xffF5F5F5)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 49.w,
                height: 49.h,
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
                width: 8.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 18.h,
                        width: 19.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(reviews[i].userImage),
                              fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "이쁘나은",
                        style: TextStyle(
                            fontSize: 13.sp, color: const Color(0xff757575)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "언더아머 바람막이",
                    style: TextStyle(fontSize: 13.sp, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                width: 115.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: Image.asset(
                      reviews[i].iskkm ? "images/yes.png" : "images/no.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    reviews[i].iskkm ? "있꼬막" : "없꼬막",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xff304FFE),
                        fontWeight: FontWeight.w500),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
            child: Container(
                width: double.infinity,
                height: 75.h,
                padding: EdgeInsets.only(
                    left: 14.5.w, right: 14.5.w, top: 10.h, bottom: 10.h),
                decoration: BoxDecoration(
                  color: const Color(0xffEEF1FF),
                  borderRadius: BorderRadius.circular(
                    6.r,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          strutStyle: StrutStyle(fontSize: 12.sp),
                          text: TextSpan(
                            text: reviews[i].review,
                            style: TextStyle(
                                color: const Color(0xff424242),
                                height: 1.4,
                                fontSize: 12.sp),
                          )),
                    ),
                  ],
                )),
          ),
        ],
      ),
    ));
  }
  return results;
}
