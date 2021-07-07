import 'package:flutter/material.dart';
import 'package:flutter_app/util/config.dart';
import 'package:flutter_app/view/pages/login.dart';
import 'package:flutter_app/util/config.dart' as globals;

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }

}

class AppState extends State<App> {

  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      home: LoginPage(),
      
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Login'),
      //     actions: [
      //       PopupMenuButton(itemBuilder: (context) {
      //           return ['Toggle Theme'].map((e) {
      //             return PopupMenuItem(
      //               child: TextButton(
      //                 child: Text(e),
      //                 onPressed: () {
      //                   setState((){
      //                     globals.darkTheme = !globals.darkTheme;
      //                   });
      //                 },
      //               )
                    
      //             );
      //           }).toList();
      //         }
      //       )
      //     ],
      //   ),
      //   body: LoginPage(),
      // ),
    );
  }
}
  