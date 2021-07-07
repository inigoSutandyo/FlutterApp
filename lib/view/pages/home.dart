import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/menu.dart';
import 'package:flutter_app/view/pages/item.dart';
import 'package:flutter_app/view/pages/login.dart';
import 'package:flutter_app/util/utilities.dart' as utils;
import 'package:flutter_app/util/config.dart' as globals;

class HomePage extends StatefulWidget {
  final String username;

  HomePage(this.username);


  @override
  State<StatefulWidget> createState() {
    return HomePageState(username);
  }
}

class HomePageState extends State<HomePage> {
  
  final String username;

  HomePageState(this.username);

  Widget _buildCarousel(Menu m) {
    return ListView(
      children: [
        Container(
          constraints: BoxConstraints(
              minHeight: 100,
              minWidth: 300,
              maxHeight: 150,
              maxWidth: 300,
          ),
          child:  Image.asset('assets/${m.url}',fit: BoxFit.cover),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          child:  Text(
            '${m.desc}',
            style: TextStyle(
                color: Colors.teal,
                fontSize: 20,
            )
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 5),
          child:  Text(
            '${m.name}',
            style: TextStyle(
                fontSize: 15,
            )
          ),
        )
      ],
    );
  }
 
  @override
  Widget build(BuildContext context) {
    
    void _logOut() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) {
        return LoginPage();
      }));
      
    }

    void _goToItem() {
      Navigator.push(context, MaterialPageRoute(builder: (builder) {
        return ItemPage(username);
      }));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
         actions: [
            PopupMenuButton(itemBuilder: (context) {
                return ['Toggle Theme'].map((e) {
                  return PopupMenuItem(
                    child: TextButton(
                      child: Text(e),
                      onPressed: () {
                        setState((){
                          globals.currentTheme.switchTheme();
                        });
                      },
                    )
                    
                  );
                }).toList();
              }
            )
          ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Card(
               child: ListTile(
                leading: Icon(Icons.perm_identity_rounded),
                title: Text(username),
                
              ),
            ),
            ListTile(
              title: TextButton(
                child: Text(
                  'Items',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  )
                ),
                onPressed: _goToItem,
              ),
            ),
            ListTile(
              title: TextButton(
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    )
                  ),
                  onPressed: _logOut
                ),
            ),
          ],
        ),
      ),


      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            constraints: BoxConstraints(
                minHeight: 125,
                minWidth: 125,
                maxHeight: 225,
                maxWidth: 225,
            ),
            child:  Image.asset('assets/logo.png',fit: BoxFit.cover),
          ),
          Container(
            margin: EdgeInsets.only(left: 20,bottom: 10),
            child: Text(
              'Recommended',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            child: CarouselSlider(
              items: utils.carousel.map<Widget>((e) => _buildCarousel(e)).toList(),
              options: CarouselOptions(
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 6),
                enlargeCenterPage: true,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20,bottom: 10, top: 20),
            child: Text(
              'About Us',
              style: TextStyle(fontSize: 30, color: Colors.blue)
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20,right: 40,bottom: 30),
            padding: EdgeInsets.only(right: 20),
            child: Text('Dulmah Tea provides the best tea quality for families and business alike. \nWe have opened several snackbars that you can visit and enjoy a cup of hot tea or fresh snacks. \nYou can also buy our tea products at your nearest convenience store or online.',
            style: TextStyle(fontSize: 18)),
          ),
        ],
        
      )
      
    );
  }

}
