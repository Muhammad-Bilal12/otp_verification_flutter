import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_test_app/otpscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  Future<void> sendOtp() async {
    EmailAuth emailAuth = EmailAuth(sessionName: "OTP Testing");
    bool result = await emailAuth.sendOtp(
      recipientMail: emailcontroller.value.text,
      otpLength: 5,
    );
    if (result) {
      print(' Otp');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => OtpScreen(email: emailcontroller.value.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Write.png'),
                  ),
                ),
              ),
              // Image.asset(
              //   'assets/write.png',
              //   height: 200,
              //   width: 200,
              //   // scale: 8.0,
              // ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // email text feild
                    TextField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Email',
                        prefixIcon: Icon(Icons.email),
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                    ),
                    const SizedBox(height: 10),
                    // password feild
                    TextField(
                      controller: passcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password',
                        prefixIcon: Icon(Icons.lock),
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                    ),
                    // login button
                    const SizedBox(height: 20),
                    InkWell(
                      onTap: () => sendOtp(),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          'Send OTP',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
