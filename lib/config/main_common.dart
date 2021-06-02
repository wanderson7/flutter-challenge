import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/app/shared/logger/logger_container.dart';
import 'package:flutter_challenge/app/helpers/constants.dart';
import 'package:flutter_challenge/app/shared/model/user/user_model.dart';
import 'package:flutter_challenge/app/shared/user_preferences/shared_preferences_helper.dart';
import 'package:provider/provider.dart';

import '../app/app_widget.dart';

final logger = LoggerContainer().init();

void mainCommon(String environment) async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  final bool isLogged = await UserSharedPreferences.isLogged();
  final UserModel? user = await UserSharedPreferences.getUser();

  K.init(value: environment);
  assert(buildEnv != null);

  final Map<String, dynamic> params = {
    K.userModel: user,
    K.userIsLogged: isLogged,
  };

  runApp(
    Provider.value(
      value: params,
      child: AppWidget(),
    ),
  );
}
