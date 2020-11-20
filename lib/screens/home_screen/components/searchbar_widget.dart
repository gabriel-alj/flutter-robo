import 'package:flutter/material.dart';
import 'package:nac3_info_trip/store/trip_store.dart';

class SearbarWidget extends StatelessWidget {
  const SearbarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TripStore tripStore = TripStore();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          border: new OutlineInputBorder(
              borderSide:
                  new BorderSide(color: Color.fromRGBO(81, 173, 207, 1))),
          hintText: 'Qual o Robo gostaria de encontrar?',
          labelText: 'Robo',
          prefixIcon: const Icon(
            Icons.search,
            color: Color.fromRGBO(81, 173, 207, 1),
          ),
          filled: true,
          fillColor: Color.fromRGBO(255, 255, 255, 0.3),
        ),
        onChanged: tripStore.setFilter,
      ),
    );
  }
}
