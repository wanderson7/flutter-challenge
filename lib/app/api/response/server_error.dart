import 'package:dio/dio.dart';
import 'status_code.dart';

class ServerError implements Exception {
  ServerError.withError({
    required String operation,
    required dynamic dioError,
  }) {
    _operation = operation;
    if (dioError is DioError) {
      _errorApi = ErrorApi.fromJson(
        dioError.response?.data,
        dioError.response?.statusCode,
      );
      _dioErrorType = dioError.type;
    }
  }

  ErrorApi? _errorApi;
  late String _operation;
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
        return _getErroApi();
    }
  }

  ErrorApi? _checkErrorCode(int code) {
    switch (code) {
      case StatusCode.internalServerError:
        return _getErroApi(
          "Ocorreu um erro ao efetuar o $_operation. Erro interno",
        );
      case StatusCode.notFound:
        return _getErroApi(
          "Ocorreu um erro ao efetuar o $_operation. Requisação não encontrada",
        );
      default:
        return _errorApi;
    }
  }

  ErrorApi? _getErroApi([String? message]) {
    _errorApi?.message = message ?? "Ocorreu um erro ao efetuar o $_operation. Verifique sua conexão e tente novamente.";
    return _errorApi;
  }
}

class ErrorApi {
  static const _jsonMessage = 'message';

  int? code;
  String? message;

  ErrorApi({
    this.code,
    this.message,
  });

  ErrorApi.fromJson(dynamic json, int? code) {
    this.code = code ?? -1;
    if (json != null) {
      message = json[_jsonMessage];
    }
  }

  bool isInternalError() {
    return code == StatusCode.internalServerError || code == -1;
  }
}
