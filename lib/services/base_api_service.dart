import 'package:http/http.dart' as http;

abstract class BaseApiService{
  String baseUrl = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  Future<dynamic> getResponse();
}