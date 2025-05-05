import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/news_data_widgets.dart';
import 'package:news_app/model/get_news_response_model.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  Dio dio = Dio();
  bool isLoading = true;

  GetNewsResponseModel? responseModel;

  getNews() async {
    // print("MMM");
    var response = await dio.get(
        "https://gnews.io/api/v4/top-headlines?category=general&lang=ml&country=in&max=10&apikey=65eff5d7d4a93681f4b6a9938a3c47cc");
    responseModel = GetNewsResponseModel.fromJson(response.data);
    // print(responseModel);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getNews();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.white12, Colors.grey])),
        ),
        leading: Builder(
          builder: (context) {
            return const Icon(
              Icons.newspaper,
              size: 35,
              color: Colors.white,
            );
          },
        ),
        title: const Text(
          "News",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(
            Icons.qr_code_scanner,
            size: 30,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body:isLoading ?const Center(child: CircularProgressIndicator(),): PageView.builder(
        itemCount: responseModel!.articles!.length,
        scrollDirection: Axis.vertical,
        pageSnapping: true,
        itemBuilder: (context, index) => NewsDataWidgets(
          individuals: responseModel!.articles![index],
        ),
        // PageView(
        //     scrollDirection: Axis.vertical,
        //     pageSnapping: true,
        //     children: [
        //       NewsDataWidgets(
        //           textColor: Colors.brown,
        //           text:
        //           'Nifty 50, Sensex crash over 1% each; why Indian stock market is down today? Explained',
        //           image: AssetImage("assets/images/sensex.jpg"),
        //           newstext:
        //           "Inflation in the US has yet to reach the US Fed's 2 per cent target. As the US central bank has reiterated that inflation remains its key focus area in deciding policy rates, concerns prevail that the Fed may go soft on rate reduction.",
        //           time: "02/12/2024"),
        //     ]),
      ),
    );
  }
}
