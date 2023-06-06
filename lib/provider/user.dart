import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  String _accessToken = '';
  String _userImage = '';
  int _userId = 0;
  String _userName = '';
  String _useraddress = '';
  double _lat = 0;
  double _lon = 0;

  String get accessToken => _accessToken;
  String get userName => _userName;
  int get userId => _userId;
  String get userImage => _userImage;
  String get useraddress => _useraddress;
  double get lat => _lat;
  double get lon => _lon;

  void inputUserAddress(String userAddress) {
    _useraddress = userAddress;
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
