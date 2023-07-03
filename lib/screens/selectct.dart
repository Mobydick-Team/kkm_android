import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  List<String> clothesName = [
    '상의',
    '스커트',
    '하의',
    '원피스',
    '액세서리',
    '신발',
    '패션소품',
    '가방',
    '기타'
  ];
  List<String> imagesPath = [
    'images/category/1.png',
    'images/category/2.png',
    'images/category/3.png',
    'images/category/4.png',
    'images/category/5.png',
    'images/category/6.png',
    'images/category/7.png',
    'images/category/8.png',
    'images/category/9.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 22.h,
            color: Colors.black,
          ),
        ),
        title: Text(
          "카테고리 선택",
          style: TextStyle(
              fontSize: 22.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: [
            for (int i = 0; i < 8; i++)
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                  width: double.infinity,
                  height: 56.h,
                  padding: EdgeInsets.only(left: 20.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(imagesPath[i]),
                      SizedBox(
                        width: 18.w,
                      ),
                      Text(
                        clothesName[i],
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: const Color(0xff262626),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
