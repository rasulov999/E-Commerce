import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/data/models/users/users_model.dart';
import 'package:flutter_task/screens/order/order_screen.dart';
import 'package:flutter_task/state_menegments/blocs/users/users_bloc.dart';
import 'package:flutter_task/state_menegments/cubits/get_user/get_users_cubit.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basket screen"),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         context.read<UsersBloc>().add(AddUsers(
        //             usersModel: UsersModel(
        //                 id: "",
        //                 imgUrl:
        //                     "https://cdn-icons-png.flaticon.com/512/1946/1946429.png",
        //                 name: "Toxir",
        //                 orders: []))); // Navigator.push(
        //       },
        //       icon: Icon(Icons.arrow_forward_outlined))
        // ],
      ),
      body: BlocBuilder<GetUsersCubit, GetUsersState>(
        builder: (context, state) {
          if (state is InitialUserState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadUsersProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadUsersInSuccess) {
            return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderScreen(),
                          ));
                    },
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    leading: Image.network(
                      state.usersModel[index].imgUrl,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(state.usersModel[index].name),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                    color: Colors.black,
                  );
                },
                itemCount: state.usersModel.length);
          } else if (state is LoadUsersInFailure) {
            return Center(
              child: Text(state.error),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
