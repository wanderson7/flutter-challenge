import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../environment.dart';
import '../main_common.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'lib/config/production/.env');
  mainCommon(Environment.production);
}
