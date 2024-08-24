import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class SecondPage extends StatelessWidget {
  final String userName;
  final String password;

  SecondPage({required this.userName, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("ยินดีต้อนรับ $userName"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Username : $userName",
              style: TextStyle(fontSize: 38),
            ),
            Text(
              "Password : $password",
              style: TextStyle(fontSize: 38),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text("กลับไปที่หน้า Login"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text("กลับไปที่หน้า Register"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}