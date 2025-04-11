import 'package:firebase_new_project/firebase_services.dart';
import 'package:firebase_new_project/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late  final TextEditingController _passwordController ;
  late  final TextEditingController _emailController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Login Page',style: TextStyle(
          color: Colors.white60,
          fontSize: 32,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]
            ),
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Mero App', style: TextStyle(fontSize: 30, 
                color: Colors.blue,
                fontWeight: FontWeight.bold),),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        
                      ),
                      foregroundColor: Colors.white
                    ),
                    onPressed: () {
                      // Handle login action
                      if (_formKey.currentState!.validate()) {
                       try {
                        final login = FirebaseServices().register(
                          email: _emailController.text.trim().toLowerCase(),
                           password: _passwordController.text.toLowerCase());
                              
                       } catch (e) {
                         // Handle error
                         print('Authentication Error: $e',);
                         
                       }
                      }
                              
                    },
                    child: const Text('Login'),
                  ),
                ),
                SizedBox(height: 20),
                RichText(text: TextSpan(children: [

                    const TextSpan(text: 'Don\'t have an account?',style: TextStyle(color: Colors.black)),
                    TextSpan(
                      text: ' Register Now',
                      style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        // Navigate to register page
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                      },
                    ),
                
                ])),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}