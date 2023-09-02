import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newstoday/screens/home_page/cubit/main_cubit.dart';

// ignore: must_be_immutable
class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.url, required this.content});
  String url;
  String content;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          MainCubit cubit = MainCubit.get(context);
          return Scaffold(
            backgroundColor: cubit.selectThame ? Colors.black : Colors.white,
            appBar: AppBar(
              title: Text(
                "Details News",
                style: TextStyle(
                    fontSize: 25,
                    color: cubit.selectThame ? Colors.white : Colors.black),
              ),
              elevation: 0,
              backgroundColor: cubit.selectThame ? Colors.black : Colors.white,
              iconTheme: IconThemeData(
                  color: cubit.selectThame ? Colors.white : Colors.black),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Center(
              child: Container(
                // height: 650,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Read More ",
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                    SizedBox(
                      // height: 450,
                      width: double.infinity,
                      child: Text(
                        content,
                        maxLines: 16,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const Text("Go to website ",
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                    InkWell(
                      onTap: () {
                        cubit.launchURL(url);
                      },
                      child: SizedBox(
                        height: 100,
                        child: Text(
                          url,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
