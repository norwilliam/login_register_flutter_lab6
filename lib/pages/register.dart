import 'package:flutter/material.dart';
import 'second_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String userName = '';
  String password = '';

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Register ไม่สำเร็จ'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('ตกลง'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextField _txtUserName = TextField(
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.all(10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 240, 240, 240),
      ),
      onChanged: (text) {
        setState(() {
          userName = text;
        });
      },
    );

    final TextField _txtPassword = TextField(
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.all(10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 240, 240, 240),
      ),
      obscureText: true,
      onChanged: (text) {
        setState(() {
          password = text;
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Register Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: _txtUserName,
            ),
            SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: _txtPassword,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text("Register"),
              onPressed: () {
                if (userName.isEmpty || password.isEmpty) {
                  _showAlertDialog("กรุณาใส่ username และ password");
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(
                        userName: userName,
                        password: password,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}