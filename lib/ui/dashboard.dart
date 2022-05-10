import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedox/ui/pockemon_details.dart';
import 'package:pokedox/viewmodel/pokedox_view_model.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    Provider.of<PokedoxViewModel>(context, listen: false).fetchPokedoxData();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PokedoxViewModel>(context);
    double width = MediaQuery.of(context).size.width;
    List pokemonList = vm.pokemonItemList;
    return Scaffold(
        body: Column(
          children: [
            Container(
              height: 120,
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12, top: 20),
                    child: Text(
                      'Pokedex',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  Image.asset('images/pokeball.png')
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.4,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => DetailScreen(
                            pokemon: pokemonList[index],
                          )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                color: getThemeColor(
                                    pokemonList[index].type?.first ?? '', false),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              bottom: -30,
                              right: -20,
                              child: Container(
                                width: 120,
                                height: 120,
                                child: Image.asset('images/pokeball.png'),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                child: pokemonList[index].img.toString().isNotEmpty
                                    ? CachedNetworkImage(
                                  imageUrl: pokemonList[index].img.toString(),
                                  placeholder: (context, url) =>
                                  const FlutterLogo(),
                                )
                                    : const FlutterLogo(),
                              ),
                            ),
                            Positioned(
                              left: 8,
                              top: 0,
                              bottom: 0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pokemonList[index].name ?? '',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Container(
                                      color: getThemeColor(
                                          pokemonList[index].type?.first ?? '',
                                          true),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                            child: Text(
                                              pokemonList[index].type?.first ?? '',
                                              style: TextStyle(color: Colors.white),
                                            )),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: pokemonList.length,
              ),
            ),
          ],
        ));
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