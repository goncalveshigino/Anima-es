import 'package:flutter/material.dart';

class SliderModel extends ChangeNotifier{


  double _currentPage = 0;

  double get currentPage  => this._currentPage;

  set currentPage( double pagina){
    this._currentPage = pagina;

    print(pagina);

    notifyListeners();
  }

}