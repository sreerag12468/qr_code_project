import 'package:flutter/material.dart';
import './pages/generate_page.dart';
import './pages/scan_code_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/generate": (context) => GeneratePage(),
        "/scan" : (context) => ScanCodePage()
      },
      initialRoute: "/scan",
   
    );
  }
}






