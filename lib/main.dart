import 'package:flutter/material.dart';
import 'package:yes_no_app/config/themes/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 3).theme(),
      title: 'Yes No App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Yes No App Bar'),
        ),
        body: Center(
          child: FilledButton.tonal(
            onPressed: () {

            }, 
            child:const Icon(Icons.access_time_filled_rounded)
          ),
        ),
      ),
    );
  }
}
