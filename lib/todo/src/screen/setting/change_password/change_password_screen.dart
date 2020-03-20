import 'package:flutter/material.dart';

import '../../../model/change_password/password_list_response_model.dart';
import 'change_password_list_item.dart';
import '../../../bloc/setting/change_password/change_password_bloc.dart';
import '../../../bloc/setting/change_password/change_password_provider.dart';
import '../../../resource/constant/loading.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const routeName = '/setting_change_password';

  @override
  Widget build(BuildContext context) {
    ChangePasswordBloc bloc = ChangePasswordProvider.of(context);
    bloc.getPasswordList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Change Password',
          style: TextStyle(color: Colors.yellow),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder(
        stream: bloc.passwordList,
        builder: (context, AsyncSnapshot<PasswordListResponseModel> snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return Loading().gary(context);
          }
          return Center(
            child: ListView.builder(
              itemCount: snapshot.data.data.length,
              itemBuilder: (context, index) {
                return ChangePasswordListItem(snapshot.data.data[index]);
              },
            ),
          );
        },
      ),
      backgroundColor: Colors.grey[850],
    );
  }
}
