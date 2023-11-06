import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/screens/welcome_scree.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      title: 'Quotes Getx',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff8ba8ef),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xff8ba8ef),
            iconTheme: IconThemeData(
              color: Colors.white,
            )),
        fontFamily: 'Raleway',
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
          color: Colors.white,
        )),
      ),
      home: const WelcomeScreen(),
    );
  }
}
