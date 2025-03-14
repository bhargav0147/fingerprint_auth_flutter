import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class AuthUtils {
  static final LocalAuthentication _auth = LocalAuthentication();

  static Future<bool> authenticate(BuildContext context)async{
    try{

      return await _auth.authenticate(localizedReason: "Please authenticate to access the app",
      options: AuthenticationOptions(
        stickyAuth: true,
        biometricOnly: true
      )
      );
    }catch(e){
       debugPrint("Error during authentication: $e");
      _showExitDialog(context);
      return false;
    }
  } 

  Future<void> checkBiometrics() async {
  final bool canCheckBiometrics = await _auth.canCheckBiometrics;
  final bool isDeviceSupported = await _auth.isDeviceSupported();

  if (!canCheckBiometrics || !isDeviceSupported) {
    debugPrint('Biometric not supported or permission issue');
  } else {
    debugPrint('Biometric permission granted and supported');
  }
}

  static void _showExitDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Authentication Failed'),
        content: const Text('You need to authenticate to proceed.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Try Again'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Exit'),
          ),
        ],
      ),
    ).then((value) => authenticate(context));
  }
}