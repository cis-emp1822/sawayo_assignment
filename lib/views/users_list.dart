import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sawayo_assignment/cubits/userlisting/userlisting_cubit.dart';
import 'package:sawayo_assignment/widgets/failure_screen.dart';
import 'package:sawayo_assignment/widgets/splash.dart';
import 'package:sawayo_assignment/widgets/userview.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  void initState() {
    context.read<UserlistingCubit>().fetchUserListing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Center(child: BlocBuilder<UserlistingCubit, UserlistingState>(
          builder: ((context, state) {
        if (state is UserlistingInitial) {
          return const Splash();
        }
        if (state is UserlistingLoading) {
          return const CircularProgressIndicator();
        }
        if (state is UserlistingFailure) {
          return FailureScreen(message: state.message);
        }
        if (state is UserlistingSuccess) {
          if (state.userData!.isNotEmpty) {
            return ListView.builder(
                itemCount: state.userData!.length,
                itemBuilder: (context, index) => Userview(
                      userData: state.userData![index],
                    ));
          } else {
            return const FailureScreen(message: "No Users Found");
          }
        }
        return const Splash();
      }))),
    ));
  }
}
