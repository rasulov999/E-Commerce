import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/data/repository/products_repository.dart';
import 'package:flutter_task/data/repository/users_repository.dart';
import 'package:flutter_task/screens/navbar/bottom_navbar.dart';
import 'package:flutter_task/state_menegments/blocs/bloc/add_product_bloc.dart';
import 'package:flutter_task/state_menegments/blocs/users/users_bloc.dart';
import 'package:flutter_task/state_menegments/cubits/get_products/get_products_cubit.dart';
import 'package:flutter_task/state_menegments/cubits/get_user/get_users_cubit.dart';
import 'package:flutter_task/state_menegments/cubits/navbar_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
              create: (context) => ProductsRepository(
                  firebaseFirestore: FirebaseFirestore.instance)),
          RepositoryProvider(
              create: (context) => UsersRepository(
                  firebaseFirestore: FirebaseFirestore.instance)),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => NavbarCubit(),
            ),
            BlocProvider(
              create: (context) => GetProductsCubit(
                  repository: context.read<ProductsRepository>()
                    ..getProducts()),
            ),
            BlocProvider(
              create: (context) => AddProductBloc(
                  productsRepository: context.read<ProductsRepository>()),
            ),
            BlocProvider(
              create: (context) =>
                  UsersBloc(usersRepository: context.read<UsersRepository>()),
            ),
            BlocProvider(
              create: (context) => GetUsersCubit(
                  usersRepository: context.read<UsersRepository>()),
            )
          ],
          child: const MyApp(),
        ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}
