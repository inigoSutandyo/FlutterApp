import 'package:flutter_app/model/review.dart';

class Menu{
  String url;
  String name;
  String desc;
  int price;
  List<Review> rev = [];

  Menu(this.url,this.name,this.desc,this.price,this.rev);
}