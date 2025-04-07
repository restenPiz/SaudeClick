import 'package:flutter/material.dart';
import 'package:healthclick_app/screens/auth/Login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start, // Align text properly
            children: [
              Center(
                child: Image.asset(
                  "assets/Saude.png",
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15,),
              const Center(child: Text('Enter your email address to reset your password.'),),
              const SizedBox(height: 20,),
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
               const SizedBox(
                height: 20
              ),
              SizedBox(
                width: double.infinity, // ✅ Makes button full width
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: const Center(
                  child: const Text('Remember Your Password? Sign In', style: TextStyle(
                    color: Colors.blue
                  ),),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}