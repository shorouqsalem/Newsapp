import 'dart:convert';

import '../models/artical_model.dart';
import 'package:http/http.dart'as http;

class News {
  List<ArticalModel>news=[];
  Future<void> getNews() async{
     String  url="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a986e598ef4b43c88ec5ccd6522882ee";
     final Uri urL=Uri.parse(url);
    
  var response =await http.get(urL);
  var jsonData =jsonDecode(response.body);
  if (jsonData['status']=='ok') {
    jsonData["articles"].forEach((element){
      if (element['urlToImage']!=null && element['description'] !=null ) {
        ArticalModel articalModel=ArticalModel(
          title: element['title'],
          author: element['author'],
          description: element['description'],
          content: element['content'], 
          url:element['url'] , 
          urlToImage:element['urlToImage'] ,

          

        );
        //ading thisModel to news

        news.add(articalModel);
        
      }


    });

    
    
  }

  }

}