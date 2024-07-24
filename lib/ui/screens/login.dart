import 'package:flow/ui/components/button.dart';
import 'package:flow/ui/components/logo.dart';
import 'package:flow/ui/components/text_input.dart';
import 'package:flow/ui/screens/onboard.dart';
import 'package:flow/ui/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Onboard(page: 2,)));
        }, icon: const Icon(Icons.arrow_back_ios, color: Colors.white),)
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            const SizedBox(height: 30,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Logo(),
              ],
            ),
            const SizedBox(height: 150,),
              Expanded(
                child: Animate(
                  effects: const [
                    FadeEffect(duration: Duration(milliseconds: 500)),
                    SlideEffect(
                      begin: Offset(0, 1),
                      end: Offset.zero,
                      duration: Duration(milliseconds: 300)
                    )
                  ],
                  child: buildLoginForm(context),
                ),
              ),
          ],),
        ),
      ),
    );
  }

  Container buildLoginForm(BuildContext context){
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: Color(0xFF000000),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
      ),
      child: Column(children: [
        const SizedBox(height: 10,),
        const Text('Welcome back!', style: TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.w900
        ),),
        const SizedBox(height: 10,),
        const Text('Enter your details below', style: TextStyle(
          color: Color(0xFF808080),
          fontSize: 16
        ),),
        const SizedBox(height: 30,),
        MyTextField(
          placeholder: 'Mobile Number',
          icons: const Icon(Icons.phone),
          onChange: (value){}, 
          controller: mobileController),
        const SizedBox(height: 10,),
        MyTextField(
          placeholder: 'Password',
          icons: const Icon(Icons.password_sharp),
          onChange: (value){}, 
          controller: passwordController),
        const SizedBox(height: 30,),
        MyButton(text: 'Login', onPressed: (){}),
        const SizedBox(height: 30,),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(color: Color(0xFF808080)),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignUp()));
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ))
            ],
          ),
        const SizedBox(height: 100,),
      ],),
    );
  }
}