import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../model/change_password/password_list_response_model.dart';
import 'change_password_list_item.dart';
import '../../bloc/setting/change_password/change_password_bloc.dart';
import '../../bloc/setting/change_password/change_password_provider.dart';

class ChangePasswordScreen extends StatelessWidget {
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
            return spinkit();
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

  Widget spinkit() {
    return Container(
      color: Colors.white,
      child: SpinKitThreeBounce(
        color: Colors.pink,
        size: 50,
      ),
    );
  }
}
