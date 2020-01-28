import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import '../../model/change_password/password_list_response_model.dart';
import '../../model/change_password/password_type_model.dart';
import '../../bloc/setting/change_password/change_password_bloc.dart';
import '../../bloc/setting/change_password/change_password_provider.dart';

class ChangePasswordListItem extends StatelessWidget {
  final PasswordTypeModel data;
  ChangePasswordListItem(this.data);

  bool isExpand = false;
  String headerTitleTemp= 'undefined';

  @override
  Widget build(BuildContext context) {
    ChangePasswordBloc bloc= ChangePasswordProvider.of(context);

    return StreamBuilder(
      stream: bloc.passwordList,
      builder: (context, AsyncSnapshot<PasswordListResponseModel> snapshot) {
            return Padding(
              padding: (isExpand == true)
                  ? const EdgeInsets.all(12.0)
                  : const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: (isExpand != true)
                      ? BorderRadius.all(
                          Radius.circular(10),
                        )
                      : BorderRadius.all(
                          Radius.circular(10),
                        ),
                  border: Border.all(color: Colors.transparent),
                ),
                child: ExpansionTile(
                  key: PageStorageKey<String>(data.type),
                  title: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          data.type,
                          style: TextStyle(
                              fontSize: (isExpand != true) ? 18 : 18, color: Colors.black),
                        ),
                        Text('This Week', textAlign: TextAlign.end, style: TextStyle(fontSize: 12),)
                      ],
                    )
                  ),
                  trailing: (isExpand == true)
                      ? Icon(
                          Icons.arrow_drop_down,
                          size: 32,
                          color: Colors.pink,
                        )
                      : Icon(Icons.arrow_drop_up, size: 32, color: Colors.black),
                  onExpansionChanged: (value) {
                    isExpand= value;
                  },
                  children: [
                    for (final item in data.data)
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: InkWell(
                          onTap: () {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.pink,
                                duration: Duration(microseconds: 500),
                                content: Text(
                                    "Selected Item $item " + data.type),
                              ),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Divider(
                                color: Colors.grey,
                                thickness: 1.0,
                              ),
                              Container(
                                width: double.infinity,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      leading: Image.network(item.pic, width: 60,),
                                      isThreeLine: true,
                                      title: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '[' + item.description.substring(1, 8) + '] ',
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            item.title,
                                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            NumberFormat.compact().format(item.used).toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            NumberFormat.compact().format(item.stock).toString() + " pcs",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                      trailing: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Checkbox(
                                            value: item.choose,
                                            onChanged: (value){
                                              bloc.updatePasswordCheckList(data.id, item.id);
                                            },
                                          ),
                                          
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            );
      }
    );
  }
}
