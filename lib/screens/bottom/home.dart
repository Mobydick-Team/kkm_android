import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/model/clothes.dart';
import 'package:kkm/widgets/clothlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: null,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 43.h),
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: const Color(0xffE9E9EA),
                        border: Border.all(
                          color: const Color(0xffE9E9EA),
                          width: 2.0.w,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(13.r))),
                    child: TextField(
                      controller: _searchController,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 16.w,
                              top: _searchController.text == "" ? 2.h : 3.h),
                          hintText: '이주의 핫 아이템 2000원에 입어보기',
                          hintStyle: TextStyle(
                              fontSize: 14.sp, color: const Color(0xff8E8E8F)),
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              setState(() {
                                _searchController.clear();
                                FocusScope.of(context).unfocus();
                              });
                            },
                            icon: Icon(Icons.search,
                                size: 22.h, color: const Color(0xff8E8E8E)),
                          )),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 25.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "최근 ",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "신성동 1가",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                const Clothes()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
