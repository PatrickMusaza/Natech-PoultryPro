import 'package:flutter/material.dart';
import 'base_auth_user_provider.dart';
import 'dart:math';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';


abstract class AuthManager {
  Future signOut();
  Future deleteUser(BuildContext context);
  Future updateEmail({required String email, required BuildContext context});
  Future resetPassword({required String email, required BuildContext context});
  Future sendEmailVerification() async => currentUser?.sendEmailVerification();
  Future refreshUser() async => currentUser?.refreshUser();


  // Verification Code Logic
  String? _verificationCode;
  DateTime? _codeGenerationTime;


  /// Generates and sends a verification code to the user's email.
  Future<void> sendEmailVerificationCode(String email) async {
    _verificationCode = _generateVerificationCode();
    _codeGenerationTime = DateTime.now();
    
    print(email);
    print(_verificationCode);
    await _sendEmailWithCode(
        email, _verificationCode!);
  }

  /// Returns the stored verification code if it's still valid.
  String? getStoredVerificationCode() {
    if (_verificationCode == null || _codeGenerationTime == null) {
      return null;
    }

    // Check if 5 minutes have passed
    if (DateTime.now().difference(_codeGenerationTime!).inMinutes >= 5) {
      _verificationCode = null;
      _codeGenerationTime = null;
      return null;
    }
    return _verificationCode;
  }


  /// Generates a 6-digit random verification code.
  String _generateVerificationCode() {
    final random = Random();
    return (random.nextInt(900000) + 100000).toString(); // Random 6-digit code
  }


  Future<void> _sendEmailWithCode(String email, String code) async {
    // Define SMTP server configuration
    final smtpServer = SmtpServer(
      'smtp.gmail.com',
      port: 587, // or 465 for SSL
      username: 'poultryappacc@gmail.com',
      password: "jkgkgipavruudist",
    );


    // Create email message
    final message = Message()
      ..from = Address('poultryappacc@gmail.com', 'Natech Poultry App Team')
      ..recipients.add(email)
      ..subject = 'Your Verification Code'
      ..text = "Your verification code is: $code \n\nThis code is valid for 5 minutes only.";


    try {
      // Send the email
      final sendReport = await send(message, smtpServer);
      print('Verification code sent: $sendReport');
    } catch (e) {
      // Handle email sending errors
      print('Failed to send verification code: $e');
    }
  }
}


mixin EmailSignInManager on AuthManager {
  Future<BaseAuthUser?> signInWithEmail(
    BuildContext context,
    String email,
    String password,
  );


  Future<BaseAuthUser?> createAccountWithEmail(
    BuildContext context,
    String email,
    String password,
  );
}


mixin AnonymousSignInManager on AuthManager {
  Future<BaseAuthUser?> signInAnonymously(BuildContext context);
}


mixin AppleSignInManager on AuthManager {
  Future<BaseAuthUser?> signInWithApple(BuildContext context);
}


mixin GoogleSignInManager on AuthManager {
  Future<BaseAuthUser?> signInWithGoogle(BuildContext context);
}


mixin JwtSignInManager on AuthManager {
  Future<BaseAuthUser?> signInWithJwtToken(
    BuildContext context,
    String jwtToken,
  );
}


mixin PhoneSignInManager on AuthManager {
  Future beginPhoneAuth({
    required BuildContext context,
    required String phoneNumber,
    required void Function(BuildContext) onCodeSent,
  });


  Future verifySmsCode({
    required BuildContext context,
    required String smsCode,
  });
}


mixin FacebookSignInManager on AuthManager {
  Future<BaseAuthUser?> signInWithFacebook(BuildContext context);
}


mixin MicrosoftSignInManager on AuthManager {
  Future<BaseAuthUser?> signInWithMicrosoft(
    BuildContext context,
    List<String> scopes,
    String tenantId,
  );
}


mixin GithubSignInManager on AuthManager {
  Future<BaseAuthUser?> signInWithGithub(BuildContext context);
}
