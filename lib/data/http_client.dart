import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/main.dart';

void toastmessage401(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.sp);
}

void toastmessage500() {
  Fluttertoast.showToast(
      msg: "서버에 오류가 발생했습니다. 조금후에 다시 시도해주세요.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.sp);
}

Future<dynamic> sendPostRequest(
    String url, Map<String, dynamic>? body, BuildContext context) async {
  var parsingData;
  var response;
  if (body == null) {
    response = await http.post(Uri.parse(url));
    parsingData = json.decode(response.body);
  } else {
    response = await http.post(Uri.parse(url), body: body);
    parsingData = json.decode(response.body);
  }
  if (response.statusCode == 200) {
    // 응답이 성공인 경우
    return parsingData;
  } else if (response.statusCode == 401) {
    // 응답이 실패인 경우
    toastmessage401(parsingData['message']);
    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
    return null;
  } else if (response.statusCode == 500) {
    toastmessage500();
    return null;
  } else {
    toastmessage401(parsingData['message']);
    return null;
  }
}

Future<dynamic> sendGetRequest(String url, BuildContext context) async {
  var parsingData;
  var response;
  response = await http.get(Uri.parse(url));
  parsingData = json.decode(response.body);

  if (response.statusCode == 200) {
    // 응답이 성공인 경우
    return parsingData;
  } else if (response.statusCode == 401) {
    // 응답이 실패인 경우
    toastmessage401(parsingData['message']);
    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (_) => const Login()));
    return null;
  } else if (response.statusCode == 500) {
    toastmessage500();
    return null;
  } else {
    toastmessage401(parsingData['message']);
    return null;
  }
}
