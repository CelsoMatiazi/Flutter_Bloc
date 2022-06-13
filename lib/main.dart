import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_study/bloc/block/counter.bloc.dart';
import 'package:flutter_bloc_study/bloc/counter_bloc_page.dart';
import 'package:flutter_bloc_study/cubit/counter_cubit_page.dart';
import 'package:flutter_bloc_study/cubit/cubit/counter_cubit.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc',
      routes: {
        '/bloc': (_) =>  BlocProvider(
          create: (_) => CounterBloc(),
          child: const CounterBlocPage()
        ),
        "/cubit" : (_) => BlocProvider(
          create: (_) => CounterCubit(),
          child: const CounterCubitPage()
        )
      },

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}

