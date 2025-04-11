import 'package:firebase_new_project/firebase_services.dart';
import 'package:firebase_new_project/login_page.dart';
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                ElevatedButton(
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
                      } catch (e) {
            
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error: ${e.toString()}',style: TextStyle(color: Colors.red),),
                          ),
                        );
                        // print(e.toString());
                        
                      }
                     
            
            
                    }
            
                  },
                  child: const Text('Resister'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                   // Navigate to login page if already registered.
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(
                        builder: (context) => LoginPage(),));
                    
                  },
                  child: const Text('Log IN Now'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}