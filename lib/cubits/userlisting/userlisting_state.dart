part of 'userlisting_cubit.dart';

@immutable
abstract class UserlistingState {}

class UserlistingInitial extends UserlistingState {}

class UserlistingFailure extends UserlistingState {
  final String? message;
  UserlistingFailure({this.message});
}

class UserlistingLoading extends UserlistingState {}

class UserlistingSuccess extends UserlistingState {
  final List<UserData>? userData;
  UserlistingSuccess({this.userData});
}
