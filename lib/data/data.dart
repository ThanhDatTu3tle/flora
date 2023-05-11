import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flora/models/Category.dart';
import 'package:flora/models/Flower.dart';
import 'package:flutter/services.dart';

class ReadData {
  String baseApiGetCategory = 'http://localhost:5000/category';

  String baseApiGetFlowerList = 'http://localhost:5000/product';

  Future<List<CategoryModel>> loadData() async {
    var data = await Dio().get(baseApiGetCategory);

    var dataJson = jsonDecode(data.data.toString());

    return (dataJson as List).map((e) => CategoryModel.fromJson(e)).toList();
  }

  Future<List<Flower>> loadDataList() async {
    var data = await Dio().get(baseApiGetFlowerList);

    var dataJson = jsonDecode(data.data.toString().replaceAll('" "', '","'));

    return (dataJson as List).map((e) => Flower.fromJson(e)).toList();
  }
}