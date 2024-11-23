import 'package:flutter/material.dart';
import 'package:wish_list/utils/router/route_names.dart';

class CheckOutModel extends ChangeNotifier{
  int currentPage = 0;
  goToPage(index){
    currentPage = index;
    notifyListeners();
  }
  nextPage(){
    currentPage+=1;
    notifyListeners();
  }
  checkout(context){
    Navigator.pushNamed(context, RouteNames.reviewOrderScreen);
  }
}