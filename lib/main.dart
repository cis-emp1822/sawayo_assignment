import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sawayo_assignment/cubits/userlisting/userlisting_cubit.dart';
import 'package:sawayo_assignment/views/users_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserlistingCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Users',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const UsersList(title: 'Users'),
      ),
    );
  }
}
