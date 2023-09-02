import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newstoday/screens/home_page/cubit/main_cubit.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        MainCubit cubit = MainCubit.get(context);
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Card(
                color: Colors.deepOrange,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    cubit.selectThame
                        ? const Icon(
                            Icons.sunny,
                            color: Colors.amber,
                            size: 30,
                          )
                        : const Icon(
                            Icons.dark_mode,
                            color: Colors.black,
                            size: 30,
                          ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        cubit.selectThame ? "Light Theme" : "Dark Theme",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    
                    Switch(
                        activeColor: Colors.black,
                        value: cubit.selectThame,
                        onChanged: (val) {
                          cubit.changeThame(val);
                        })
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
