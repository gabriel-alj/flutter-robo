// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TripStore on _TripStoreBase, Store {
  Computed<List<RoboModel>> _$filteredComputed;

  @override
  List<RoboModel> get filtered =>
      (_$filteredComputed ??= Computed<List<RoboModel>>(() => super.filtered,
              name: 'tripStore.filtered'))
          .value;
  Computed<int> _$quantidadeComputed;

  @override
  int get quantidade => (_$quantidadeComputed ??=
          Computed<int>(() => super.quantidade, name: '_TripStore.quantidade'))
      .value;

  final _$filtroAtom = Atom(name: '_TripStore.filtro');

  @override
  String get filtro {
    _$filtroAtom.reportRead();
    return super.filtro;
  }

  @override
  set filtro(String value) {
    _$filtroAtom.reportWrite(value, super.filtro, () {
      super.filtro = value;
    });
  }

  final _$listaHoteisAtom = Atom(name: '_TripStore.listaHoteis');

  @override
  ObservableList<RoboModel> get listaHoteis {
    _$listaHoteisAtom.reportRead();
    return super.listaHoteis;
  }

  @override
  set listaHoteis(ObservableList<RoboModel> value) {
    _$listaHoteisAtom.reportWrite(value, super.listaHoteis, () {
      super.listaHoteis = value;
    });
  }

  final _$findAllTripAsyncAction = AsyncAction('_TripStore.findAll');

  @override
  Future atualizarListaHoteis() {
    return _$findAllTripAsyncAction.run(() => super.atualizarListaHoteis());
  }

  final _$_TripStoreActionController = ActionController(name: '_TripStore');

  @override
  dynamic setFilter(dynamic value) {
    final _$actionInfo =
        _$_TripStoreActionController.startAction(name: '_TripStore_setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_TripStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
    filtro: ${filtro},
    listaRobo: ${listaHoteis},
    filtered: ${filtered},
    quantidade: ${quantidade}
    ''';
  }
}
