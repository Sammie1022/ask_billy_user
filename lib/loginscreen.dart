import 'package:abigail_askbilly/services/authservice.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var name, password, token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Name'),
            onChanged: (val) {
              name = val;
            },
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
            onChanged: (val) {
              password = val;
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () {
              AuthService().login(name, password).then((val) {
                if (val.data['success']) {
                  token = val.data['token'];
                  Fluttertoast.showToast(
                    msg: 'Authenticated',
                  );
                }
              });
            },
            child: Text('Authenticate'),
          )
        ],
      ),
    );
  }
}
