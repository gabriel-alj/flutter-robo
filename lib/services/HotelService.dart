import 'package:nac3_info_trip/services/service_config.dart';
import 'package:dio/dio.dart';
import 'package:nac3_info_trip/model/HotelModel.dart';

class HotelService {
  static final String _hotelList =
      "https://5f6bdedf8d5ef70016ca035c.mockapi.io/viajar/";
  static final String _resource = 'hotel';
  final ServiceConfig service = new ServiceConfig(_hotelList);

  // metodo responsável por listar todos os hoteis
  Future<List<HotelModel>> findAll() async {
    List<HotelModel> listaHoteis = new List<HotelModel>();
    try {
      Response response = await service.create().get(_resource);
      if (response.statusCode == 200) {
        response.data.forEach(
          (value) {
            print(value);
            listaHoteis.add(
              HotelModel.fromMap(value),
            );
          },
        );
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
    return listaHoteis;
  }

  //Metodo para adicionar um novo ro
}
