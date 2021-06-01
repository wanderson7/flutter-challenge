import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'status_code.dart';

class ServerError implements Exception {
  ServerError.withError({
    @required dynamic error,
  }) {
    if (error is DioError) {
      _errorApi = ErrorApi.fromJson(
        error.response?.data,
        error.response?.statusCode,
      );
      _dioErrorType = error.type;
    }
  }

  ErrorApi? _errorApi;
  DioErrorType? _dioErrorType;

  bool isUnauthorized() => _errorApi?.code == StatusCode.unauthorized;

  int? getErrorCode() => _errorApi?.code;

  ErrorApi? getErrorAPI() => _handleError(_dioErrorType);

  ErrorApi? _handleError(DioErrorType? errorType) {
    switch (_dioErrorType) {
      case DioErrorType.cancel:
        return _getErroApi("Ocorreu um erro, operação cancelada");
      case DioErrorType.connectTimeout:
        return _getErroApi("Ocorreu um erro, tempo limite excedido");
      case DioErrorType.receiveTimeout:
        return _getErroApi("Ocorreu um erro, tempo limite excedido");
      case DioErrorType.response:
        return _checkErrorCode(_errorApi?.code ?? 0);
      case DioErrorType.sendTimeout:
        return _getErroApi("Ocorreu um erro, tempo limite excedido");
      default:
        return _getErroApi("Ocorreu um erro ao efetuar a operação. Verifique sua conexão e tente novamente.");
    }
  }

  ErrorApi? _checkErrorCode(int code) {
    switch (code) {
      case StatusCode.internalServerError:
        return _getErroApi(
          "Error ${_errorApi?.code}",
          title: "Atenção",
        );
      case StatusCode.notFound:
        return _getErroApi(
          "Ocorreu um erro ao efetuar <a operação>. Verifique sua conexão e tente novamente.",
          title: "Atenção",
        );
      default:
        return _errorApi;
    }
  }

  ErrorApi? _getErroApi(
    String? message, {
    String? title,
  }) {
    _errorApi?.title = title ?? "Atenção";
    _errorApi?.description = message;
    return _errorApi;
  }
}

class ErrorApi {
  ErrorApi({
    this.code,
    this.title,
    this.description,
  });

  ErrorApi.fromJson(dynamic json, int? code) {
    this.code = code ?? -1;
    if (json != null &&
        json is Map<String, dynamic> &&
        json[_jsonError] is Map<String, dynamic>) {
      final error = json[_jsonError];
      title = error[_jsonTitle] as String;
      description = error[_jsonDescription] as String;
    }
  }

  static const _jsonError = 'error';
  static const _jsonTitle = 'title';
  static const _jsonDescription = 'description';

  int? code;
  String? title;
  String? description;

  bool isInternalError() {
    return code == StatusCode.internalServerError || code == -1;
  }
}
