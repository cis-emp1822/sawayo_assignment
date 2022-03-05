import 'package:dio/dio.dart';
import 'package:sawayo_assignment/models/server_response.dart';

class UserApi {
  final Dio? _dio;
  UserApi(this._dio);

  ServerResponse simplifyGetResponse(Response response,
      {String data = "data"}) {
    switch (response.statusCode!) {
      case 200:
        return ServerResponse(
            status: true,
            code: response.statusCode!,
            message: "$data fetched Successfully",
            data: response.data);
      case 503:
        return ServerResponse(
            status: false,
            code: response.statusCode!,
            message:
                "Our servers are under maintenance. Please try again later.",
            data: response.data!);
      default:
        return ServerResponse(
            status: false,
            code: response.statusCode!,
            message: response.data.toString(),
            data: {});
    }
  }

  Future<ServerResponse?> fetchUsersList() async {
    try {
      final response = await _dio!.get('/users');
      return simplifyGetResponse(response, data: "Users");
    } catch (e) {
      return ServerResponse(
          status: false, code: 500, message: e.toString(), data: {});
    }
  }
}
