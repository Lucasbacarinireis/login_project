import 'package:flutter/material.dart';
import 'package:login_project/services/prefs_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.wait([
      PrefsService.isAuth(),
    ]).then((value) => value[0]
        ? Navigator.of(context).pushReplacementNamed("/home")
        : Navigator.of(context).pushReplacementNamed("/login"));

    // Future.delayed(const Duration(seconds: 3))
    //     .then((value) => Navigator.of(context).pushReplacementNamed("/login"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade600,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
