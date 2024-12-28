import 'package:flutter/material.dart';
import 'package:funfacts_app/Screens/mainScreen.dart';
import 'package:funfacts_app/providers/themeProvider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider(
    create:(context)=>ThemeProvider(),child: MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    Provider.of<ThemeProvider>(context,listen: false).loadMode();
  }
  @override
  Widget build(BuildContext context) {
    var themeprovider= Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:themeprovider.isDarkModeChecked
          ?ThemeData.dark(useMaterial3: true)
          :ThemeData.light(useMaterial3: true),
      home: Mainscreen(),
    );
  }
}
