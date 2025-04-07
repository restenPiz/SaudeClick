// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:healthclick_app/screens/layouts/AppBottom.dart';
import 'package:healthclick_app/screens/pharmacy/PharmacyDetails.dart';

class Pharmacy extends StatefulWidget {
  const Pharmacy({super.key});

  @override
  State<Pharmacy> createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {

   int _currentIndex = 2;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // Dados fictícios de farmácias
  final List<Map<String, String>> pharmacies = [
    {
      'name': 'Farmácia São João',
      'address': 'Rua A, 123',
      'image': 'assets/pharmacy1.jpg'
    },
    {
      'name': 'Farmácia Popular',
      'address': 'Rua B, 456',
      'image': 'assets/pharmacy2.jpg'
    },
    {
      'name': 'Farmácia do Trabalhador',
      'address': 'Rua C, 789',
      'image': 'assets/pharmacy3.jpg'
    },
    {
      'name': 'Farmácia Milagre',
      'address': 'Rua D, 101',
      'image': 'assets/pharmacy4.jpg'
    },
    {
      'name': 'Farmácia Bem Estar',
      'address': 'Rua E, 202',
      'image': 'assets/pharmacy5.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //?Main content starts here
              ListTile(
                leading: const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/dif.jpg"),
                ),
                title: const Text(
                  "Olá Mauro Peniel",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              const SizedBox(height: 30),
              //?ListView of pharmacies
              const Text(
                "Farmácias Próximas",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap:
                    true,
                physics:
                    NeverScrollableScrollPhysics(), 
                itemCount: pharmacies.length,
                itemBuilder: (context, index) {
                  final pharmacy = pharmacies[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(pharmacy['image']!),
                      ),
                      title: Text(
                        pharmacy['name']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(pharmacy['address']!),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PharmacyDetails()),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          onPressed: () {}),
    );
  }
}
