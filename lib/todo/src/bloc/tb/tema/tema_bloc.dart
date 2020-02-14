import 'package:rxdart/rxdart.dart';

import '../../../resource/repository.dart';
import '../../../model/tb/tema/tema_response_model.dart';

class TemaBloc {
  Repository _repository = Repository();

  final _temaValue = BehaviorSubject<TemaResponseModel>();

  Stream<TemaResponseModel> get temaValue => _temaValue.stream;

  Function(TemaResponseModel) get addTemaValue => _temaValue.sink.add;

  getTema() async {
    addTemaValue(null);
    final response = await _repository.getTema();
    print(response.toJson());
    addTemaValue(response);
  }

  updateTema(int id_tema) {
    TemaResponseModel data = _temaValue.value;
    for (var i = 0; i < data.data.length; i++) {
      if (data.data[i].id == id_tema) {
        data.data[i].selected = !data.data[i].selected;
        addTemaValue(data);
      }
    }
  }

  dispose() {
    _temaValue.close();
  }
}
