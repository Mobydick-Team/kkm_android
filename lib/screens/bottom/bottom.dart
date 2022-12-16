import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/screens/bottom/chat.dart';
import 'package:kkm/screens/bottom/home.dart';
import 'package:kkm/screens/bottom/introduce.dart';
import 'package:kkm/screens/bottom/write.dart';
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
              AnimatedBarItems(
                  icon: const Icon(
                    Icons.home_outlined,
                  ),
                  selectedIcon: const Icon(Icons.home),
                  selectedColor: Colors.black,
                  backgroundColor: Colors.black,
                  title: Text(
                    '홈',
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                  )),
              AnimatedBarItems(
                  icon: const Icon(Icons.chat_bubble_outline_outlined),
                  selectedIcon: const Icon(Icons.chat_bubble),
                  selectedColor: Colors.black,
                  backgroundColor: Colors.black,
                  title: Text(
                    '채팅',
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                  )),
              AnimatedBarItems(
                  icon: const Icon(
                    Icons.add_circle_outline,
                  ),
                  selectedIcon: const Icon(
                    Icons.add_circle,
                  ),
                  backgroundColor: Colors.black,
                  selectedColor: Colors.black,
                  title: Text(
                    '글 작성',
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                  )),
              AnimatedBarItems(
                  icon: const Icon(
                    Icons.person_outline,
                  ),
                  selectedIcon: const Icon(
                    Icons.person,
                  ),
                  backgroundColor: Colors.black,
                  selectedColor: Colors.black,
                  title: Text(
                    '내 소개',
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                  )),
            ],
            iconSize: 27.h,
            iconStyle: IconStyle.Default,
            hasNotch: true,
            // fabLocation: StylishBarFabLocation.end,
            opacity: 0.3,
            currentIndex: selected ?? 0,
            onTap: (index) {
              controller.jumpToPage(index!);
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
