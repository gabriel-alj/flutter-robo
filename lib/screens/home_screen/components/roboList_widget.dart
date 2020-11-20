import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nac3_info_trip/model/RoboModel.dart';
import 'package:nac3_info_trip/screens/details_screen/robo_detail_screen.dart';
import 'package:nac3_info_trip/screens/home_screen/components/roboItem.dart';
import 'package:nac3_info_trip/store/trip_store.dart';
import 'package:provider/provider.dart';

class RoboListWidget extends StatelessWidget {
  const RoboListWidget({
    Key key,
    @required this.tripStore,
  }) : super(key: key);

  final TripStore tripStore;

  @override
  Widget build(BuildContext context) {
    final _tripStore = Provider.of<TripStore>(context);
    return Expanded(
      child: Container(
        decoration: new BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(2, 120, 174, 1),
              offset: Offset(1.0, 6.0),
              blurRadius: 300.0,
            ),
          ],
        ),
        child: Observer(
          name: 'ListaHomePage',
          builder: (BuildContext context) {
            return (tripStore.listaHoteis.length != 0)
                ? AnimationLimiter(
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      addAutomaticKeepAlives: true,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1),
                      itemCount: tripStore.listaHoteis.length,
                      itemBuilder: (context, index) {
                        RoboModel robo = tripStore.getRobo(index: index);
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          columnCount: 1,
                          child: ScaleAnimation(
                            child: GestureDetector(
                              child: RoboItem(
                                index: index,
                                nome: robo.nome,
                                imagePath: robo.imagePath,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          RoboDetailScreen(
                                        index: index,
                                      ),
                                    ));
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
