import 'package:flutter_challenge/config/environment.dart';
import 'package:flutter_challenge/config/main_common.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



Future<void> main() async {
  await dotenv.load(fileName: 'lib/config/production/.env');
  mainCommon(Environment.production);
}
