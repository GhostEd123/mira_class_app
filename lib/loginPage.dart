import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mira_class_app/homePage.dart';
import 'package:mira_class_app/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? userEmail;
  String?  userPassword;

  signInFunction(String email, String password){
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then!((UserCredential newUser) {
      String userId = newUser.user!.uid;

      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get()
          .then((_) {
            setState(() {
              // isLoading = false;
            });
            // getX.write(constants.id, userId);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => MyHomePage(id: userId)));
      }).catchError((e) {
        print(e);
      });
    }).catchError((e) {
      print(e);
    });
    

  }
  void _showSnackbar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: Duration(seconds: 20),
        action: SnackBarAction(
          label: 'DONE',
          onPressed: () {
            // You can add functionality to the "Dismiss" button here
            // Navigator.pop(context);
          },
        ),
      ),
    );
  }

  signUpFunction(String email, String password){
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }
  
  // void _showSnackbar(BuildContext context, String content) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(content),
  //       duration: Duration(seconds: 20),
  //       action: SnackBarAction(
  //         label: 'DONE',
  //         onPressed: () {
  //           // You can add functionality to the "Dismiss" button here
  //           // Navigator.pop(context);
  //         },
  //       ),
  //     ),
  //   );
  // }
   
  bool myObscureText = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                "Welcome back! You've been missed!",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 25),

              //username textfield
              TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: myObscureText,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      labelText: "Email",
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey[500]))),
              const SizedBox(height: 25),

              //password textfield
              TextField(
                  controller: passwordController,
                  obscureText: !myObscureText,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            myObscureText = !myObscureText;
                          });
                        },
                        child: Icon(
                          myObscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      labelText: "Password",
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey[500]))),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return const ForgotPasswordPage();
                        // }));
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    SizedBox(
                      width: 150,
                      height: 45,
                      child: ElevatedButton(
                          onPressed: () {
                            // name = emailController.text.trim();
                            if (emailController.text.trim().isEmpty ||
                                passwordController.text.trim().isEmpty) {
                                  print("started!!!!");
                                  _showSnackbar(context, "Email mst be filled");
                            } else {
                              getX.write(user_details.GETX_EMAIL, emailController.text.trim());
                              userEmail = emailController.text.trim();
                              userPassword = passwordController.text.trim();
                              print(user_details.GETX_EMAIL);
                              print(emailController.text.trim());
                              signUpFunction(userEmail! , userPassword!);
                              // Get.to( MyHomePage(title: "title", name: "name"));
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) => MyHomePage(title: "title", name: emailController.text.trim())));
                            }
                          },
                          child: Text("Sign In")),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
