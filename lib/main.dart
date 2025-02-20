// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp();
//     print('Firebase Initialized Successfully');
//   } catch (e) {
//     print('Firebase Initialize Error: $e');
//   }
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LoginPage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool _isLoading = false;

//   Future<void> _signInWithGoogle() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       print('Starting Google Sign In...');
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//       if (googleUser == null) {
//         print('Google Sign In Cancelled');
//         return;
//       }

//       print('Getting Google Auth Details...');
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//       print('Creating Firebase Credential...');
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       print('Signing in to Firebase...');
//       final UserCredential userCredential = 
//           await FirebaseAuth.instance.signInWithCredential(credential);
      
//       print('Successfully signed in: ${userCredential.user?.displayName}');
      
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Login berhasil: ${userCredential.user?.displayName}')),
//         );
//       }
//     } catch (e) {
//       print('Error during sign in: $e');
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: $e')),
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Sign In'),
//       ),
//       body: Center(
//         child: _isLoading
//             ? CircularProgressIndicator()
//             : ElevatedButton(
//                 onPressed: _signInWithGoogle,
//                 child: Text('Sign in with Google'),
//               ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
 
  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
  GoogleSignIn googleSignIn = GoogleSignIn(
    clientId:
        "660911174917-e2nb88a3u4g892np7os5eat89nd0ci10.apps.googleusercontent.com",
  );

  GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

  AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  await FirebaseAuth.instance.signInWithCredential(credential);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Sign In')),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: signInWithGoogle,
                child: const Text('Sign in with Google'),
              ),
      ),
    );
  }
}