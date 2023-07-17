import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity/InternetBlock/InternetBlock.dart';
import 'package:internet_connectivity/cubits/internet_qubuts.dart';

import 'Screena/HomeScreens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

        /// using InternetBlock
        // create: (context) => InternetBlock(),
        create: (context) => InternetCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreens(),
        ));
  }
}
