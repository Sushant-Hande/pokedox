import 'package:flutter/cupertino.dart';
import 'package:pokedox/services/api_service.dart';
import '../model/pokedex_response.dart';

class PokedoxViewModel extends ApiService with ChangeNotifier {
  List pokemonItemList = <Pokemon>[];

  Future fetchPokedoxData() async {
    pokemonItemList = await ApiService().fetchData();
    notifyListeners();
  }
}
