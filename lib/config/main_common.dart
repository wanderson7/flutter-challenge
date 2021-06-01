import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/shared/logger/logger_container.dart';
import 'package:flutter_challenge/app/helpers/constants.dart';

import '../app/app_widget.dart';

final logger = LoggerContainer().init();

void mainCommon(String environment) {
  K.init(value: environment);
  assert(buildEnv != null);
  runApp(AppWidget());
}
