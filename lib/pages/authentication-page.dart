import 'package:flutter/material.dart';
import 'package:todo_app/services/auth-service.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {

  final AuthService _auth = AuthService();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Todo App - Sign in'),
        backgroundColor: Colors.indigo[800],
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 40.0),
              TextFormField(
                  onChanged: (val) {
                    email = val;
                  },
                  decoration:
                      const InputDecoration(hintText: 'Email')),
              const SizedBox(height: 40.0),
              TextFormField(
                  obscureText: true,
                  onChanged: (val) {
                    password = val;
                  },
                  decoration:
                      const InputDecoration(hintText: 'Password')),
              const SizedBox(height: 40.0),
              RaisedButton(
                  color: Colors.deepPurpleAccent,
                  child: const Text('Sign in',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
