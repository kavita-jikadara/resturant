import 'package:flutter/material.dart';

class RestaurantData extends ChangeNotifier {
  var resData = {};

  setResData(data) {
    resData = data;
  }

  getResData() {
    return resData;
  }
}