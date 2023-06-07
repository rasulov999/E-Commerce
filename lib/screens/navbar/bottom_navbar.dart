import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/screens/navbar/basket/basket_screen.dart';
import 'package:flutter_task/screens/navbar/home/home_screen.dart';
import 'package:flutter_task/screens/navbar/profile/profile_screen.dart';
import 'package:flutter_task/state_menegments/cubits/navbar_cubit.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> screens = [];
  @override
  void initState() {
    screens = [
      HomeScreen(),
      BasketScreen(),
      ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, int>(
      builder: (context, state) {
        var index = context.watch<NavbarCubit>().activeIndex;

        return Scaffold(
          body: IndexedStack(
            index: index,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                context.read<NavbarCubit>().nextPage(value);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_basket), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
              ]),
        );
      },
    );
  }
}
