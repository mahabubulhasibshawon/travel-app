import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/apps_cubit.dart';
import 'package:travel_app/screens/app_cubit_logics.dart';
import 'package:travel_app/screens/details_screen.dart';
import 'package:travel_app/screens/welcome_screen.dart';
import 'package:travel_app/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                  color: Colors.black
              )
          )
      ),
      home: BlocProvider(
        create: (context) => AppsCubit(),
        child: AppCubitLogics(),
      ),
    );
  }
}

