// // {
// // "status": "success",
// // "message": "",
// // "data": [{
// //     "id": 1,
// //     "title": "Beli persiapan lomba",
// //     "description": "Beli tali, karton, triplek, bambu, buku gambar, dan pulpen",
// //     "created_at": "2010-01-30 07:30:00",
// //     "deadline_at": "2010-02-05 13:30:00",
// //     "deleted_at": null,
// //     "done_at": null,
// //     "undone_at": null
// // },
// // {
// //     "id": 2,
// //     "title": "Pergi ke rumah tante",
// //     "description": "Jangan lupa bawa kue pesanan tante di pasar",
// //     "created_at": "2010-01-30 09:30:00",
// //     "deadline_at": "2010-02-05 18:30:00",
// //     "deleted_at": null,
// //     "done_at": null,
// //     "undone_at": null
// // },
// // {
// //     "id": 3,
// //     "title": "Daftar pengabdian",
// //     "description": "Syarat fotokopi ktp 1 lembar, transkrip nilai 2 lembar legalisir, dan surat rekomendasi kampus",
// //     "created_at": "2010-01-30 17:30:00",
// //     "deadline_at": "2010-02-05 07:30:00",
// //     "deleted_at": null,
// //     "done_at": null,
// //     "undone_at": null
// // },
// // {
// //     "id": 4,
// //     "title": "Bikin PR Biologi",
// //     "description": "Halaman 176 Nomor 1-50, dikumpul besok pagi",
// //     "created_at": "2010-01-30 20:30:00",
// //     "deadline_at": "2010-02-01 09:30:00",
// //     "deleted_at": null,
// //     "done_at": null,
// //     "undone_at": null
// // },
// // {
// //     "id": 5,
// //     "title": "Sertifikat taekwondo",
// //     "description": "Desain sertifikat dan minta approve dari pak pur. Print 100 lembar kertas ivory 260",
// //     "created_at": "2010-02-15 08:30:00",
// //     "deadline_at": "2010-02-27 23:30:00",
// //     "deleted_at": null,
// //     "done_at": null,
// //     "undone_at": null
// // },
// // {
// //     "id": 6,
// //     "title": "HP Samsung",
// //     "description": "Beli hape baru di gue sehat, lagi diskon 100%, cashback 100% pakai ovo",
// //     "created_at": "2010-03-05 12:30:00",
// //     "deadline_at": "2010-04-05 17:30:00",
// //     "deleted_at": null,
// //     "done_at": null,
// //     "undone_at": null
// // },
// // {
// //     "id": 7,
// //     "title": "Futsal",
// //     "description": "Anak kelas 7D ajak main bola di lapangan Soekarno Hatta",
// //     "created_at": "2010-05-06 07:30:00",
// //     "deadline_at": "2010-05-09 08:30:00",
// //     "deleted_at": null,
// //     "done_at": null,
// //     "undone_at": null
// // },
// // {
// //     "id": 8,
// //     "title": "Matahari",
// //     "description": "Lagi ada diskon jaket, murah, jangan lupa dibeli",
// //     "created_at": "2010-06-05 14:30:00",
// //     "deadline_at": "2010-06-05 10:30:00",
// //     "deleted_at": null,
// //     "done_at": null,
// //     "undone_at": null
// // }

// // ]
// // }

// import 'package:flutter/material.dart';

// class ChangePasswordScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Expansion List'),
//         ),
//         body: ListView.builder(
//           itemCount: data.length,
//           itemBuilder: (BuildContext context, int index) => EntryItem(
//                 data[index],
//               ),
//         ),
//       ),
//     );
//   }
// }

// // Welcome to another flutter tutorial
// // In this video we will see how to create a multi-level Expansion List
// // First Let's create a class for each row in the Expansion List

// class Entry {
//   final String title;
//   final List<Entry>
//       children; // Since this is an expansion list ...children can be another list of entries
//   Entry(this.title, [this.children = const <Entry>[]]);
// }

