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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        iconSize: 20.h,
                        icon: const Icon(Icons.menu),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        height: 50.h,
                        width: 287.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: const Color(0xffE9E9EA),
                            border: Border.all(
                              color: const Color(0xffE9E9EA),
                              width: 2.0.w,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.r))),
                        child: TextField(
                          controller: _searchController,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  bottom: 12.h, left: 16.w, top: 10.h

                                  // top: _searchController.text == "" ? 8.h : 8.h
                                  ),
                              hintText: '????????? ??? ????????? 2000?????? ????????????',
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xff8E8E8F)),
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 25.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "?????? ",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        "????????? 1???",
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
