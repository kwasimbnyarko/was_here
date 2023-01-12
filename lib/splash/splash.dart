import 'package:flutter/material.dart';
import 'package:was_here/user/user_details.dart';
import 'package:was_here/utils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    UserDetails.getUserDetails().then((value) => {
          // print(UserDetails.areDetailsAvailable!),
          if (!UserDetails.areDetailsAvailable!)
            {print('add'), Navigator.of(context).addDetails()}
          else
            {print('view'), Navigator.of(context).viewDetails()}
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.check,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
