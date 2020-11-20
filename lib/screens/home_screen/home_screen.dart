import 'package:flutter/material.dart';
import 'package:nac3_info_trip/const/conts_app.dart';
import 'package:nac3_info_trip/store/trip_store.dart';
import 'package:provider/provider.dart';
import 'components/roboList_widget.dart';
import 'components/searchbar_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  // TripStore tripStore;
  @override
  // void initState() {
  //   super.initState();
  //   tripStore = TripStore();
  //   tripStore.atualizarListaHoteis();
  // }

  @override
  Widget build(BuildContext context) {
    final _tripStore = Provider.of<TripStore>(context);

    if (_tripStore.listaHoteis.length == 0) {
      _tripStore.atualizarListaHoteis();
    }
    double tamanhoTela =
        MediaQuery.of(context).size.width; // pegar o tamanho da tela

    double tamanhoStatusTela =
        MediaQuery.of(context).padding.top; // Pega o tamanho do status bar

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromRGBO(81, 173, 207, 1),
      body: Stack(
        alignment: Alignment.center,
        overflow: Overflow.visible, // Permite que posicionemos o widget
        children: <Widget>[
          Positioned(
            top: -(150 / 4.7),
            left: tamanhoTela - 240,
            child: Opacity(
                child: Image.asset(
                  ConstsApp.praiseSun,
                  height: 240,
                  width: 240,
                ),
                opacity: 0.5),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: tamanhoStatusTela,
                ),
                //SearbarWidget(), // importando meu widget de pesquisa
                // Container abaixo será responsável por ter a lista
                RoboListWidget(tripStore: _tripStore),
              ],
            ),
          ),
        ],
      ), //Responsável por colocar um Widget acima do outro (empilhar)
    );
  }
}
