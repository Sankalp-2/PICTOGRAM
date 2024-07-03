import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pictoadmin/utils/colors.dart';
import 'package:pictoadmin/webside/adminlogin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBNBF-Ll5665xucNXE0ocDm64ECdBpBpts",
          projectId: "picto-e174b",
          storageBucket: "picto-e174b.appspot.com",
          messagingSenderId: "51899639307",
          appId: "1:51899639307:web:fd6f57f28f9d60a451090e"),
    );
  } else {
    await Firebase.initializeApp();
  }
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PICTO-ADMIN',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: const AdminLogin());
  }
}
