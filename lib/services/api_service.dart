import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/pokedex_response.dart';
import 'networking_service.dart';

class ApiService extends NetWorkingService{
  Future<List<Pokemon>> fetchData() async{
    var response = await http.get(Uri.parse('https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json'));
    var data = json.decode(response.body);
    return PokedexResponse.fromJson(data).pokemon as List<Pokemon>;
  }
}