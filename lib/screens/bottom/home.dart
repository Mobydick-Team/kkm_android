import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/data/http_client.dart';
import 'package:kkm/model/clothes.dart';
import 'package:kkm/model/selection.dart';
import 'package:kkm/provider/user.dart';
import 'package:kkm/widgets/clothlist.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:kkm/widgets/selection.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  double _value = 40.0;
  int _index = 0;

  // ignore: prefer_final_fields
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  ScrollController scrollController = ScrollController();
  bool showbtn = false;

  final List<ClothesList> clothesList = <ClothesList>[];

  int i = 1;

  bool isLoading = true;

  var userData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      userData = Provider.of<UserData>(context, listen: false);
    });
    scrollController.addListener(() {
      //scroll listener
      double showoffset =
          85.h; //Back to top button will show on scroll offset 10.0

      if (scrollController.offset > showoffset) {
        showbtn = true;
      } else {
        showbtn = false;
      }
      setState(() {
        //update state
      });
    });
    setState(() {
      isLoading = true;
    });
    _initializeData(); // Move getrequest logic to a separate method
  }

  Future<void> _initializeData() async {
    userData = Provider.of<UserData>(context, listen: false);
    await getrequest(userData, context);
  }

  Future<void> getrequest(UserData userData, BuildContext context) async {
    String url =
        'http://43.200.19.51:3034/post/list?page=$i&size=15&category=ALL&distance=100';

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer ${userData.accessToken}",
    };
    var parsingData = await sendGetRequest(url, header, context);

    if (parsingData != null) {
      if (parsingData is String) {
        // clothesList.add(ClothesList(userName, isheartpressed, image, price, clothName, deposit, rentalfee, location, transaction, isheart));
        // ignore: avoid_print
        print('연동에 성공했어요!');
        setState(() {
          isLoading = false;
        });
        // ignore: use_build_context_synchronously
      } else {}
    } else {
      print("오류 발생");
    }
  }

  void _onRefresh() async {
    await Future.delayed(
        const Duration(milliseconds: 1000)); //1초를 기다린 후 새로고침한다.
    //이 부분에 새로고침 시 불러올 기능을 구현한다.
    _refreshController.refreshCompleted();
  }

  //무한 스크롤
  void _onLoading() async {
    await Future.delayed(
        Duration(milliseconds: 1000)); //1초를 기다린 후 새로운 데이터를 불러온다.
    //이부분에 데이터를 계속 불러오는 기능을 구현한다.
    //리스트뷰를 사용한다면 간단한 예로 list.add를 이용하여 데이터를 추가시켜준다.
    _refreshController.loadComplete();
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
        body: SafeArea(
          child: SmartRefresher(
            enablePullDown: true, // 아래로 당겨서 새로고침 할 수 있게 할건지의 유무를 결정
            enablePullUp: true,
            controller: _refreshController,
            onRefresh: _onRefresh, // 새로고침을 구현한 함수
            onLoading: _onLoading,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 12.h),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          color: const Color(0xffE9E9EA),
                        ),
                        child: TextField(
                          controller: _searchController,
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: '이주의 핫 아이템 2000원에 입어보기',
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xff8E8E8F),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 8.w, right: 0, top: 0, bottom: 0),
                            suffixIcon: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                setState(() {
                                  _searchController.clear();
                                  FocusScope.of(context).unfocus();
                                });
                              },
                              icon: Icon(
                                Icons.search,
                                size: 22.h,
                                color: const Color(0xff8E8E8E),
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.h,
                      ),
                      child: ExpansionTileCard(
                        contentPadding:
                            EdgeInsets.only(left: 20.w, right: 20.w),
                        baseColor: Colors.white,
                        title: Row(
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
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 20.w, right: 20.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "현재 위치에서 2500m의 게시물만 보여요",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xff9E9E9E)),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  width: 320.w,
                                  child: SfSlider(
                                    min: 0,
                                    max: 2500,
                                    value: _value,
                                    interval: 833.33333,
                                    tooltipTextFormatterCallback:
                                        (actualValue, formattedText) {
                                      final int intValue = actualValue.toInt();
                                      return '$intValue';
                                    },
                                    enableTooltip: true,
                                    showTicks: true,
                                    activeColor: const Color(0xff555FFF),
                                    inactiveColor: const Color(0xffEEEEEE),
                                    stepSize: 100,
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        _value = value;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
                      child: Container(
                          height: 97.h,
                          decoration: BoxDecoration(
                              color: const Color(0xffF4F7FC),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 17.w,
                              right: 17.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "아직도 ",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color:
                                                      const Color(0xff000000),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "패스트패션",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color:
                                                      const Color(0xff304FFE),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "이 뭔지",
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color:
                                                      const Color(0xff000000),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "모른다고?",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: const Color(0xff000000),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    Text(
                                      "👉 사회 이슈 파악하고 꼬막 받자!",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                Image.asset("images/main1.png"),
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, top: 17.h, bottom: 5.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "나은님 근처 사용자들의",
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "게시물",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xff304FFE)),
                              ),
                              Text("입니다!",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SelectionWidget(),
                    isLoading
                        ? const Clothes()
                        : Padding(
                            padding: EdgeInsets.only(top: 25.h),
                            child: SizedBox(
                              width: 25.w,
                              height: 25.h,
                              child: const CircularProgressIndicator(
                                color: Color(0xff304FFE),
                              ),
                            ))
                  ],
                ),
              ),
            ),
          ),
        ),
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
      ),
    );
  }
}
