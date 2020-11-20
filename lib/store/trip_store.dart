import 'package:mobx/mobx.dart';
import 'package:nac3_info_trip/model/RoboModel.dart';
import 'package:nac3_info_trip/services/RoboService.dart';
part 'trip_store.g.dart';

class TripStore = _TripStoreBase with _$TripStore;

abstract class _TripStoreBase with Store {
  final RoboService _roboService = RoboService();
  List<RoboModel> _roboModel = <RoboModel>[];
  @observable
  TripStore _tripObserver;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<RoboModel> listaHoteis = <RoboModel>[].asObservable();

  @observable
  String filtro = "";

  @computed
  TripStore get tripObserver => _tripObserver;

  _TripStore() {
    init();
  }

  init() async {
    isLoading = true;
    _roboModel = await _roboService.findAll();
    listaHoteis = _roboModel.asObservable();
    isLoading = false;
  }

  // Responsável por pegar um item da lista
  @action
  getRobo({int index}) {
    return listaHoteis[index];
  }

  // responsável por atualizar a lista
  @action
  atualizarListaHoteis() async {
    _tripObserver = null;
    init();
  }

  @action
  setFilter(value) {
    filtro = value;
  }

  @computed
  List<RoboModel> get filtered {
    if (filtro.isEmpty) {
      return listaHoteis;
    } else {
      var lista = listaHoteis
          .where((robo) => robo.nome.toLowerCase().contains(
                filtro.toLowerCase(),
              ))
          .toList();
      return lista;
    }
  }

  @computed
  int get quantidade {
    return listaHoteis.length;
  }
}
