import 'package:flutter/material.dart';
import 'package:pokedox/ui/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FocusNode _email = FocusNode();
  final FocusNode _password = FocusNode();
  final FocusNode _login = FocusNode();
  String state = 'Unknown Status';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //Center Column contents vertically,
            crossAxisAlignment: CrossAxisAlignment.center,
            //Center Column contents horizontally
            children: [
              TextField(
                  onEditingComplete: () {
                    _email.requestFocus();
                  },
                  controller: emailController,
                  decoration:
                      InputDecoration(hintText: 'Email', labelText: 'Email')),
              TextField(
                  onEditingComplete: () {
                    _login.requestFocus();
                  },
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password", labelText: 'Password')),
              ElevatedButton(
                  focusNode: _login,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dashboard()),
                    );
                  },
                  child: Text('Login')),
              Text(
                state,
              )
            ],
          ),
        ),
      ),
    );
  }

  void login(String email, String password) {
    setState(() {
      if (email == 'admin' && password == 'admin') {
        state = "Success";
      } else {
        state = "Failed";
      }
    });
  }
}
