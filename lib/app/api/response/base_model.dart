import 'server_error.dart';

class BaseModel<T> {
  ServerError? exception;
  T? data;
}
