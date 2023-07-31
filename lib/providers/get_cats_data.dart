import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/cats_model.dart';

class GetCatsData extends ChangeNotifier{

CatsModel? model = CatsModel();

  void getCatsData() async {
    final Dio dio = Dio();

    final response = await dio.get('https://catfact.ninja/fact');
    model = CatsModel.fromJson(response.data); 
    notifyListeners();
     }
}
  
