import 'package:flutter/material.dart';
import 'register.dart';
import 'second_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userName = '';
  String password = '';

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login ไม่สำเร็จ'),
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
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20.0),
            _txtUserName,
            SizedBox(height: 10.0),
            _txtPassword,
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text("Login"),
              onPressed: () {
                if (userName.isEmpty || password.isEmpty) {
                  _showAlertDialog("กรุณาใส่ Username และ Password");
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
            SizedBox(height: 20.0),
            TextButton(
              child: Text("ไม่มีบัญชี? Register"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                ).then((newUser) {
                  if (newUser != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(
                          userName: newUser['userName'],
                          password: newUser['password'],
                        ),
                      ),
                    );
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}