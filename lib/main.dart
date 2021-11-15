import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/services/auth-service.dart';
import 'package:todo_app/wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const TodoApp());
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(options: FirebaseOptions.fromMap({
          "apiKey": "AIzaSyB2TZ0fIl191JJ1GvaJImgb51jzifU9_mM",
          "authDomain": "flutter-backend-2755b.firebaseapp.com",
          "projectId": "flutter-backend-2755b",
          "storageBucket": "flutter-backend-2755b.appspot.com",
          "messagingSenderId": "706969318185",
          "appId": "1:706969318185:web:9231137920248c686efd38",
          "measurementId": "G-YZPMLGWSYY"
        })),
        builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) =>
            StreamProvider.value(
              value: AuthService().user,
              initialData: null,
              child: MaterialApp(
                  title: 'Todo App',
                  theme: ThemeData(primarySwatch: Colors.indigo),
                  home: snapshot.connectionState == ConnectionState.waiting
                      ? const Text('Loading...')
                      : snapshot.connectionState == ConnectionState.done
                          ? const Wrapper()
                          : const Text('Error')),
            ));
  }
}
