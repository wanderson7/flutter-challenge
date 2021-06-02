


K? get buildEnv => _env;
K? _env;

class K {
  static const phoneNumberLength = 14;
  static const userModel = 'user-model';
  static const userIsLogged = 'user-is-logged';
  
  K._init({this.environment});

  final String? environment;

  static void init({required String value}) => _env ??= K._init(environment: value);
}