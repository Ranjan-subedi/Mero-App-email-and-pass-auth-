import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  Future login({required String email, required String password})async{
    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
  return credential.user;
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    return('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    return('Wrong password provided for that user.');
  }else{
    return ('Authentication error');
  }
}
  }

Future register({required String email, required String password})async{
 
 try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  return credential;
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    return('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    return('The account already exists for that email.');
  }else{
    return('Error: ${e.code}');
  }
} catch (e) {
  return(e);
}
    // Create a new user with the given email and password
    
  }
    
  }

  logout()async{
    await FirebaseAuth.instance.signOut();
  }

