import 'package:flutter/material.dart';
import 'package:flutter_app/model/menu.dart';
import 'package:flutter_app/model/review.dart';
import 'package:flutter_app/util/config.dart' as globals;

class ItemDetailPage extends StatefulWidget {

  final Menu menu;
  final String username;
  ItemDetailPage(this.menu,this.username);

  @override
  State<StatefulWidget> createState() {
    return ItemDetailState(menu,username);
  }
  

}

class ItemDetailState extends State<ItemDetailPage> with SingleTickerProviderStateMixin {

  Menu menu;
  String username;
  Review addRev = Review('','');
  late TabController _ctrlTab;

  ItemDetailState(this.menu,this.username);

  @override
  void initState() {
    super.initState();
    _ctrlTab = TabController(vsync: this ,length: 3);
  }

  @override 
  void dispose() {
    _ctrlTab.dispose();
    super.dispose();
  }

  var _ctrlReview = TextEditingController();

  void _onPressed(BuildContext _ctx) {
    if (_ctrlReview.text == '' ) {
      ScaffoldMessenger.of(_ctx).showSnackBar(
        SnackBar(content: Text('Review Message is empty'),)
      );
    } else {
      addRev.rev = _ctrlReview.text;
      addRev.username = username;
      _ctrlReview.clear();
      setState(() {
        menu.rev.add(addRev);
      });
    }
  }


  Widget _buildReview(Review r) {
    return Card(
      child: ListTile(
        // leading: Image.asset('assets/${l.img}'),
        leading: Icon(
          Icons.perm_identity,
        ),
        title: Text(r.username),
        subtitle: Text(r.rev),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
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
        bottom: TabBar(
          controller: _ctrlTab,
          tabs: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                '${menu.name}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Add Review',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'All Reviews',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          // Product
            ListView(
              children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: 100,
                  minWidth: 300,
                  maxHeight: 150,
                  maxWidth: 300,
                ),
                child:  Image.asset('assets/${menu.url}',fit: BoxFit.cover),
              ),
              Container( 
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.only(left: 10, right: 10),
                child:  Text(
                  '${menu.name}',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900]
                  ),
                )
              ),
              Container( 
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(left: 10, right: 10),
                child:  Text(
                  '${menu.desc}',
                  style: TextStyle(fontSize: 20),
                )
              ),
              Container( 
                padding: EdgeInsets.only(left: 10, right: 10),
                child:  Text(
                  'Rp. ${menu.price}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                  ),
                )
              ),
            ],
          ),
        
          // Input Review
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  maxLines: 8,
                  decoration: InputDecoration(hintText: 'Your Review'),
                  controller: _ctrlReview,
                ),
              ),
              ElevatedButton(onPressed: ()=> _onPressed(context), child: Text('Submit')),
            ],
          ),
          // ALL Review
          ListView(
            children: menu.rev.map((e) => _buildReview(e)).toList()
          ),
        ],
        controller: _ctrlTab,
      ),
      
    );
  }

}