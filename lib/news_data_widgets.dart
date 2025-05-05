import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/get_news_response_model.dart';

class NewsDataWidgets extends StatefulWidget {
  //
  final Article individuals;

  const NewsDataWidgets(
      {super.key,
      required this.individuals});

  @override
  State<NewsDataWidgets> createState() => _NewsDataWidgetsState();
}

class _NewsDataWidgetsState extends State<NewsDataWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.grey,Colors.blue,Colors.blueGrey,CupertinoColors.inactiveGray])),
            // color: widget.textColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.individuals.title??"",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      widget.individuals.image??"",
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.individuals.source!.name.toString(),
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.individuals.description??"",maxLines: 12,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            )),

        // child: Column(
        //    children: [Text(widget.Text)],
        // ),
        // child: Column(
        //   children: [
        //    Padding(
        //      padding: const EdgeInsets.only(right: 280),
        //      child: Row(children: [
        //
        //      ],),
        //    )
        //   ],
        // ),
      ),
    );
  }
}
