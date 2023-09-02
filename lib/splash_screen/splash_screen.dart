import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/home_page/cubit/main_cubit.dart';
import '../screens/home_page/home_nav_page.dart';

class SpilachScreen extends StatefulWidget {
  const SpilachScreen({super.key});

  @override
  State<SpilachScreen> createState() => _SpilachScreenState();
}

class _SpilachScreenState extends State<SpilachScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      moveToAppHomeScreen();
    });
  }

  void moveToAppHomeScreen() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return Scaffold(
          backgroundColor:
              cubit.selectThame?Colors.black :Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRY6rDdGi_H5HMgEdFg87acPt4jXQOpV9xjKy-3BAxFYU22W5zyT8rg4mmrjAjTtc8tdho&usqp=CAU"))),
                ),
                const SizedBox(
                  height: 150,
                ),
                const CircularProgressIndicator(
                  color: Colors.deepOrange,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
