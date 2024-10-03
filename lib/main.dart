import 'package:bloc_app/Features/Presentation/Pages/home_screen.dart';
import 'package:bloc_app/Features/Presentation/bloc/home_bloc.dart';
import 'package:bloc_app/Core/Dependency%20Injection/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  //init locator
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
          providers: [BlocProvider(create: (_) => locator<HomeBloc>())],
          child: HomeScreen()),
    );
  }
}
