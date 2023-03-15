import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/screens/bottom/chat.dart';
import 'package:kkm/screens/bottom/home.dart';
import 'package:kkm/screens/bottom/introduce.dart';
import 'package:kkm/screens/bottom/write.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _HomePageState();
}

class _HomePageState extends State<Bottombar> {
  final TextEditingController _searchController = TextEditingController();
  dynamic selected;
  var heart = false;
  PageController controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        //바텀바 코드
        
        length: 4,
        child: Scaffold(
          extendBody: true,
          bottomNavigationBar: StylishBottomBar(
            items: [
              BottomBarItem(
                  selectedColor: Colors.black,
                  backgroundColor: Colors.black,
                  icon: Icon(
                    Icons.home_outlined,
                    size: 23.h,
                  ),
                  selectedIcon: Icon(
                    Icons.home,
                    size: 23.h,
                  ),
                  title: Text(
                    '홈',
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                  )),
              BottomBarItem(
                  icon: Icon(
                    Icons.chat_bubble_outline_outlined,
                    size: 23.h,
                  ),
                  selectedIcon: Icon(
                    Icons.chat_bubble,
                    size: 23.h,
                  ),
                  selectedColor: Colors.black,
                  backgroundColor: Colors.black,
                  title: Text(
                    '채팅',
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                  )),
              BottomBarItem(
                  icon: Icon(
                    Icons.add_circle_outline,
                    size: 23.h,
                  ),
                  selectedIcon: Icon(
                    Icons.add_circle,
                    size: 23.h,
                  ),
                  backgroundColor: Colors.black,
                  selectedColor: Colors.black,
                  title: Text(
                    '글 작성',
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                  )),
              BottomBarItem(
                  icon: Icon(
                    Icons.person_outline,
                    size: 23.h,
                  ),
                  selectedIcon: Icon(
                    Icons.person,
                    size: 23.h,
                  ),
                  backgroundColor: Colors.black,
                  selectedColor: Colors.black,
                  title: Text(
                    '내 소개',
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                  )),
            ],
            option: AnimatedBarOptions(
              iconSize: 23.h,
              barAnimation: BarAnimation.fade,
              iconStyle: IconStyle.Default,
              opacity: 0.3,
            ),
            currentIndex: selected ?? 0,
            hasNotch: true,
            onTap: (index) {
              controller.jumpToPage(index);
              setState(() {
                selected = index;
              });
            },
          ),
          body: SafeArea(
            child: PageView(
              controller: controller,
              onPageChanged: ((value) {
                if (value == 0) {
                  setState(() {
                    selected = 0;
                  });
                } else if (value == 1) {
                  setState(() {
                    selected = 1;
                  });
                } else if (value == 2) {
                  setState(() {
                    selected = 2;
                  });
                } else {
                  setState(() {
                    selected = 3;
                  });
                }
              }),
              children: const [Home(), Chat(), Write(), Introduce()],
            ),
          ),
        ));
  }
}
