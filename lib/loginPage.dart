import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Email and Password must be filled'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            // You can add functionality to the "Dismiss" button here
            // Navigator.pop(context);
          },
        ),
      ),
    );
  }
  bool myObscureText = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                            if (emailController.text.trim().isEmpty &&
                                passwordController.text.trim().isEmpty) {
                                  print("started!!!!");
                                  _showSnackbar(context);
                            } else {
                              Navigator.pushNamed(context, "/");
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
