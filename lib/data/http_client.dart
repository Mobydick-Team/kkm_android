import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kkm/provider/user.dart';
import 'package:kkm/util/toast.dart';
import 'package:provider/provider.dart';

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
  showToast("서버에 오류가 발생했습니다. 조금후에 다시 시도해주세요.");
}

Future<dynamic> sendPostRequest(
    String url, Map<String, dynamic>? body, BuildContext context) async {
  var userData = Provider.of<UserData>(context, listen: false);

  http.Response response;
  if (body == null) {
    response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  } else {
    response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  final parsingdata = jsonDecode(utf8.decode(response.bodyBytes));
  if (response.statusCode == 200) {
    return parsingdata;
  } else if (response.statusCode == 403) {
    print("403이 시작됨");
    if (body == null) {
      response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'HAIRSHEET-TOKEN': userData.accessToken,
        },
      );
    } else {
      response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'HAIRSHEET-TOKEN': userData.accessToken,
        },
      );
    }

    final parsingdata = jsonDecode(utf8.decode(response.bodyBytes));
    print(parsingdata);
    if (response.statusCode == 200) {
      return parsingdata;
    } else if (response.statusCode == 403) {
      print(parsingdata);

      return null;
    } else if (response.statusCode == 404) {
      print(parsingdata);
      return null;
    } else if (response.statusCode == 409) {
      print(parsingdata);
      return null;
    } else {
      print(parsingdata);
      toastmessage500();
      return null;
    }
  } else if (response.statusCode == 403) {
    print(parsingdata);
    return null;
  } else if (response.statusCode == 404) {
    print(parsingdata);
    return null;
  } else if (response.statusCode == 409) {
    print(parsingdata);
    return null;
  } else {
    print(parsingdata);
    toastmessage500();
    return null;
  }
}

Future<dynamic> sendGetRequest(
    String url, Map<String, String>? header, BuildContext context) async {
  var response;

  if (header == null) {
    response = await http.get(Uri.parse(url));
  } else {
    response = await http.get(Uri.parse(url), headers: header);
  }
  final parsingdata = jsonDecode(utf8.decode(response.bodyBytes));

  print(response.statusCode);
  if (response.statusCode == 200) {
    // 응답이 성공인 경우
    print(parsingdata);
    return parsingdata;
  } else if (response.statusCode == 401) {
    print("401입니다");
    print(parsingdata);

    return null;
  } else if (response.statusCode == 403) {
    print(parsingdata);
    return null;
  } else if (response.statusCode == 404) {
    print(parsingdata);
    return null;
  } else if (response.statusCode == 409) {
    print(parsingdata);
    return null;
  } else {
    print(parsingdata);
    toastmessage500();
    return null;
  }
}
