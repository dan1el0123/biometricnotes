import 'package:fingerprint_app/screens/notes_screen.dart';
import 'package:fingerprint_app/services/database.dart';
import 'package:fingerprint_app/services/local_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  authenticateWithBiometrics() async {
    final isAuthenticated = await LocalAuthService.authenticate();

    if (isAuthenticated) {
      Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => NotesPage(),
      ));
    }
  }

  @override
  void dispose() {
    super.dispose();
    NotesDatabase.instance.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildWelcomeTextContainer(context),
              _buildFlareAnimation(),
              _buildAuthenticateButton(context),
            ],
          ),
        ),
      ),
    );
  }

  _buildFlareAnimation() {
    return FlareCacheBuilder(
      [
        AssetFlare(bundle: rootBundle, name: 'assets/flares/locked_nobg.flr'),
      ],
      builder: (BuildContext context, bool isWarm) {
        return Container(
          height: 300,
          width: 300,
          child: FlareActor(
            'assets/flares/locked_nobg.flr',
            animation: 'init',
          ),
        );
      },
    );
  }

  Padding _buildAuthenticateButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50.0,
      ),
      child: ElevatedButton(
        onPressed: () => authenticateWithBiometrics(),
        child: Text(
          'AUTHENTICATE',
          style: Theme.of(context).textTheme.button!.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: 22.0,
              ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Container _buildWelcomeTextContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Welcome to',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          ),
          Text(
            'BiometricNotes',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
