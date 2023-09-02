import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newstoday/screens/home_page/cubit/main_cubit.dart';
import 'package:newstoday/widgets/coustom_contanier.dart';

class SciencePage extends StatelessWidget {
  const SciencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()..getNewsCategories('science'),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          MainCubit cubit = MainCubit.get(context);
          if (cubit.newsSports.isNotEmpty) {
            return RefreshIndicator(
              color: Colors.deepOrange,
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 2));
                cubit.getNewsCategories('business');
              },
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => CoustomContaner(
                    url: cubit.newsSports[index].url,
                    image: cubit.newsSports[index].image,
                    desc: cubit.newsSports[index].description,
                    date: cubit.newsSports[index].date,
                    content: cubit.newsSports[index].content,
                    title: cubit.newsSports[index].title,),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: cubit.newsSports.length),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.science,
                    size: 170,
                    color: Colors.deepOrange.shade200,
                  ),
                  Text(
                    "Loading Science News",
                    style: TextStyle(
                        fontSize: 30, color: Colors.deepOrange.shade200),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CircularProgressIndicator(
                    color: Colors.deepOrange,
                  )
                ],  
              ),
            );
          }
        },
      ),
    );
  }
}
