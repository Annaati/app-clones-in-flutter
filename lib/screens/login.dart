import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/screens/screens.dart';
import 'package:instagram_clone/utilities/colors.dart';
import 'package:instagram_clone/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              //Svg Logo
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              //Email Textield
              //Padding(
              // padding: const EdgeInsets.symmetric(horizontal: 20),
              TextInputField(
                hintText: 'Enter Your Email',
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress,
              ),
              //),
              const SizedBox(height: 26),
              //Password TextField
              TextInputField(
                hintText: 'Enter Your Password',
                textEditingController: _passwordController,
                textInputType: TextInputType.emailAddress,
                isPass: true,
              ),
              const SizedBox(height: 30),
              //forget Password Button

              //Sign in Button
              Container(
                child: const Text('Log in'),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  color: blueColor,
                ),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              //Navigate to Sign Up Button
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      child: const Text('Don\'t have an Account?'),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: Container(
                      child: const Text(
                        'Sign Up Now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
