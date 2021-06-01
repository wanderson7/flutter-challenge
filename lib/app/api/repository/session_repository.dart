import 'package:dio/dio.dart';
import 'package:flutter_challenge/app/api/dio/custom_dio.dart';
import 'package:flutter_challenge/app/api/response/base_model.dart';
import 'package:flutter_challenge/app/api/response/server_error.dart';
import 'package:flutter_challenge/app/shared/model/form/user_form.dart';
import 'package:flutter_challenge/app/shared/model/session/session_model.dart';

class SessionRepository {
  Future<BaseModel<SessionModel>> onSignUpAsync(UserForm form) async {
    try {
      final dio = await CustomDio().init();
      final response = await dio.post(
        'users',
        data: form.toJson(),
      );
      return BaseModel()
        ..data = SessionModel.fromJson(response.data as Map<String, dynamic>);
    } catch (dioError) {
      return BaseModel()
        ..exception = ServerError.withError(error: dioError as DioError);
    }
  }

  Future<BaseModel<SessionModel>> onSignInAsync(
    String email,
    String password,
  ) async {
    try {
      final dio = await CustomDio().init();
      final response = await dio.post(
        'users/token',
        data: {
          'email': email,
          'password': password,
        },
      );
      return BaseModel()
        ..data = SessionModel.fromJson(response.data as Map<String, dynamic>);
    } catch (dioError) {
      return BaseModel()
        ..exception = ServerError.withError(error: dioError as DioError);
    }
  }
}
