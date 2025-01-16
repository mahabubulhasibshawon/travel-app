import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/apps_cubit.dart';
import 'package:travel_app/screens/welcome_screen.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppsCubit, AppsState>(builder: (context, state) {
        if (state is WelcomeState) {
          return WelcomeScreen();
        }
        else {
          return Container();
        }
      }),
    );
  }
}
