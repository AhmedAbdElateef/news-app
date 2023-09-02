import 'package:flutter/material.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    size: 170,
                    color: Colors.deepOrange.shade200,
                  ),
                 Text("favorite News" , style: TextStyle(fontSize: 30 , color: Colors.deepOrange.shade200),),
               const  SizedBox( height: 10,),
                ],
              ),
            );
  }
}