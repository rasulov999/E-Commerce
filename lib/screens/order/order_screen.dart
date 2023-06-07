import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/screens/order/widget/button.dart';
import 'package:flutter_task/screens/order/widget/total_price_container.dart';
import 'package:flutter_task/state_menegments/cubits/get_products/get_products_cubit.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TotalOrderContainer(
        price: 3,
      ),
      appBar: AppBar(
        title: const Text("Order Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: BlocBuilder<GetProductsCubit, GetProductsState>(
          builder: (context, state) {
            if (state is InitialProductsState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadProductsProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadProductsInSuccess) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                children: List.generate(
                  state.productsModel.length,
                  (index) => ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 20),
                    leading: Image.network(state.productsModel[index].imgUrl),
                    title: Text(state.productsModel[index].name),
                    subtitle: Text("${state.productsModel[index].price} so'm"),
                    trailing: MyButton(
                      count: state.productsModel[index].count,
                    ),
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
