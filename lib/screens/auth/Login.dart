// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:healthclick_app/screens/auth/CreateAccount.dart';
import 'package:healthclick_app/screens/auth/ForgotPassword.dart';
import 'package:healthclick_app/screens/welcome/OnBoarding.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false; // Checkbox state
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start, // Align text properly
            children: [
              //? Image Section
              Center(
                child: Image.asset(
                  "assets/Saude.png",
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              //? Title and Input
              const Text(
                'Sign in to your Account',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              //? Input Field
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(30), // Aumenta o arredondamento
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                        color:
                            Colors.grey), // Cor da borda quando não está focado
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        BorderSide(color: Colors.blue), // Cor da borda ao focar
                  ),
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20),

              //? Password Field
              TextField(
                obscureText: true, // Esconde o texto (ideal para senhas)
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30), // Aumenta o arredondamento
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey), // Cor da borda quando não está focado
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.blue), // Cor da borda ao focar
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //?Creating account section
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CreateAccount()), 
                  );
                },
                child: Text(
                  "Create an account",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
              const SizedBox(height: 20),
              //?Remember me and Forget password section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isChecked = newValue!;
                          });
                        },
                      ),
                      Text("Remember Me"),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()),
                      );
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.blue, // Makes it look like a link
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              //?Login button section
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity, // ✅ Makes button full width
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnBoarding()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 20),
                        ),
                        child: const Text('Login',style: TextStyle(fontSize: 20),),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("Or Sign Up With"),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/google.png",
                              width: 24, 
                              height: 24,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Continue with Google',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.apple,
                                size: 30, color: Colors.white), // Apple icon
                            SizedBox(width: 10),
                            Text('Continue with Apple',
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
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
