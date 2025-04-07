import 'package:flutter/material.dart';
import 'package:healthclick_app/screens/auth/Login.dart';
import 'package:healthclick_app/screens/layouts/AppBottom.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _currentIndex = 1;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ListTile modificada com o IconButton de voltar
              ListTile(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context); // Voltar para a tela anterior
                  },
                ),
                title: const Text(
                  "Ola Mauro Peniel",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text('Detalhes do Produto',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              const SizedBox(height: 30),
              Container(
                width: 500,
                height: 400,
                margin: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/back3.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Text(
                  'Paracetamol',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                trailing: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 150,
                    height: 24,
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Categoria',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 10,
              ),
              const ListTile(
                leading: Text(
                  '100MT',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
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
                      'Add to Cart',
                      style: TextStyle(fontSize: 20),
                    ),
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