// // This is the entire multi-level list displayed by this app
// final List<Entry> data = <Entry>[
//   Entry(
//     'Chapter A',
//     <Entry>[
//       Entry(
//         'Section A0',
//         <Entry>[
//           Entry('Item A0.1'),
//           Entry('Item A0.2'),
//           Entry('Item A0.3'),
//         ],
//       ),
//       Entry('Section A1'),
//       Entry('Section A2'),
//     ],
//   ),
//   // Second Row
//   Entry('Chapter B', <Entry>[
//     Entry('Section B0'),
//     Entry('Section B1'),
//   ]),
//   Entry(
//     'Chapter C',
//     <Entry>[
//       Entry('Section C0'),
//       Entry('Section C1'),
//       Entry(
//         'Section C2',
//         <Entry>[
//           Entry('Item C2.0'),
//           Entry('Item C2.1'),
//           Entry('Item C2.2'),
//           Entry('Item C2.3'),
//         ],
//       )
//     ],
//   ),
// ];

// // Create the Widget for the row
// class EntryItem extends StatelessWidget {
//   const EntryItem(this.entry);
//   final Entry entry;

//   // This function recursively creates the multi-level list rows.
//   Widget _buildTiles(Entry root) {
//     if (root.children.isEmpty) {
//       return ListTile(
//         title: Text(root.title),
//       );
//     }
//     return ExpansionTile(
//       key: PageStorageKey<Entry>(root),
//       title: Text(root.title),
//       children: root.children.map<Widget>(_buildTiles).toList(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _buildTiles(entry);
//   }
// }

// // Kartu bank
// import 'package:flutter/material.dart';

// class ChangePasswordScreen extends StatefulWidget {
//   ChangePasswordScreen({Key key}) : super(key: key);

//   ChangePasswordScreenState createState() => ChangePasswordScreenState();
// }

// class ChangePasswordScreenState extends State<ChangePasswordScreen> with TickerProviderStateMixin{

//   bool _isExpaned = false;
//   List<Widget> cards = List<Widget>();
//   List<Widget> items = List<Widget>();
//   List<Color> colorsBlue = [
//     Color(0xff02DCAA),
//     Color(0xff0075E0),
//   ];

//   List<Color> colorsRed = [
//     Color(0xffFFA83A),
//     Color(0xffFB3C54),
//   ];

