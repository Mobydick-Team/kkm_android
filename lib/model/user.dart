import 'package:kkm/model/clothes.dart';

class User {
  String profileImage;
  String name;
  int change;
  int writing;
  int km;
  bool ischanged;
  List<ClothesList> clothesList = <ClothesList>[];
  User(this.profileImage, this.name, this.change, this.writing, this.km,
      this.ischanged, this.clothesList);
}
