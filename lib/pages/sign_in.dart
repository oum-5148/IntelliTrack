import 'package:IT/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:IT/components/my_button.dart';
import 'package:IT/components/my_textfield.dart';
import 'package:IT/components/square_tile.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usercinController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // logo
              SvgPicture.asset(
                'assets/icons/logo.svg',
                height: 300,
                width: 470,
              ),

              // CIN textfield
              MyTextField(
                controller: usercinController,
                hintText: 'CIN',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Wrap the button with InkWell for clickability
              InkWell(
                child: MyButton(
                  onTap: () {
                     // Navigate to the HomePage when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return HomePage();
                    }),
                  );
                  },
                ),
              ),

              const SizedBox(height: 30),

              // cims + ministry logos
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ministry logo
                  SquareTile(svgPath: 'assets/icons/ministry.svg'),

                  SizedBox(width: 25),

                  // cims logo
                  SquareTile(svgPath: 'assets/icons/cims.svg'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
