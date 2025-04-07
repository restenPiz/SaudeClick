import 'package:flutter/material.dart';
import 'package:healthclick_app/screens/welcome/HomePage.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 20,
              // ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/back.png",
                    width: 500,
                    height: 550,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              const Text('Bem Vindo ao Aplicativo SaúdeClick',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Este é um aplicativo criado para atender à demanda por medicamentos em Moçambique e outros países. O aplicativo visa automatizar os processos de compra e entrega de medicamentos a pacientes ou beneficiários.',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity, // ✅ Makes button full width
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: const Text(
                    'Próximo',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}