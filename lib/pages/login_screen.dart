import 'package:flutter/material.dart';
import 'package:flutter_final_project/pages/first_screen_page.dart';
import 'package:flutter_final_project/pages/sign_up_screen.dart';
import 'package:flutter_final_project/service/database.dart';
import 'package:flutter_final_project/widgets/text_field_widget.dart';
import 'package:flutter_final_project/extension/nav.dart';
import 'package:flutter_final_project/constents/spacing.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            'https://static.wixstatic.com/media/cc9e38_065617fa5df840c4a9ce5c3c46e961e6~mv2.jpeg/v1/fill/w_563,h_1000,al_t,q_85,enc_avif,quality_auto/cc9e38_065617fa5df840c4a9ce5c3c46e961e6~mv2.jpeg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome Back To Your Account.',
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(
                  height: 160,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      height18,
                      TextFieldWidget(
                        controller: emailController,
                        text: "enter email",
                      ),
                      height24,
                      TextFieldWidget(
                        controller: passwordController,
                        text: "enter password",
                        isPassword: true,
                      ),
                      height18,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(value: false, onChanged: (value) {}),
                              const Text('Remember me'),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                      height24,
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          try {
                            await Database().login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FirstScreenPage(),
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.toString()),
                              ),
                            );
                          }
                        },
                        child: const Text('Log In'),
                      ),
                    ],
                  ),
                ),
                height24,
                GestureDetector(
                  onTap: () {
                    context.pushAndRemoveUntil(SignUpScreen());
                  },
                  child: const Text(
                    "if you don't have an account , 'Sign up'",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
