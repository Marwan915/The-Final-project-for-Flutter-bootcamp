import 'package:flutter/material.dart';
import 'package:flutter_final_project/constents/spacing.dart';
import 'package:flutter_final_project/extension/nav.dart';
import 'package:flutter_final_project/pages/login_screen.dart';
import 'package:flutter_final_project/pages/sign_up_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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

          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Text(
                'TourKsa',
                style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 30,
                      color: Colors.black54, // ظل النص
                      offset: Offset(10, 5),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // المربع المستطيل أسفل الشاشة
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 220,
              width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.only(bottom: 89),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(45),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(children: [
                    SizedBox(
                      width: 130,
                    ),
                    Icon(
                      Icons.account_circle,
                      color: Color.fromARGB(255, 19, 196, 46),
                    ),
                    height12,
                    ElevatedButton(
                        onPressed: () {
                          context.pushAndRemoveUntil(SignUpScreen());
                        },
                        child: Text('Sign Up')),
                  ]),
                  height12,
                  Text("If you already have an account  "),
                  Row(
                    children: [
                      width130,
                      Icon(
                        Icons.arrow_circle_right,
                        color: Color.fromARGB(255, 19, 196, 46),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context.pushAndRemoveUntil(LoginScreen());
                          },
                          child: Text('Log In')),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
