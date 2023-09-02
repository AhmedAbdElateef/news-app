import 'package:flutter/material.dart';
import 'package:newstoday/screens/details.dart';

// ignore: must_be_immutable
class CoustomContaner extends StatelessWidget {
  CoustomContaner({
    super.key,
    required this.title,
    required this.url,
    required this.date,
    required this.image,
    required this.desc,
    required this.content,
    // required this.supTitle
  });
  // String supTitle;
  String url;
  String title;
  String date;
  String desc;
  String content;
  String image;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomRight, children: [
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  content: content,
                  url: url,
                ),
              ));
        },
        child: Container(
          height: 250,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.deepOrange),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 10),
                child: SizedBox(
                    width: 100, height: 150, child: Image.network(image)),
              ),
              SizedBox(
                  width: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(title,
                          maxLines: 3,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20)),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: Text(
                          desc,
                          textAlign: TextAlign.end,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        date,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 7, right: 15),
        child: IconButton(
            onPressed: () {}, icon: const Icon(Icons.favorite_border)),
      )
    ]);
  }
}