//   @override
//   void initState() {

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if(cards.isEmpty){
//       cards = [cardReds(1),cardBlues(2),cardReds(3),cardBlues(4),cardReds(5),cardReds(6)];
//     }
//     items = cards.take(4).toList();
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         title: Padding(
//                     padding: EdgeInsets.only(left: 24),
//                     child: Text(
//                       "Portfolios",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w900,
//                         fontSize: 32,
//                         color: Colors.black
//                       ),
//                     ),
//                   ),
//         actions: <Widget>[
//             FlatButton(
//                     onPressed: (){},
//                     child: Icon(
//                       Icons.add_circle,
//                       color: Color(0xff6025F8),
//                     ),
//                   ),
//         ],
//       ),
//       body: Container(
//         color: Colors.white,
//         child: SingleChildScrollView(
//                   child: GestureDetector(
//                     onTap: (){
//                       setState(() {
//                         _isExpaned = !_isExpaned;
//                       });
//                     },
//                     child: AnimatedCrossFade(
//                     firstChild: buildCollapse(items),
//                     secondChild: buildExpand(items),
//                     crossFadeState: !_isExpaned
//                       ? CrossFadeState.showFirst
//                       : CrossFadeState.showSecond,
//                     duration: Duration(milliseconds: 250),
//                     ),
//                   )
//         ),
//       ),
//     );
//   }

//   Widget buildCollapse(List<Widget> items){
//     double marginTop = 0;
//     double marginH = 48;
//     return Stack(
//     alignment: Alignment.topCenter,
//     children: items.asMap().map((index, card){
//       double marginLR = marginH -=12;
//       return MapEntry(index, Container(
//           margin: EdgeInsets.only(top: marginTop += 12,left: marginLR,right: marginLR),
//           child: AnimatedSize(
//             duration: Duration(seconds: 2),
//             curve: Curves.easeOutSine,
//             vsync: this,
//             child: Dismissible(
//               key: ValueKey(card),
//               child: card,
//               onDismissed: (_){
//                 setState(() {
//                   cards.remove(card);
//                   cards.insert(0, card);
//                 });
//               },
//             ),
//           ),
//         ));
//         }).values.toList()
//       );
//   }

//   Widget buildExpand(List<Widget> items){
//     return SingleChildScrollView(
//       child: Column(
//         children: items.reversed.toList()
//       ),
//     );
//   }

//   Widget cardReds(int number){
//     return cardItem(
//               leftTitle: "BINANCE ${number}",
//               rightTitle: "EDIT",
//               dollar: "13.506,72",
//               bitcoin: "1.32",
//               addPercent: "-0,87",
//               addDollar: "-72,21",
//               colors: colorsRed
//             );
//   }

//   Widget cardBlues(int number){
//     return   cardItem(
//               leftTitle: "OVERRALL BALANCE ${number}",
//               rightTitle: "",
//               dollar: "23.748,42",
//               bitcoin: "2,21",
//               addPercent: "+0,87",
//               addDollar: "+72,21",
//               colors: colorsBlue
//             );
//   }

//   Widget cardItem({List<Color> colors, String leftTitle, String rightTitle, String dollar, String bitcoin, String addPercent, String addDollar}){
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
//       width: size.width,
//       height: size.height * (1/3.5),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topRight,
//           end: Alignment.centerLeft,
//           colors: colors
//         ),
//         borderRadius: BorderRadius.all(Radius.circular(8)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.5),
//             blurRadius: 2,
//             offset: Offset(5,3)
//           ),
//         ],
//       ),
//       child: Stack(
//         children: <Widget>[
//           Container(
//             alignment: Alignment.bottomCenter,
//             margin: EdgeInsets.only(top: 42),
//             child: ImageIcon(
//               AssetImage("assets/image/ic_facebook.png"),
//               color: Colors.white.withOpacity(0.6),
//               size: size.width,
//             ),
//           ),
//           Container(
//             child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(
//                   leftTitle,
//                   style: TextStyle(
//                     color: Colors.white.withOpacity(0.9),
//                     fontSize: 16
//                   ),
//                 ),
//                 Text(
//                   rightTitle,
//                   style: TextStyle(
//                   color: Colors.white.withOpacity(0.9),
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold
//                 ),
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: RichText(
//               text: TextSpan(
//                 children: <TextSpan>[
//                   TextSpan(
//                     text: dollar,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 36,
//                       fontWeight: FontWeight.w900
//                     )
//                   ),
//                   TextSpan(
//                     text: "  \$",
//                     style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20
//                     )
//                   )
//                 ]
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
//             child: Row(
//               children: <Widget>[
//                    Text(
//                     bitcoin,
//                     style: TextStyle(
//                       color: Colors.white.withOpacity(0.9),
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500
//                     ),
//                   ),
//                   ImageIcon(
//                     AssetImage("assets/image/ic_google.png"),
//                     color: Colors.white.withOpacity(0.85),
//                     size: 14,
//                   ),
//               ],
//             )
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
//             child: Row(
//               children: <Widget>[
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 5,vertical: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.4),
//                     borderRadius: BorderRadius.all(Radius.circular(5))
//                   ),
//                   child: Text(
//                     "${addPercent}%",
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.white.withOpacity(0.85),
//                       fontWeight: FontWeight.bold
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 16),
//                   padding: EdgeInsets.symmetric(horizontal: 5,vertical: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.4),
//                     borderRadius: BorderRadius.all(Radius.circular(5))
//                   ),
//                   child: Text(
//                     "${addDollar} \$",
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.white.withOpacity(0.85),
//                       fontWeight: FontWeight.bold
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ),
//         ],
//       ),
//           )
//         ],
//       )
//     );
//   }

// }
