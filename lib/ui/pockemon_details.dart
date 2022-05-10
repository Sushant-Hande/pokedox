import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../model/pokedex_response.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.pokemon}) : super(key: key);

  Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.4,
                width: width,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: getThemeColor(pokemon.type?.first ?? '', false),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.arrow_back_ios,
                                  color: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              pokemon.name ?? '',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Container(
                                color:
                                getThemeColor(pokemon.type?.first ?? '', true),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                        pokemon.type?.join(', ') ?? '',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -15,
                      right: -25,
                      child: Container(
                        width: 180,
                        height: 180,
                        child: Image.asset('images/pokeball.png'),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 80),
                        child: Container(
                          width: 200,
                          height: 150,
                          child: pokemon.img.toString().isNotEmpty
                              ? CachedNetworkImage(
                            fit: BoxFit.fitHeight,
                            imageUrl: pokemon.img.toString(),
                            placeholder: (context, url) =>
                            const FlutterLogo(),
                          )
                              : const FlutterLogo(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(color: Colors.grey[600], fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Height',
                            style: TextStyle(color: Colors.grey[600], fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Weight',
                            style: TextStyle(color: Colors.grey[600], fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Spawn Time',
                            style: TextStyle(color: Colors.grey[600], fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Weakness',
                            style: TextStyle(color: Colors.grey[600], fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Pre Evolution',
                            style: TextStyle(color: Colors.grey[600], fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Next Evolution',
                            style: TextStyle(color: Colors.grey[600], fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pokemon.name ?? '',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            pokemon.height.toString(),
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            pokemon.weight.toString(),
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            pokemon.spawnTime.toString(),
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            pokemon.weaknesses?.join(", ") ?? '',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            pokemon.prevEvolution?.first.name ?? 'Just Hatched',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            pokemon.nextEvolution?.first.name ?? '',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  Color? getThemeColor(String type, bool isForType) {
    switch (type.toLowerCase()) {
      case 'fire':
        return Colors.red[isForType ? 700 : 400];
      case 'water':
        return Colors.blue[isForType ? 700 : 400];
      case 'grass':
        return Colors.green[isForType ? 700 : 400];
      case 'bug':
        return Colors.lime[isForType ? 700 : 400];
      case 'normal':
        return Colors.grey[isForType ? 700 : 400];
      case 'electric':
        return Colors.yellow[isForType ? 700 : 400];
      case 'dragon':
        return Colors.orange[isForType ? 700 : 400];
      case 'poison':
        return Colors.purple[isForType ? 700 : 400];
      default:
        return Colors.green[isForType ? 700 : 400];
    }
  }
}
