import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
  
}

class LoginPageState extends State<LoginPage> {

  var _ctrlUsername = TextEditingController();
  var _ctrlPass = TextEditingController();

  var _errUsername = '';
  var _errPass = '';

  void _onPressed(BuildContext _ctx) {
    var _userFlag = false;
    var _passFlag = false;

    if(_ctrlUsername.text == "") {
      setState((){
        _errUsername = 'Username is empty';
      });
      _userFlag = true;
      
    } else if (_ctrlUsername.text.length < 5 || _ctrlUsername.text.length > 50) {
      setState((){
        _errUsername = 'Username must be between 5 - 50 characters long';
      });
      _userFlag = true;

    }  else if (_ctrlUsername.text.contains(' ') ) {
      setState((){
        _errUsername = 'Username must be 1 word only';
      });
      _userFlag = true;

    }

    if (_ctrlPass.text == "") {
      setState((){
        _errPass = 'Password is empty';
      });
      _passFlag = true;

    } else if (_ctrlPass.text.length < 8) {
      setState((){
        _errPass = 'Password must be atleast 8 characters long';
      });
      _passFlag = true;

    } 

    if (!_userFlag && !_passFlag) {
      Navigator.pushReplacement(_ctx, MaterialPageRoute(builder: (builder) {
        return HomePage(_ctrlUsername.text);
      }));

    } 
    if (!_passFlag) {
      setState((){
        _errPass = '';
      });

    } 
    if (!_userFlag) {
      setState((){
        _errUsername = '';
      });
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            constraints: BoxConstraints(
              minHeight: 175,
              minWidth: 175,
              maxHeight: 250,
              maxWidth: 250,
            ),
            child: Image.asset('assets/logo.png', fit: BoxFit.cover,),
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: TextField(
              decoration: InputDecoration(hintText: 'Username'),
              controller: _ctrlUsername,

            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 15),
            child: Text(
              _errUsername,
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 18,
                fontStyle: FontStyle.italic 
              )
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 20),
            
            child: TextField(
              obscureText: true, // buat pw
              decoration: InputDecoration(hintText: 'Password'),
              controller: _ctrlPass,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 15),
            child: Text(
              _errPass,
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 18,
                fontStyle: FontStyle.italic 
              ),
            ),
          ),
          ElevatedButton(onPressed: ()=> _onPressed(context), child: Text('Login')),
        ],
      ),
    );
     
  }
  
}