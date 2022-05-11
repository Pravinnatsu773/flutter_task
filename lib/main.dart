import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/controller/firebase_auth_provider.dart';
import 'package:flutter_task/screens/home_page.dart';
import 'package:flutter_task/screens/login/login_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
      ),
    ],
    child: MaterialApp(
      home: Consumer<AuthProvider>(
        builder: (_, model, __) => model.isSignedIn?const MyHomePage(title: ""):const LoginPage()),
      debugShowCheckedModeBanner: false,
    ),
  );



    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
       
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: ChangeNotifierProvider(create: (_) => AuthProvider(),
    //   child: Consumer<AuthProvider>(
    //     builder: (_, model, __) => model.isSignedIn?const MyHomePage(title: ""):const LoginPage()),),
    //   // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}
