import 'package:flutter/material.dart';
import 'package:healthclick_app/models/CartProvider.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    // Obtendo o estado do carrinho do CartProvider
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Carrinho de Compras'),
      //   backgroundColor: Colors.green,
      // ),
      body: cart.items.isEmpty
          ? Container(
            child: Column(
              children: [
                const SizedBox(
                    height: 35,
                  ),
                ListTile(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context); 
                    },
                  ),
                  title: const Text(
                    "Ola Mauro Peniel",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                const SizedBox(height: 450,),
                const Center(
                  child: Text('O seu carrinho esta vazio',style: TextStyle(fontSize: 20),),
                )
              ],
            ),
          )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context); // Voltar para a tela anterior
                        },
                      ),
                      title: const Text(
                        "Ola Mauro Peniel",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            leading: Image.asset(cart.items[index].image),
                            title: Text(cart.items[index].name, style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                'Preço: ${cart.items[index].price.toString()} MZN', 
                                ),
                            trailing: IconButton(
                              icon: const Icon(Icons.remove_circle),
                              onPressed: () {
                                // Remover item do carrinho
                                cart.removeItem(cart.items[index]);
                              },
                            ),
                          ),
                        );
                      },
                    ),

                    // Exibindo o total
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total: ${cart.totalPrice} MZN',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Finalizar Compra'),
                                content:
                                    const Text('Deseja finalizar sua compra?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Finalizar a compra aqui
                                      Navigator.of(context).pop();
                                      // Pode redirecionar para uma página de sucesso ou limpar o carrinho
                                      cart.clearCart();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text('Compra finalizada')));
                                    },
                                    child: const Text('Finalizar'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Text('Finalizar Compra',style: TextStyle(fontSize: 18),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
