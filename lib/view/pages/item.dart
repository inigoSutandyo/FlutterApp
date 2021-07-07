import 'package:flutter_app/util/utilities.dart' as utils;
import 'package:flutter/material.dart';
import 'package:flutter_app/model/menu.dart';
import 'package:flutter_app/view/pages/itemdetail.dart';
import 'package:flutter_app/util/config.dart' as globals;

class ItemPage extends StatefulWidget {
  final String username;
  ItemPage(this.username);
  @override
  State<StatefulWidget> createState() {
    return ItemPageState(username);
  }

}

class ItemPageState extends State<ItemPage> {
  final String username;
  ItemPageState(this.username);

  
  final List<Menu> _data = utils.menuItems;


  void _onPressed(Menu m,BuildContext _ctx) {
    Navigator.push(_ctx, MaterialPageRoute(builder: (builder) {
      return ItemDetailPage(m,username);
    }));
  }

  Widget _buildLists(Menu m,BuildContext _ctx) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        // leading: Image.asset('assets/${l.img}'),
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 125,
            minWidth: 150,
            maxHeight: 150,
            maxWidth: 175,
          ),
          child: Image.asset(
            'assets/${m.url}',
            fit: BoxFit.cover
          ),
        ),
        title: Text(m.name),
        subtitle: Text('${m.price}'),
        trailing: ElevatedButton(onPressed: ()=> _onPressed(m,_ctx), child: Text('Details')),
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
      ),
      body: ListView(
        children: _data.map<Widget>((e) => _buildLists(e,context)).toList()
      ),
    );
  }

}