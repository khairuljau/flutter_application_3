import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/src/components/my_button.dart';
import 'package:flutter_application_3/src/components/my_textfield.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // login user in method
  void logUserIn() async{
    // Show loading circle
    // showDialog(context: context, builder: (context) {
    //   return Center(
    //     child: CircularProgressIndicator(),
    //    );
    //   },
    // );

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      //Wrong Email
      if (e.code == 'user-not-found') {
        wrongEmailMessage();

      //Wrong Password
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }

    // pop the loading circle
  //Navigator.pop(context);
  }

  void wrongEmailMessage(){
    showDialog(
      context: context, 
      builder: (context)  {
        return const AlertDialog(
          title: Text('Incorrect Email'),
        );
      },
    );
  }

    void wrongPasswordMessage(){
    showDialog(
      context: context, 
      builder: (context)  {
        return const AlertDialog(
          title: Text('Incorrect Password'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      
      appBar: AppBar(
        title: const Text("Account Set-up"),
        centerTitle: true,
        backgroundColor: const Color(0xFFF2B400),
      ),

      
      body: SafeArea(
        child: Center(
          child: Column(        
            children: [
              const SizedBox(height: 20),
              //Welcome back
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Text(
                      "Log in",
                      style: TextStyle(
                        color: Color(0xFF37474F),
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
        
              const SizedBox(height: 50),
              //UserEmail Textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,

              ),
          
              const SizedBox(height: 10),
              //UserPassword Textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
          
              const SizedBox(height: 10),          
              //Forgot Password
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

              const SizedBox(height: 30),
              //SignIn Button
              MyButton(
                onTap: logUserIn,
              ),
              //Not a Member
            ],
          ),
        )
        
      ),
    );
  }
}