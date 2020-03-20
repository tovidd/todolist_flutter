import 'package:rxdart/rxdart.dart';

import '../../../model/change_password/password_list_response_model.dart';
import '../../../resource/constant/repository.dart';

class ChangePasswordBloc {
  Repository _repository= Repository();

  final _passwordList = BehaviorSubject<PasswordListResponseModel>();

  Stream<PasswordListResponseModel> get passwordList => _passwordList.stream;
  
  Function(PasswordListResponseModel) get addPasswordList => _passwordList.sink.add;

  getPasswordList() async {
    addPasswordList(null);
    final response = await _repository.getPasswordList();
    print(response.toJson());
    addPasswordList(response);
  }

  updatePasswordCheckList(int id_password_type, int id_password) {
    PasswordListResponseModel data= _passwordList.value;
    for (var i = 0; i < data.data.length; i++) {
      if(data.data[i].id == id_password_type)
      {
        for (var j = 0; j < data.data[i].data.length; j++) {
          if(data.data[i].data[j].id == id_password){
            data.data[i].data[j].choose= !data.data[i].data[j].choose;
            addPasswordList(data);
          }
        }
      }
    }
  }

  updatePasswordIsExpand(int id_password_type){
    PasswordListResponseModel data= _passwordList.value;
    for (var i = 0; i < data.data.length; i++){
      if(data.data[i].id == id_password_type){
        data.data[i].isExpand= !data.data[i].isExpand;
        print(id_password_type);
        print(data.data[i].isExpand);
        addPasswordList(data);
      }
    }
  }





  dispose() {
    _passwordList.close();
  }
}
