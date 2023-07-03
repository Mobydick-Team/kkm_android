import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/widgets/clothlist.dart';
import 'package:kkm/widgets/myclotheslist.dart';

class ZaamClothes extends StatefulWidget {
  const ZaamClothes({super.key});

  @override
  State<ZaamClothes> createState() => _MyClohtesState();
}

class _MyClohtesState extends State<ZaamClothes> {
  ScrollController scrollController = ScrollController();
  bool showbtn = false;

  @override
  void initState() {
    scrollController.addListener(() {
      //scroll listener
      double showoffset =
          85.h; //Back to top botton will show on scroll offset 10.0

      if (scrollController.offset > showoffset) {
        showbtn = true;
        setState(() {
          //update state
        });
      } else {
        showbtn = false;
        setState(() {
          //update state
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 35.w,
        title: Text(
          "쨈한 게시물",
          style: TextStyle(
              fontSize: 22.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0.0,
        leading: Padding(
          padding: EdgeInsets.only(left: 13.w),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 21.w,
                color: Colors.black,
              )),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        controller: scrollController,
        child: const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [MyClothesList()],
          ),
        ),
      )),
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 0), //show/hide animation
        opacity: showbtn ? 1.0 : 0.0, //set obacity to 1 on visible, or hide
        child: Container(
          height: 55.h,
          width: 55.w,
          child: FittedBox(
            child: FloatingActionButton(
                elevation: 10.0,
                onPressed: () {
                  scrollController.animateTo(
                      //go to top of scroll
                      0.0,
                      duration: const Duration(
                          milliseconds: 450), //duration of scroll
                      curve: Curves.fastOutSlowIn //scroll type
                      );
                },
                child: Icon(
                  Icons.keyboard_arrow_up,
                  size: 30.w,
                  color: Colors.black,
                ),
                backgroundColor: Colors.white.withOpacity(0.79)),
          ),
        ),
      ),
    );
  }
}
