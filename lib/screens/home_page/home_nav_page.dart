import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newstoday/screens/home_page/cubit/main_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return Scaffold(
            backgroundColor: cubit.selectThame?Colors.black:Colors.white,
            appBar: AppBar(
              backgroundColor: cubit.selectThame? Colors.black : Colors.white,
              //change icon drawer ....
               iconTheme:  IconThemeData(color: cubit.selectThame? Colors.white :Colors.black),
              actions: [
                IconButton(
                    splashColor: Colors.deepOrange,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    ))
              ],
              title: Text(
                cubit.titles[cubit.selected],
                style:  TextStyle(color: cubit.selectThame?Colors.white :Colors.black, fontSize: 25),
              ),
              elevation: 0,
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 5),
              child: BottomNavigationBar(
                backgroundColor: cubit.selectThame?Colors.black:Colors.white,
                elevation: 10,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: cubit.selectThame?Colors.white:Colors.black,
                 
                currentIndex: cubit.selected,
                items:  [
                  BottomNavigationBarItem(
                      icon:const Icon(Icons.business),
                      label: "Business",
                      backgroundColor: cubit.selectThame?Colors.black:Colors.white,
                        ),
                  BottomNavigationBarItem(
                    icon:const Icon(Icons.sports_football_outlined),
                    label: "sports",
                    backgroundColor: cubit.selectThame?Colors.black:Colors.white,
                  ),
                  BottomNavigationBarItem(
                      icon:const Icon(Icons.science_outlined),
                      label: "science",
                      backgroundColor: cubit.selectThame?Colors.black:Colors.white,
                      ),
                      BottomNavigationBarItem(
                      icon:const Icon(Icons.language_outlined),
                      label: "World",
                      backgroundColor: cubit.selectThame?Colors.black:Colors.white,
                        ),
                  BottomNavigationBarItem(
                      icon:const Icon(Icons.favorite_outline_sharp),
                      label: "favorite" ,
                      backgroundColor: cubit.selectThame?Colors.black:Colors.white,),
                  BottomNavigationBarItem(
                      icon:const Icon(Icons.settings), label: "Settinges",
                      backgroundColor: cubit.selectThame?Colors.black:Colors.white,),
                ],
                onTap: (value) {
                  cubit.changeSelected(value);
                },
              ),
            ),
            body: cubit.screens[cubit.selected],
          );
        },
      ),
    );
  }
}
