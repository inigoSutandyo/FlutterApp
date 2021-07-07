import 'package:flutter_app/model/menu.dart';
import 'package:flutter_app/model/review.dart';

List<Review> _rev = [];

var carousel = [
  Menu('1.jpg', 'Green Tea','People\'s Favourite',3000,_rev),
  Menu('2.jpg', 'Black Tea','Our Recommendation', 2000,_rev),
  Menu('3.jpg', 'Cookies', 'New Arrival', 50000,_rev),
];


var menuItems = [
  
  Menu('1.jpg', 'Green Tea','Made from top quality leaves and processed with care.',14000,_rev1),
  Menu('2.jpg', 'Black Tea','Our most recommended product to tea lovers.', 14000,_rev2),
  Menu('3.jpg', 'Cookies', 'Freshly baked cookies, we recommend you to enjoy it together with tea/coffee.', 10000,_rev3),
  Menu('4.jpg', 'Jasmine Tea', 'One of the classics, recommended to first timers.', 7000,_rev4),
  Menu('5.jpg', 'Black Coffee', 'Our Coffee is made with local beans and is one of the most popular products.', 8000,_rev5),
];

List<Review> _rev1 = [];
List<Review> _rev2 = [];
List<Review> _rev3 = [];
List<Review> _rev4 = [];
List<Review> _rev5 = [];


var reviewLists = [ 
   _rev1,
   _rev2,
   _rev3,
   _rev4,
   _rev5,
];
