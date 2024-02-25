import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void signUp() async {
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        showSuccessMessage();
      } else {
        showErrorMessage("Passwords do not match");
      }
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.message ?? "An error occurred");
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showSuccessMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("Success"),
          content: const Text("Signup successful!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pushReplacementNamed(context, '/login'); // Navigate to login page
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const SizedBox(height: 40.0),
                  Image(
                    image: AssetImage('lib/images/my.png'),


                  ),
                  // const SizedBox(height: 60.0),
                  // const Text(
                  //   "Sign up",
                  //   style: TextStyle(
                  //     fontSize: 35,


                      // fontWeight: FontWeight.bold,


                  const SizedBox(height: 20),
                  const Text(
                    "Create your account",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide.none,

                      ),
                      filled: true,
                      fillColor: Color(0xffEBE8FC),

                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xffEBE8FC),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: confirmPasswordController,
                    decoration: const InputDecoration(
                      hintText: "Confirm Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xffEBE8FC),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: signUp,
                child: const Text(
                  "Sign up",
                  style: TextStyle(fontSize: 25),
                ),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color(0xFFF5E6CC), // mint green
                ),
              ),
              const Center(child: Text("Or")),
              // Container(
              //   height: 45,
              //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
              //     border: Border.all(
              //       color: Colors.purple,
              //     ),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.white.withOpacity(0.5),
              //         spreadRadius: 1,
              //         blurRadius: 1,
              //         offset: const Offset(0, 1),
              //       ),
              //     ],
              //   ),
                // child: TextButton(
                //   onPressed: () {},
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Container(
                //         height: 30.0,
                //         width: 30.0,
                //         decoration: const BoxDecoration(
                //           image: DecorationImage(
                //             image: AssetImage('assets/images/login_signup/google.png'),
                //             fit: BoxFit.cover,
                //           ),
                //           shape: BoxShape.circle,
                //         ),
                //       ),
                      // const SizedBox(width: 18),
                      // const Text(
                      //   "Sign In with Google",
                      //   style: TextStyle(
                      //     fontSize: 16,
                      //     color: Colors.purple,






              _loginButton(context),
            ],
          )
    )
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("Already have an account?"),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.purple, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
