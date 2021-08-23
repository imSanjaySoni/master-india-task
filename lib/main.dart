import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masters_india/data/repository/repository.dart';

import 'bloc/gst_bloc.dart';
import 'data/constants.dart';
import 'views/home/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: primaryColor,
        buttonColor: primaryColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          brightness: Brightness.dark,
          centerTitle: false,
        ),
      ),
      home: BlocProvider<GSTBloc>(
        create: (context) => GSTBloc(GSTRepository()),
        child: const HomeScreen(),
      ),
    );
  }
}
