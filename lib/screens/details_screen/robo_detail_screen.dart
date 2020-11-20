import 'package:flutter/material.dart';
import 'package:nac3_info_trip/model/RoboModel.dart';
import 'package:nac3_info_trip/store/trip_store.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class RoboDetailScreen extends StatelessWidget {
  final int index;
  final String nome;
  final String imagePath;

  const RoboDetailScreen({Key key, this.index, this.nome, this.imagePath})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _tripStore = Provider.of<TripStore>(context);
    RoboModel robo = _tripStore.getRobo(index: this.index);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          robo.nome,
        ),
        elevation: 0,
        backgroundColor: Color.fromRGBO(2, 120, 174, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(2, 120, 174, 1),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(robo.imagePath), fit: BoxFit.fill),
            ),
            height: MediaQuery.of(context).size.height / 2.5,
          ),
          SlidingSheet(
            elevation: 8,
            cornerRadius: 16,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.6, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelValue('Robo'),
                      fieldValue(robo.nome),
                      espaco(),
                      labelValue('Tipo'),
                      fieldValue(robo.tipo),
                      espaco(),
                      labelValue('Status'),
                      fieldValue(robo.status),
                      espaco(),
                      labelValue('Data de Criação'),
                      fieldValue(robo.dtCriacao),
                      espaco(),
                      labelValue('Data de Atualização'),
                      fieldValue(robo.dtAtualizacao),
                      espaco(),
                      labelValue('Comportamento'),
                      fieldValue(robo.comportamento),
                      espaco(),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

SizedBox espaco() => SizedBox(
      height: 16,
    );
Widget labelValue(String _label) {
  return Text(
    '$_label:',
    textAlign: TextAlign.left,
    style: TextStyle(
      color: Color.fromRGBO(64, 75, 96, 1),
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w800,
      fontSize: 18,
    ),
  );
}

Widget fieldValue(String _value) {
  return Text(
    _value,
    style: TextStyle(
      color: Color.fromRGBO(64, 75, 96, .9),
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 20,
    ),
  );
}
