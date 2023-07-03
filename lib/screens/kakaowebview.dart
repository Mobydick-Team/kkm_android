import 'package:flutter/material.dart';
import 'package:kkm/data/http_client.dart';
import 'package:kkm/provider/user.dart';
import 'package:kkm/screens/bottom/bottom.dart';
import 'package:kkm/screens/signup/name.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Webviewkakao extends StatefulWidget {
  const Webviewkakao({Key? key}) : super(key: key);

  @override
  State<Webviewkakao> createState() => _WebviewState();
}

class _WebviewState extends State<Webviewkakao> {
  bool close = false;
  bool postend = false;
  String code = "";
  String url = "https://bgit.bssm.kro.kr/oauth/bsm";
  String accessToken = "";
  var userData;

  WebViewController? _webViewController;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      userData = Provider.of<UserData>(context, listen: false);
    });
    _webViewController = WebViewController()
      ..loadRequest(Uri.parse(
          'https://kauth.kakao.com/oauth/authorize?client_id=9240bec26b639066d5ac5afdbaeb6bb0&redirect_uri=http://localhost:3000/auth/kakao/callback&response_type=code'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
          NavigationDelegate(onNavigationRequest: (NavigationRequest request) {
        if (request.url.contains("?code=")) {
          print(request.url);
          setState(() {
            code = request.url.split("?code=")[1];
          });
          getrequest(userData, code);
          return NavigationDecision.prevent;
        } else if (request.url.contains(url)) {}

        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      }));

    // _webViewController = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setBackgroundColor(const Color(0x00000000))
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onProgress: (int progress) {
    //         // Update loading bar.
    //       },
    //       onPageStarted: (String url) {},
    //       onPageFinished: (String url) {},
    //       onWebResourceError: (WebResourceError error) {},

    //     ),
    //   )
    //   ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  void errormessage(var error) {
    Fluttertoast.showToast(
        msg: "카카오톡으로 로그인 실패 $error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  void successmessage() {
    Fluttertoast.showToast(
        msg: "환영합니다!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.sp);
  }

  void getrequest(var userdata, String code) async {
    try {
      String url = 'http://43.200.19.51:3034/auth/kakao/info?code=$code';
      var parsingData = await sendGetRequest(url, context);
      print(parsingData);
      if (parsingData != null) {
        if (parsingData['signedUp'] != true) {
          userdata.inputId(parsingData['kakaoUserInfoResponse']['id']);
          // ignore: use_build_context_synchronously
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const Name()));
        } else {
          userdata.inputId(parsingData['kakaoUserInfoResponse']['id']);
          // ignore: use_build_context_synchronously
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const Bottombar()));
          successmessage();
        }
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _webViewController!),
      // WebView(
      //   initialUrl:
      //       'https://kauth.kakao.com/oauth/authorize?client_id=9240bec26b639066d5ac5afdbaeb6bb0&redirect_uri=http://localhost:3000/auth/kakao/callback&response_type=code',
      //   javascriptMode: JavascriptMode.unrestricted,
      //   navigationDelegate: (NavigationRequest request) {
      //     if (request.url.contains("?code=")) {
      //       setState(() {
      //         code = request.url.split("?code=")[1];
      //       });

      //       // do not navigate
      //       return NavigationDecision.prevent;
      //     } else if (request.url.contains(url)) {}

      //     return NavigationDecision.navigate;
      //   },
      //   onWebViewCreated: (WebViewController webViewController) {
      //     _controller.complete(webViewController);
      //   },
      // ),
    );
  }
}
