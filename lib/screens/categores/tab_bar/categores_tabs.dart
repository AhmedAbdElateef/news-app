import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newstoday/screens/categores/categories_screens/health.dart';
import 'package:newstoday/screens/categores/categories_screens/politics.dart';
import 'package:newstoday/screens/categores/categories_screens/technology.dart';
import 'package:newstoday/screens/categores/categories_screens/world.dart';
import 'package:newstoday/screens/home_page/cubit/main_cubit.dart';

import '../categories_screens/entertainment.dart';

class CategoresTabBar extends StatelessWidget {
  const CategoresTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        MainCubit cubit = MainCubit.get(context);
        return DefaultTabController(
          length: 5,
          child: Scaffold(
              backgroundColor: cubit.selectThame ? Colors.black : Colors.white,
              appBar: AppBar(
                elevation: 0,
                toolbarHeight: 5,
                backgroundColor:
                    cubit.selectThame ? Colors.black : Colors.white,
                bottom: TabBar(
                    physics: const BouncingScrollPhysics(),
                    indicatorColor: Colors.deepOrange,
                    labelColor: cubit.selectThame ? Colors.white : Colors.black,
                    isScrollable: true,
                    tabs: const [
                      Tab(
                        icon: Icon(
                          Icons.language,
                          color: Colors.deepOrange,
                        ),
                        text: "World",
                      ),
                      Tab(
                        icon: Icon(
                          Icons.health_and_safety_outlined,
                          color: Colors.deepOrange,
                        ),
                        text: "Health",
                      ),
                      Tab(
                        icon: Icon(
                          Icons.computer_outlined,
                          color: Colors.deepOrange,
                        ),
                        text: "Technology",
                      ),
                      Tab(
                        icon: Icon(
                          Icons.flag_circle_outlined,
                          color: Colors.deepOrange,
                        ),
                        text: "Nation",
                      ),
                      Tab(
                        icon: Icon(
                          Icons.tv_outlined,
                          color: Colors.deepOrange,
                        ),
                        text: "Media",
                      ),
                    ]),
              ),
              body:
                  const TabBarView(physics: BouncingScrollPhysics(), children: [
                World(),
                Health(),
                Technology(),
                Politics(),
                Entertainment(),
              ])),
        );
      },
    );
  }
}
