import 'package:flutter/material.dart';
import 'package:healthclick_app/screens/auth/Login.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
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
              //?Main Content
              ListTile(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context); // Voltar para a tela anterior
                  },
                ),
                title:const Center(
                    child: Text(
                    "Editar Perfil",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/dif.jpg"),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Mauro Peniel',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'mauropeniel7@gmail.com',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(30), // Aumenta o arredondamento
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                        color:
                            Colors.grey), // Cor da borda quando não está focado
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Colors.blue), // Cor da borda ao focar
                  ),
                  hintText: 'Escreva o seu nome',
                  prefixIcon: const Icon(Icons.person_2),
                ),
              ),
              const SizedBox(height: 15,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(30), // Aumenta o arredondamento
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                        color:
                            Colors.grey), // Cor da borda quando não está focado
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide:
                        const BorderSide(color: Colors.blue), // Cor da borda ao focar
                  ),
                  hintText: 'Escreva o seu nome',
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity, // ✅ Makes button full width
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: const Text(
                    'Actualizar os Dados',
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