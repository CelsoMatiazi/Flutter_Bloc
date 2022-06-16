import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_study/basic/bloc/block/counter.bloc.dart';
import 'package:flutter_bloc_study/basic/bloc/counter_bloc_page.dart';
import 'package:flutter_bloc_study/basic/cubit/counter_cubit_page.dart';
import 'package:flutter_bloc_study/basic/cubit/cubit/counter_cubit.dart';
import 'package:flutter_bloc_study/crud/ui/contact_update.dart';
import 'package:flutter_bloc_study/crud/ui/contacts_list_page.dart';
import 'package:flutter_bloc_study/crud/ui/register/bloc_controller/contact_register_bloc.dart';
import 'package:flutter_bloc_study/crud/ui/register/contacts_register_page.dart';
import 'package:flutter_bloc_study/crud/repositories/contact_repository.dart';
import 'basic/basic_home_page.dart';
import 'basic/home_page.dart';
import 'crud/ui/contact_list/bloc_controller/contact_list_event.dart';
import 'crud/ui/contact_list/bloc_controller/contact_list_bloc.dart';



void main() {
  runApp(RepositoryProvider(
      create: (context) => ContactRepository(),
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc',
      routes: {
        '/basic_bloc': (_) =>  BlocProvider(
          create: (_) => CounterBloc(),
          child: const CounterBlocPage()
        ),
        "/basic_cubit" : (_) => BlocProvider(
          create: (_) => CounterCubit(),
          child: const CounterCubitPage()
        ),
        "/basic_bloc_options" : (_) => const BasicHomePage(),
        "/contact_list_page" : (_) => BlocProvider(
          create: (_) => ContactListBloc(
              repository: context.read<ContactRepository>())
               ..add(ContactListEventFindAll()),
          child: const ContactListPage()
        ),
        "/contact/register": (_) => BlocProvider(
          create: (context) => ContactRegisterBloc(repository: context.read()),
            child: const ContactRegister()),
        "/contact/update": (_) => const ContactUpdate(),


      },

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}

