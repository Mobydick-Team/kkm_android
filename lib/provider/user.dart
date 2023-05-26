import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  String _accessToekn = '';
  String _userImage = '';
  String _userId = '';
  String _userName = '';
  String _useraddress = '';

  String get accessToken => _accessToekn;
  String get userName => _userName;
  String get userId => _userId;
  String get userImage => _userImage;
  String get useraddress => _useraddress;

  void inputUserAddress(String userAddress) {
    _useraddress = userAddress;
  }

  void inputAccessToken(String accessToken) {
    _accessToekn = accessToken;
    notifyListeners();
  }

  void inputName(String userName1) {
    _userName = userName1;
    notifyListeners();
  }

  void inputId(String userId1) {
    _userId = userId1;
    notifyListeners();
  }

  void inputImage(String userImage1) {
    _userImage = userImage1;
    notifyListeners();
  }
}
