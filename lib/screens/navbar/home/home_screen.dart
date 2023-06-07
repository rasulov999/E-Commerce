import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/data/models/products/products_model.dart';
import 'package:flutter_task/state_menegments/blocs/bloc/add_product_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         context.read<AddProductBloc>().add(AddProducts(
        //             productsModel: ProductsModel(
        //                 id: "",
        //                 count: 1,
        //                 name: "Big Bear",
        //                 price: 20000,
        //                 imgUrl:
        //                     "https://i.pinimg.com/736x/f1/2b/8a/f12b8a29e288f504a47268def0d6be1b.jpg")));
        //       },
        //       icon: Icon(Icons.add))
        // ],
      ),
    );
  }
}
