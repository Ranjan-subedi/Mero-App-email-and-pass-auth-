import 'package:firebase_new_project/firebase_services.dart';
import 'package:firebase_new_project/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  late  final TextEditingController _passwordController ;
  late  final TextEditingController _emailController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseServices _firebaseServices = FirebaseServices();

  @override
  void initState() {
    
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
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
                  color: Colors.grey.withAlpha(100),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Register', style: TextStyle(fontSize: 30,
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
                   labelText: 'password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      foregroundColor: Colors.white
                    ),
                    onPressed: () async{
                      // Handle login action
                      if (_formKey.currentState!.validate()) {
                        try {
                          final register = await _firebaseServices.register(
                            email: _emailController.text.trim().toLowerCase(),
                           password: _passwordController.text.trim().toLowerCase());
                        
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Register Success: ${register.toString()}',style: TextStyle(color: Colors.green),),
                            ),
                          );
                          return register;
                        }
                         catch (e) {
                              
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error: ${e.toString()}',style: TextStyle(color: Colors.red),),
                            ),
                          );
                    
                        }
                  
                      }
                              
                    },
                    child: const Text('Resister'),
                  ),
                ),
                SizedBox(height: 20),
                RichText(text: TextSpan(children: [
                  const TextSpan(text: 'Already have an account?',
                  style: TextStyle(color: Colors.black, fontSize: 15),),
                  TextSpan(
                    recognizer: TapGestureRecognizer() ..onTap = (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => const LoginPage()));
                    },
                    text: 'Log In',
                  style: TextStyle(color: Colors.blue, fontSize: 15,
                  fontWeight: FontWeight.bold),),
                ]),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}