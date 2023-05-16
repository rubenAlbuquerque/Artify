// import 'package:flutter/material.dart';
// import 'package:artify/screens/login-page.dart';
// import 'package:artify/screens/search-page.dart';
// import 'package:artify/screens/home-page.dart';

// MyHomePage

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const MyHomePage();
//   }
// }



// Container(
//     width: 390,
//     height: 844,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//     ),
//     child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children:[
//             Container(
//                 width: 390,
//                 height: 41,
//                 child: FlutterLogo(size: 41),
//             ),
//             SizedBox(height: 28.75),
//             Container(
//                 width: 380,
//                 height: 50,
//                 child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children:[
//                         Container(
//                             width: 380,
//                             height: 50,
//                             color: Color(0x00d9d9d9),
//                             padding: const EdgeInsets.only(left: 8, right: 7, top: 4, bottom: 3, ),
//                             child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children:[
//                                     Container(
//                                         width: 125.33,
//                                         height: 36.73,
//                                         child: Row(
//                                             mainAxisSize: MainAxisSize.min,
//                                             mainAxisAlignment: MainAxisAlignment.end,
//                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                             children:[
//                                                 Container(
//                                                     width: 36.09,
//                                                     height: 36.73,
//                                                     child: FlutterLogo(size: 36.09498596191406),
//                                                 ),
//                                                 SizedBox(width: 9.02),
//                                                 SizedBox(
//                                                     width: 80.21,
//                                                     height: 34.69,
//                                                     child: Text(
//                                                         "Artify",
//                                                         style: TextStyle(
//                                                             color: Colors.black,
//                                                             fontSize: 30,
//                                                             fontFamily: "Poppins",
//                                                             fontWeight: FontWeight.w600,
//                                                         ),
//                                                     ),
//                                                 ),
//                                             ],
//                                         ),
//                                     ),
//                                     SizedBox(width: 111.29),
//                                     Container(
//                                         width: 128.34,
//                                         height: 42.86,
//                                         child: Row(
//                                             mainAxisSize: MainAxisSize.min,
//                                             mainAxisAlignment: MainAxisAlignment.end,
//                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                             children:[
//                                                 Container(
//                                                     width: 40.11,
//                                                     height: 40.82,
//                                                     child: Row(
//                                                         mainAxisSize: MainAxisSize.min,
//                                                         mainAxisAlignment: MainAxisAlignment.center,
//                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                         children:[
//                                                             Container(
//                                                                 width: 40.11,
//                                                                 height: 40.82,
//                                                                 color: Color(0x009b9b9b),
//                                                                 padding: const EdgeInsets.all(5),
//                                                                 child: Row(
//                                                                     mainAxisSize: MainAxisSize.min,
//                                                                     mainAxisAlignment: MainAxisAlignment.center,
//                                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                                     children:[
//                                                                         Container(
//                                                                             width: 30.08,
//                                                                             height: 30.61,
//                                                                             padding: const EdgeInsets.all(1),
//                                                                             child: Row(
//                                                                                 mainAxisSize: MainAxisSize.min,
//                                                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                                                                 children:[
//                                                                                     Container(
//                                                                                         width: 27.93,
//                                                                                         height: 28.43,
//                                                                                         decoration: BoxDecoration(
//                                                                                             borderRadius: BorderRadius.circular(8),
//                                                                                         ),
//                                                                                         child: FlutterLogo(size: 27.930652618408203),
//                                                                                     ),
//                                                                                 ],
//                                                                             ),
//                                                                         ),
//                                                                     ],
//                                                                 ),
//                                                             ),
//                                                         ],
//                                                     ),
//                                                 ),
//                                                 SizedBox(width: 4.01),
//                                                 Container(
//                                                     width: 40.11,
//                                                     height: 40.82,
//                                                     child: Row(
//                                                         mainAxisSize: MainAxisSize.min,
//                                                         mainAxisAlignment: MainAxisAlignment.center,
//                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                         children:[
//                                                             Container(
//                                                                 width: 40.11,
//                                                                 height: 40.82,
//                                                                 color: Color(0x009b9b9b),
//                                                                 padding: const EdgeInsets.only(top: 5, bottom: 6, ),
//                                                                 child: Row(
//                                                                     mainAxisSize: MainAxisSize.min,
//                                                                     mainAxisAlignment: MainAxisAlignment.center,
//                                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                                     children:[
//                                                                         Container(
//                                                                             width: 30.08,
//                                                                             height: 30.61,
//                                                                             padding: const EdgeInsets.all(1),
//                                                                             child: Row(
//                                                                                 mainAxisSize: MainAxisSize.min,
//                                                                                 mainAxisAlignment: MainAxisAlignment.center,
//                                                                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                                                                 children:[
//                                                                                     Container(
//                                                                                         width: 27.93,
//                                                                                         height: 28.40,
//                                                                                         decoration: BoxDecoration(
//                                                                                             borderRadius: BorderRadius.circular(8),
//                                                                                         ),
//                                                                                         child: FlutterLogo(size: 27.93065643310547),
//                                                                                     ),
//                                                                                 ],
//                                                                             ),
//                                                                         ),
//                                                                     ],
//                                                                 ),
//                                                             ),
//                                                         ],
//                                                     ),
//                                                 ),
//                                                 SizedBox(width: 4.01),
//                                                 Container(
//                                                     width: 40.11,
//                                                     height: 42.86,
//                                                     child: Stack(
//                                                         children:[Positioned.fill(
//                                                             child: Align(
//                                                                 alignment: Alignment.bottomRight,
//                                                                 child: Container(
//                                                                     width: 40.11,
//                                                                     height: 40.82,
//                                                                     color: Color(0x009b9b9b),
//                                                                 ),
//                                                             ),
//                                                         ),
//                                                         Positioned.fill(
//                                                             child: Align(
//                                                                 alignment: Alignment.bottomRight,
//                                                                 child: Container(
//                                                                     width: 40.11,
//                                                                     height: 39.80,
//                                                                     child: Column(
//                                                                         mainAxisSize: MainAxisSize.min,
//                                                                         mainAxisAlignment: MainAxisAlignment.end,
//                                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                                         children:[
//                                                                             Container(
//                                                                                 width: 30.08,
//                                                                                 height: 30.61,
//                                                                                 decoration: BoxDecoration(
//                                                                                     borderRadius: BorderRadius.circular(50),
//                                                                                 ),
//                                                                                 child: FlutterLogo(size: 30.07915496826172),
//                                                                             ),
//                                                                             SizedBox(height: 1.02),
//                                                                             SizedBox(
//                                                                                 width: 40.11,
//                                                                                 height: 8.17,
//                                                                                 child: Text(
//                                                                                     "A tua Historia",
//                                                                                     textAlign: TextAlign.center,
//                                                                                     style: TextStyle(
//                                                                                         color: Colors.black,
//                                                                                         fontSize: 6,
//                                                                                     ),
//                                                                                 ),
//                                                                             ),
//                                                                         ],
//                                                                     ),
//                                                                 ),
//                                                             ),
//                                                         ),],
//                                                     ),
//                                                 ),
//                                             ],
//                                         ),
//                                     ),
//                                 ],
//                             ),
//                         ),
//                     ],
//                 ),
//             ),
//             SizedBox(height: 28.75),
//             Container(
//                 width: 385,
//                 height: 65,
//                 child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children:[
//                         Container(
//                             width: 385,
//                             height: 65,
//                             color: Color(0x00b0b0b0),
//                             padding: const EdgeInsets.only(right: 329, ),
//                             child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children:[
//                                     Container(
//                                         width: 56.32,
//                                         height: 65,
//                                         child: Row(
//                                             mainAxisSize: MainAxisSize.min,
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                             children:[
//                                                 Container(
//                                                     width: 56.32,
//                                                     height: 65,
//                                                     color: Color(0x00969696),
//                                                     child: Column(
//                                                         mainAxisSize: MainAxisSize.min,
//                                                         mainAxisAlignment: MainAxisAlignment.end,
//                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                         children:[
//                                                             Container(
//                                                                 width: 56.32,
//                                                                 height: 55,
//                                                                 decoration: BoxDecoration(
//                                                                     borderRadius: BorderRadius.circular(50),
//                                                                 ),
//                                                                 child: FlutterLogo(size: 55),
//                                                             ),
//                                                             SizedBox(
//                                                                 width: 56.32,
//                                                                 height: 10,
//                                                                 child: Text(
//                                                                     "DanielCCalbral",
//                                                                     textAlign: TextAlign.center,
//                                                                     style: TextStyle(
//                                                                         color: Colors.black,
//                                                                         fontSize: 6,
//                                                                     ),
//                                                                 ),
//                                                             ),
//                                                         ],
//                                                     ),
//                                                 ),
//                                             ],
//                                         ),
//                                     ),
//                                 ],
//                             ),
//                         ),
//                     ],
//                 ),
//             ),
//             SizedBox(height: 28.75),
//             Container(
//                 width: 381,
//                 height: 463,
//                 child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children:[
//                         Container(
//                             width: 380,
//                             height: 36,
//                             child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children:[
//                                     Container(
//                                         width: 380,
//                                         height: 36,
//                                         color: Color(0x00d9d9d9),
//                                         padding: const EdgeInsets.only(left: 1, right: 68, top: 1, ),
//                                         child: Row(
//                                             mainAxisSize: MainAxisSize.min,
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                             children:[
//                                                 Container(
//                                                     width: 35,
//                                                     height: 35,
//                                                     child: Row(
//                                                         mainAxisSize: MainAxisSize.min,
//                                                         mainAxisAlignment: MainAxisAlignment.center,
//                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                         children:[
//                                                             Container(
//                                                                 width: 35,
//                                                                 height: 35,
//                                                                 color: Color(0x00b1b1b1),
//                                                                 child: Row(
//                                                                     mainAxisSize: MainAxisSize.min,
//                                                                     mainAxisAlignment: MainAxisAlignment.center,
//                                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                                     children:[
//                                                                         Container(
//                                                                             width: 35,
//                                                                             height: 35,
//                                                                             decoration: BoxDecoration(
//                                                                                 borderRadius: BorderRadius.circular(50),
//                                                                             ),
//                                                                             child: FlutterLogo(size: 35),
//                                                                         ),
//                                                                     ],
//                                                                 ),
//                                                             ),
//                                                         ],
//                                                     ),
//                                                 ),
//                                                 SizedBox(width: 6),
//                                                 Container(
//                                                     width: 269.88,
//                                                     height: 24.70,
//                                                     child: Column(
//                                                         mainAxisSize: MainAxisSize.min,
//                                                         mainAxisAlignment: MainAxisAlignment.end,
//                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                         children:[
//                                                             SizedBox(
//                                                                 width: 160,
//                                                                 height: 13.30,
//                                                                 child: Text(
//                                                                     "Pedro Almeida",
//                                                                     style: TextStyle(
//                                                                         color: Colors.black,
//                                                                         fontSize: 12,
//                                                                         fontFamily: "Poppins",
//                                                                         fontWeight: FontWeight.w600,
//                                                                     ),
//                                                                 ),
//                                                             ),
//                                                             SizedBox(height: 3),
//                                                             SizedBox(
//                                                                 width: 269.88,
//                                                                 height: 8.40,
//                                                                 child: Text(
//                                                                     "Reproduziu uma faixa : 11 minutos atras",
//                                                                     style: TextStyle(
//                                                                         color: Colors.black,
//                                                                         fontSize: 9,
//                                                                     ),
//                                                                 ),
//                                                             ),
//                                                         ],
//                                                     ),
//                                                 ),
//                                             ],
//                                         ),
//                                     ),
//                                 ],
//                             ),
//                         ),
//                         SizedBox(height: 2),
//                         Container(
//                             width: 380,
//                             height: 425,
//                             child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children:[
//                                     Container(
//                                         width: 380,
//                                         height: 425,
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(5),
//                                         ),
//                                         padding: const EdgeInsets.only(top: 290, bottom: 5, ),
//                                         child: Stack(
//                                             children: [
//                                                 Positioned.fill(
//                                                     child: Column(
//                                                         mainAxisSize: MainAxisSize.min,
//                                                         mainAxisAlignment: MainAxisAlignment.end,
//                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                         children:[
//                                                             Container(
//                                                                 width: 351,
//                                                                 height: 78.68,
//                                                                 child: Column(
//                                                                     mainAxisSize: MainAxisSize.min,
//                                                                     mainAxisAlignment: MainAxisAlignment.start,
//                                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                                     children:[
//                                                                         SizedBox(
//                                                                             width: 351,
//                                                                             height: 33.49,
//                                                                             child: Text(
//                                                                                 "Good 4 you",
//                                                                                 style: TextStyle(
//                                                                                     color: Colors.white,
//                                                                                     fontSize: 24,
//                                                                                     fontFamily: "Poppins",
//                                                                                     fontWeight: FontWeight.w600,
//                                                                                 ),
//                                                                             ),
//                                                                         ),
//                                                                         SizedBox(
//                                                                             width: 132,
//                                                                             height: 12,
//                                                                             child: Text(
//                                                                                 "hip pop : 3m40s",
//                                                                                 style: TextStyle(
//                                                                                     color: Colors.white,
//                                                                                     fontSize: 8,
//                                                                                 ),
//                                                                             ),
//                                                                         ),
//                                                                         SizedBox(
//                                                                             width: 227,
//                                                                             height: 37,
//                                                                             child: Text(
//                                                                                 "Pedro Almeida:  minha nove musica no meu novo lançamento,  minha nove musica no meu novo lançamento ",
//                                                                                 style: TextStyle(
//                                                                                     color: Colors.white,
//                                                                                     fontSize: 8,
//                                                                                 ),
//                                                                             ),
//                                                                         ),
//                                                                     ],
//                                                                 ),
//                                                             ),
//                                                             SizedBox(height: 5),
//                                                             Container(
//                                                                 width: 380,
//                                                                 height: 46,
//                                                                 child: Row(
//                                                                     mainAxisSize: MainAxisSize.min,
//                                                                     mainAxisAlignment: MainAxisAlignment.center,
//                                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                                     children:[
//                                                                         Container(
//                                                                             width: 380,
//                                                                             height: 46,
//                                                                             decoration: BoxDecoration(
//                                                                                 borderRadius: BorderRadius.circular(5),
//                                                                                 color: Color(0x66000000),
//                                                                             ),
//                                                                             padding: const EdgeInsets.only(left: 7, right: 6, top: 5, bottom: 4, ),
//                                                                             child: Row(
//                                                                                 mainAxisSize: MainAxisSize.min,
//                                                                                 mainAxisAlignment: MainAxisAlignment.end,
//                                                                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                                                                 children:[
//                                                                                     Container(
//                                                                                         width: 74.28,
//                                                                                         height: 36.47,
//                                                                                         child: Stack(
//                                                                                             children:[Positioned.fill(
//                                                                                                 child: Align(
//                                                                                                     alignment: Alignment.bottomLeft,
//                                                                                                     child: Container(
//                                                                                                         width: 38.33,
//                                                                                                         height: 36.47,
//                                                                                                         child: Row(
//                                                                                                             mainAxisSize: MainAxisSize.min,
//                                                                                                             mainAxisAlignment: MainAxisAlignment.center,
//                                                                                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                                                                                             children:[
//                                                                                                                 Container(
//                                                                                                                     width: 38.33,
//                                                                                                                     height: 36.47,
//                                                                                                                     decoration: BoxDecoration(
//                                                                                                                         borderRadius: BorderRadius.circular(20),
//                                                                                                                         color: Color(0x00000000),
//                                                                                                                     ),
//                                                                                                                     padding: const EdgeInsets.only(left: 6, right: 7, top: 7, bottom: 5, ),
//                                                                                                                     child: Row(
//                                                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                                                         mainAxisAlignment: MainAxisAlignment.center,
//                                                                                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                                                                                         children:[
//                                                                                                                             Container(
//                                                                                                                                 width: 24.92,
//                                                                                                                                 height: 24,
//                                                                                                                                 decoration: BoxDecoration(
//                                                                                                                                     borderRadius: BorderRadius.circular(8),
//                                                                                                                                 ),
//                                                                                                                                 child: FlutterLogo(size: 24),
//                                                                                                                             ),
//                                                                                                                         ],
//                                                                                                                     ),
//                                                                                                                 ),
//                                                                                                             ],
//                                                                                                         ),
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                             Positioned.fill(
//                                                                                                 child: Align(
//                                                                                                     alignment: Alignment.bottomRight,
//                                                                                                     child: SizedBox(
//                                                                                                         width: 40.52,
//                                                                                                         height: 22.93,
//                                                                                                         child: Text(
//                                                                                                             "2.000",
//                                                                                                             textAlign: TextAlign.center,
//                                                                                                             style: TextStyle(
//                                                                                                                 color: Colors.white,
//                                                                                                                 fontSize: 10,
//                                                                                                             ),
//                                                                                                         ),
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),],
//                                                                                         ),
//                                                                                     ),
//                                                                                     SizedBox(width: 34.37),
//                                                                                     Container(
//                                                                                         width: 74.83,
//                                                                                         height: 36.47,
//                                                                                         child: Stack(
//                                                                                             children:[Positioned.fill(
//                                                                                                 child: Align(
//                                                                                                     alignment: Alignment.bottomLeft,
//                                                                                                     child: Container(
//                                                                                                         width: 38.33,
//                                                                                                         height: 36.47,
//                                                                                                         child: Row(
//                                                                                                             mainAxisSize: MainAxisSize.min,
//                                                                                                             mainAxisAlignment: MainAxisAlignment.center,
//                                                                                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                                                                                             children:[
//                                                                                                                 Container(
//                                                                                                                     width: 38.33,
//                                                                                                                     height: 36.47,
//                                                                                                                     decoration: BoxDecoration(
//                                                                                                                         borderRadius: BorderRadius.circular(20),
//                                                                                                                         color: Color(0x00000000),
//                                                                                                                     ),
//                                                                                                                     padding: const EdgeInsets.only(left: 4, right: 5, ),
//                                                                                                                     child: Row(
//                                                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                                                         mainAxisAlignment: MainAxisAlignment.center,
//                                                                                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                                                                                         children:[
//                                                                                                                             Container(
//                                                                                                                                 width: 29.07,
//                                                                                                                                 height: 28,
//                                                                                                                                 decoration: BoxDecoration(
//                                                                                                                                     borderRadius: BorderRadius.circular(8),
//                                                                                                                                 ),
//                                                                                                                                 child: FlutterLogo(size: 28),
//                                                                                                                             ),
//                                                                                                                         ],
//                                                                                                                     ),
//                                                                                                                 ),
//                                                                                                             ],
//                                                                                                         ),
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                             Positioned.fill(
//                                                                                                 child: Align(
//                                                                                                     alignment: Alignment.bottomRight,
//                                                                                                     child: SizedBox(
//                                                                                                         width: 40.52,
//                                                                                                         height: 22.93,
//                                                                                                         child: Text(
//                                                                                                             "1.056",
//                                                                                                             textAlign: TextAlign.center,
//                                                                                                             style: TextStyle(
//                                                                                                                 color: Colors.white,
//                                                                                                                 fontSize: 10,
//                                                                                                             ),
//                                                                                                         ),
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),],
//                                                                                         ),
//                                                                                     ),
//                                                                                     SizedBox(width: 34.37),
//                                                                                     Container(
//                                                                                         width: 75.73,
//                                                                                         height: 36.47,
//                                                                                         child: Stack(
//                                                                                             children:[Positioned.fill(
//                                                                                                 child: Align(
//                                                                                                     alignment: Alignment.bottomRight,
//                                                                                                     child: SizedBox(
//                                                                                                         width: 40.52,
//                                                                                                         height: 22.93,
//                                                                                                         child: Text(
//                                                                                                             "5.528",
//                                                                                                             textAlign: TextAlign.center,
//                                                                                                             style: TextStyle(
//                                                                                                                 color: Colors.white,
//                                                                                                                 fontSize: 10,
//                                                                                                             ),
//                                                                                                         ),
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),
//                                                                                             Positioned.fill(
//                                                                                                 child: Align(
//                                                                                                     alignment: Alignment.bottomLeft,
//                                                                                                     child: Container(
//                                                                                                         width: 38.33,
//                                                                                                         height: 36.47,
//                                                                                                         child: Row(
//                                                                                                             mainAxisSize: MainAxisSize.min,
//                                                                                                             mainAxisAlignment: MainAxisAlignment.center,
//                                                                                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                                                                                             children:[
//                                                                                                                 Container(
//                                                                                                                     width: 38.33,
//                                                                                                                     height: 36.47,
//                                                                                                                     decoration: BoxDecoration(
//                                                                                                                         borderRadius: BorderRadius.circular(20),
//                                                                                                                         color: Color(0x00000000),
//                                                                                                                     ),
//                                                                                                                     padding: const EdgeInsets.only(left: 3, right: 5, top: 4, bottom: 2, ),
//                                                                                                                     child: Row(
//                                                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                                                         mainAxisAlignment: MainAxisAlignment.center,
//                                                                                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                                                                                         children:[
//                                                                                                                             Container(
//                                                                                                                                 width: 31.15,
//                                                                                                                                 height: 30,
//                                                                                                                                 decoration: BoxDecoration(
//                                                                                                                                     borderRadius: BorderRadius.circular(8),
//                                                                                                                                 ),
//                                                                                                                                 child: FlutterLogo(size: 30),
//                                                                                                                             ),
//                                                                                                                         ],
//                                                                                                                     ),
//                                                                                                                 ),
//                                                                                                             ],
//                                                                                                         ),
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ),],
//                                                                                         ),
//                                                                                     ),
//                                                                                     SizedBox(width: 34.37),
//                                                                                     Container(
//                                                                                         width: 38.33,
//                                                                                         height: 36.47,
//                                                                                         child: Row(
//                                                                                             mainAxisSize: MainAxisSize.min,
//                                                                                             mainAxisAlignment: MainAxisAlignment.center,
//                                                                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                                                                             children:[
//                                                                                                 Container(
//                                                                                                     width: 38.33,
//                                                                                                     height: 36.47,
//                                                                                                     decoration: BoxDecoration(
//                                                                                                         borderRadius: BorderRadius.circular(20),
//                                                                                                         color: Color(0x00000000),
//                                                                                                     ),
//                                                                                                     padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8, ),
//                                                                                                     child: Row(
//                                                                                                         mainAxisSize: MainAxisSize.min,
//                                                                                                         mainAxisAlignment: MainAxisAlignment.center,
//                                                                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                                                                         children:[
//                                                                                                             Container(
//                                                                                                                 width: 20.77,
//                                                                                                                 height: 20,
//                                                                                                                 decoration: BoxDecoration(
//                                                                                                                     borderRadius: BorderRadius.circular(8),
//                                                                                                                 ),
//                                                                                                                 child: FlutterLogo(size: 20),
//                                                                                                             ),
//                                                                                                         ],
//                                                                                                     ),
//                                                                                                 ),
//                                                                                             ],
//                                                                                         ),
//                                                                                     ),
//                                                                                 ],
//                                                                             ),
//                                                                         ),
//                                                                     ],
//                                                                 ),
//                                                             ),
//                                                         ],
//                                                     ),
//                                                 ),
//                                                 Positioned.fill(
//                                                     child: FlutterLogo(size: 380),
//                                                 ),
//                                             ],
//                                         ),
//                                     ),
//                                 ],
//                             ),
//                         ),
//                     ],
//                 ),
//             ),
//             SizedBox(height: 28.75),
//             Container(
//                 width: 391,
//                 height: 110,
//                 child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children:[
//                         Container(
//                             width: 390,
//                             height: 65,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),
//                                 color: Colors.white,
//                             ),
//                             padding: const EdgeInsets.only(top: 13, bottom: 12, ),
//                             child: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children:[
//                                     Container(
//                                         width: 306,
//                                         height: 40,
//                                         child: Row(
//                                             mainAxisSize: MainAxisSize.min,
//                                             mainAxisAlignment: MainAxisAlignment.end,
//                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                             children:[
//                                                 Container(
//                                                     decoration: BoxDecoration(
//                                                         borderRadius: BorderRadius.circular(100),
//                                                         color: Color(0xff3e3e3e),
//                                                     ),
//                                                     padding: const EdgeInsets.only(left: 8, right: 20, ),
//                                                     child: Row(
//                                                         mainAxisSize: MainAxisSize.min,
//                                                         mainAxisAlignment: MainAxisAlignment.center,
//                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                         children:[
//                                                             Container(
//                                                                 width: 24,
//                                                                 height: 24,
//                                                                 child: Stack(
//                                                                     children:[
//                                                                         Positioned.fill(
//                                                                             child: Align(
//                                                                                 alignment: Alignment.topLeft,
//                                                                                 child: Container(
//                                                                                     width: 20,
//                                                                                     height: 20,
//                                                                                     decoration: BoxDecoration(
//                                                                                         borderRadius: BorderRadius.circular(8),
//                                                                                     ),
//                                                                                     child: FlutterLogo(size: 20),
//                                                                                 ),
//                                                                             ),
//                                                                         ),
//                                                                         Opacity(
//                                                                             opacity: 0,
//                                                                             child: Container(
//                                                                                 width: 24,
//                                                                                 height: 24,
//                                                                                 decoration: BoxDecoration(
//                                                                                     borderRadius: BorderRadius.circular(8),
//                                                                                     color: Color(0x7f7f3a44),
//                                                                                 ),
//                                                                             ),
//                                                                         ),
//                                                                     ],
//                                                                 ),
//                                                             ),
//                                                             SizedBox(width: 4),
//                                                             Text(
//                                                                 "Home",
//                                                                 textAlign: TextAlign.center,
//                                                                 style: TextStyle(
//                                                                     color: Colors.white,
//                                                                     fontSize: 14,
//                                                                     fontFamily: "Inter",
//                                                                     fontWeight: FontWeight.w600,
//                                                                 ),
//                                                             ),
//                                                         ],
//                                                     ),
//                                                 ),
//                                                 SizedBox(width: 30),
//                                                 Padding(
//                                                     padding: const EdgeInsets.all(8),
//                                                     child: Row(
//                                                         mainAxisSize: MainAxisSize.min,
//                                                         mainAxisAlignment: MainAxisAlignment.center,
//                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                         children:[
//                                                             Container(
//                                                                 width: 24,
//                                                                 height: 24,
//                                                                 padding: const EdgeInsets.only(bottom: 1, ),
//                                                                 child: Row(
//                                                                     mainAxisSize: MainAxisSize.min,
//                                                                     mainAxisAlignment: MainAxisAlignment.center,
//                                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                                     children:[
//                                                                         Opacity(
//                                                                             opacity: 0,
//                                                                             child: Container(
//                                                                                 width: 24,
//                                                                                 height: 24,
//                                                                                 decoration: BoxDecoration(
//                                                                                     borderRadius: BorderRadius.circular(8),
//                                                                                     color: Color(0x7f7f3a44),
//                                                                                 ),
//                                                                             ),
//                                                                         ),
//                                                                     ],
//                                                                 ),
//                                                             ),
//                                                         ],
//                                                     ),
//                                                 ),
//                                                 SizedBox(width: 30),
//                                                 Container(
//                                                     width: 40,
//                                                     height: 40,
//                                                     padding: const EdgeInsets.all(8),
//                                                     child: Row(
//                                                         mainAxisSize: MainAxisSize.min,
//                                                         mainAxisAlignment: MainAxisAlignment.center,
//                                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                                         children:[
//                                                             Container(
//                                                                 width: 24,
//                                                                 height: 24,
//                                                                 decoration: BoxDecoration(
//                                                                     borderRadius: BorderRadius.circular(8),
//                                                                 ),
//                                                                 child: FlutterLogo(size: 24),
//                                                             ),
//                                                         ],
//                                                     ),
//                                                 ),
//                                                 SizedBox(width: 30),
//                                                 Padding(
//                                                     padding: const EdgeInsets.all(8),
//                                                     child: Row(
//                                                         mainAxisSize: MainAxisSize.min,
//                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                         children:[
//                                                             Container(
//                                                                 width: 24,
//                                                                 height: 24,
//                                                                 child: Stack(
//                                                                     children:[

//                                                                     ],
//                                                                 ),
//                                                             ),
//                                                         ],
//                                                     ),
//                                                 ),
//                                             ],
//                                         ),
//                                     ),
//                                 ],
//                             ),
//                         ),
//                         Container(
//                             width: 390,
//                             height: 45,
//                             color: Color(0xf704003d),
//                         ),
//                     ],
//                 ),
//             ),
//         ],
//     ),
// )