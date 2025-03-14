import 'package:fingerprint_auth_flutter/screens/home_screen.dart';
import 'package:fingerprint_auth_flutter/utils/auth_utils.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
    AuthUtils().checkBiometrics();
    _authenticate();
    
  }

  Future<void> _authenticate() async {
    bool isAuthenticated = await AuthUtils.authenticate(context);
    if(isAuthenticated)
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(color: Colors.amber,),
      ),
    );
  }
}