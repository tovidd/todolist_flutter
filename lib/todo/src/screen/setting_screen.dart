import 'package:flutter/material.dart';
import 'setting_profile_information_screen.dart';

class SettingScreen extends StatefulWidget {
  @override
  SettingScreenState createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return null;
  }

  void showModalSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (builder) {
        return BottomSheetContent();
      },
    );
  }
}

class BottomSheetContent extends StatefulWidget {
  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              floating: false,
              pinned: true,
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 72, bottom: 13,),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Settings',
                    ),
                    Text(
                      'Update Your Preferences',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                background: Container(color: Colors.white38, height: 100, width: MediaQuery.of(context).size.width,),
              ),
            )
          ];
        },
        body: body(context),
      ),
      backgroundColor: Colors.grey[50],
    );

  }

  Widget body(BuildContext context) {
    return ListView(
      children: <Widget>[
          setting_title('Account Settings', Colors.grey),
          GestureDetector(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SettingProfileInformationScreen()),);},
            child: setting_content('Profile Information', 'Name, Email, Security', 'assets/ic_user.png', Icon(null, size: 25, color: Colors.blue,), Colors.blue[50]),
          ),
          setting_content('Change Password', 'Change Your Current Password', null, Icon(Icons.lock, size: 25, color: Colors.orange,), Colors.orange[50]),
          setting_title('Notifications Setting', Colors.grey),
          setting_content('Push Notifications', 'New Contract Sign Or Send', null, Icon( Icons.notifications, size: 25, color: Colors.tealAccent[400],), Colors.lightGreen[50]),
          setting_title('General', Colors.grey),
          setting_content('Rate Our App', 'Rate & Review Us', null, Icon(Icons.favorite, size: 25, color: Colors.red,), Colors.red[50]),
          setting_content('Send Feedback', 'Share Your Thought', 'assets/ic_mail.png', Icon(null, size: 25), Colors.green[50]),
          setting_content('Privacy Policy', 'Read Privacy Policy', null, Icon(Icons.visibility_off, size: 25, color: Colors.black,), Colors.black12),
          setting_title('Connected App(s)', Colors.grey),
          setting_content('Connected With Facebook', 'Tap To Manage', 'assets/ic_facebook.png', Icon(null, size: 25,), Colors.lightBlue[50]),
          setting_content('Connected With Google', 'Tap To Manage', 'assets/ic_google.png', Icon(null, size: 25), Colors.white),
        ],
        padding: EdgeInsets.all(10),
    );
  }

  Widget setting_title(String title, Color title_color) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15),
      width: MediaQuery.of(context).size.width,
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
            color: title_color, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget setting_content(String title, String desription, String image, Icon icon, Color icon_bc) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 25,
            backgroundColor: icon_bc,
            child: icon.icon == null
                ? Image.asset(
                    image,
                    height: 25,
                    width: 25,
                  )
                : icon,
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: TextStyle(color: Colors.black, fontSize: 16)),
              SizedBox(
                height: 5,
              ),
              Text(desription,
                  style: TextStyle(color: Colors.grey[700], fontSize: 14)),
            ],
          )
        ],
      ),
    );
  }
}
