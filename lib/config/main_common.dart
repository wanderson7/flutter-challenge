import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/app/app_widget.dart';
import 'package:flutter_challenge/app/shared/logger/logger_container.dart';
import 'package:flutter_challenge/app/helpers/constants.dart';
import 'package:flutter_challenge/app/shared/model/user/user_model.dart';
import 'package:flutter_challenge/app/shared/user_preferences/shared_preferences_helper.dart';
import 'package:provider/provider.dart';


final logger = LoggerContainer().init();

void mainCommon(String environment) async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  final UserModel? user = await UserSharedPreferences.getUser();
  K.init(value: environment);
  assert(buildEnv != null);

  runApp(
    Provider.value(
      value: user,
      child: AppWidget(),
    ),
  );
}
