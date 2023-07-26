import 'dart:io';

import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  String _accessToken = '';
  String _refreshToken = '';
  String _userImage = '';
  int _userId = 0;
  String _userName = '';
  String _useraddress = '';
  double _lat = 0;
  double _lon = 0;
  List<File> _pictureList = <File>[];
  List<String> _imageUrls = <String>[];

  String get accessToken => _accessToken;
  String get refreshToken => _refreshToken;
  String get userName => _userName;
  int get userId => _userId;
  String get userImage => _userImage;
  String get useraddress => _useraddress;
  double get lat => _lat;
  double get lon => _lon;
  List<File> get pictureList => _pictureList;
  List<String> get imageUrls => _imageUrls;

  void addPicture(File file, String url) {
    _pictureList.add(file);
    _imageUrls.add(url);
    for (int i = 0; i < _pictureList.length; i++) {
      print("$i번째 이미지 리스트 : ${_pictureList[i]}");
      print("$i번째 url 리스트 : ${_imageUrls[i]}");
    }
    notifyListeners();
  }

  void removePicture(int index) {
    _pictureList.removeAt(index);
    _imageUrls.removeAt(index);
    for (int i = 0; i < _pictureList.length; i++) {
      print("$i번째 이미지 리스트 : ${_pictureList[i]}");
      print("$i번째 url 리스트 : ${_imageUrls[i]}");
    }
    notifyListeners();
  }

  void inputUserAddress(String userAddress) {
    _useraddress = userAddress;
    notifyListeners();
  }

  void inputLocation(double lat, double lon) {
    _lat = lat;
    _lon = lon;
    notifyListeners();
  }

  void inputAccessToken(String accessToken) {
    _accessToken = accessToken;
    notifyListeners();
  }

  void inputRefreshToken(String refreshToken) {
    _refreshToken = refreshToken;
    notifyListeners();
  }

  void inputName(String userName1) {
    _userName = userName1;
    notifyListeners();
  }

  void inputId(int userId1) {
    _userId = userId1;
    notifyListeners();
  }

  void inputImage(String userImage1) {
    _userImage = userImage1;
    notifyListeners();
  }
}
