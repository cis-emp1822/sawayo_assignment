import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:sawayo_assignment/models/server_response.dart';
import 'package:sawayo_assignment/models/userdata.dart';
import 'package:sawayo_assignment/resources.dart';
import 'package:sawayo_assignment/services/users_api.dart';

part 'userlisting_state.dart';

class UserlistingCubit extends Cubit<UserlistingState> {
  UserlistingCubit() : super(UserlistingInitial()) {
    _dio = Dio(BaseOptions(baseUrl: Resources.baseUrl));
    _userApi = UserApi(_dio);
  }
  late final Dio _dio;
  late final UserApi _userApi;
  fetchUserListing() async {
    emit(UserlistingLoading());
    final ServerResponse? serverResponse = await _userApi.fetchUsersList();
    if (serverResponse?.status ?? false) {
      final List<UserData> userData = (serverResponse?.data as List<dynamic>)
          .map<UserData>((e) => UserData.fromJson(e))
          .toList();
      emit(UserlistingSuccess(userData: userData));
    } else {
      final String? errorMessage = serverResponse?.message;
      emit(UserlistingFailure(message: errorMessage));
    }
  }
}
