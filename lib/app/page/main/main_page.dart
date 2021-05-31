import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/app/helpers/colors_helper.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: [_buildAppBarActionLogout()],
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextHello(context),
              _buildTextUsername(context),
              SizedBox(height: 24),
              _buildTextSignInDescription(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBarActionLogout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
        style: TextButton.styleFrom(primary: C.accent),
        onPressed: () {},
        child: Text("Logout"),
      ),
    );
  }

  Widget _buildTextHello(BuildContext context) {
    return Text(
      "Olá,",
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Widget _buildTextUsername(BuildContext context) {
    return Text(
      "Usuário",
      style: Theme.of(context).textTheme.headline4,
    );
  }

  Widget _buildTextSignInDescription(BuildContext context) {
    return Text(
      "Você foi logado com sucesso!",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline6,
    );
  }
}
