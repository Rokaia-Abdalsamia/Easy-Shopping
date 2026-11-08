import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthantication {
String emailAddress,password;
FirebaseAuthantication({required this.emailAddress,required this.password});
  createUserWithEmailAndPassword() async {

try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailAddress,
    password: password,
  );
} on FirebaseAuthException catch (e) {
rethrow;


} catch (e) {
  print(e);
}


  }

signInWithEmailAndPassword()async{

  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailAddress,
    password: password
  );
} on FirebaseAuthException catch (e) {
  // if (e.code == 'user-not-found') {
  //   throw('No user found for that email.');
  // } else if (e.code == 'wrong-password') {
  //   throw('Wrong password provided for that user.');
  // }

    rethrow;

}
}



}