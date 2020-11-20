import 'package:dio/dio.dart';
import 'package:nac3_info_trip/model/RoboModel.dart';
import 'package:nac3_info_trip/services/service_config.dart';

class RoboService {
  static final String _endpoint =
      "https://5fb5bdd436e2fa00166a4943.mockapi.io/api/robos";

  static final String _resource = 'robos';

  // Importar a configuração de Service. Aparentemente é padrão
  final ServiceConfig service = new ServiceConfig(_endpoint);

  Future<int> create(RoboModel roboModel) async {
    try {
      roboModel.id = 0;
      Response response = await service.create().post(
            _resource,
            data: roboModel.toMap(),
          );

      if (response.statusCode == 201) {
        var retorno = (response.data["id"] is String)
            ? int.parse(response.data["id"])
            : response.data["id"];
        return retorno;
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  // metodo responsável por listar todos os robos
  Future<List<RoboModel>> findAll() async {
    List<RoboModel> listaHoteis = new List<RoboModel>();
    try {
      Response response = await service.create().get(_resource);
      if (response.statusCode == 200) {
        response.data.forEach(
          (value) {
            print(value);
            listaHoteis.add(
              RoboModel.fromMap(value),
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


}
