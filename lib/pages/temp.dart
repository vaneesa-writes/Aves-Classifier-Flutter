// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'dart:async';
//
// void main() => runApp(MaterialApp(home: WikipediaExplorer()));
//
// class WikipediaExplorer extends StatefulWidget {
//
//   @override
//   _WikipediaExplorerState createState() => _WikipediaExplorerState();
// }
//
// class _WikipediaExplorerState extends State<WikipediaExplorer> {
//   final Completer<WebViewController> _controller = Completer<
//       WebViewController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.black54,
//         title: const Text('Wikipedia Explorer'),
//         actions: [
//           NavigationControls(_controller.future),
//         ],
//       ),
//       body: WebView(
//         initialUrl: 'https://en.wikipedia.org/wiki/Birds',
//         onWebViewCreated: (WebViewController wvc) {
//           _controller.complete(wvc);
//         },
//       ),
//     );
//   }
// }
// class NavigationControls extends StatelessWidget{
//   const NavigationControls(this._controller);
//   final Future<WebViewController> _controller;
//   @override
//   Widget build (BuildContext context){
//     return FutureBuilder(
//       future: _controller,
//       builder:(context,snapshot){
//         final webIsReady = snapshot.connectionState ==ConnectionState.done;
//         final WebViewController? controller = snapshot.data as WebViewController?;
//         return webIsReady ?
//         Row(
//           children: [
//             IconButton( onPressed: () async{
//               final bool goback = await controller!.canGoBack();
//               if(goback){
//                 await controller.goBack();
//               }else{
//                 ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Can"t go Back'))
//                 );
//               }
//             }, icon:Icon(Icons.arrow_back_ios),),
//             IconButton( onPressed: () async{
//               final bool goforward = await controller!.canGoForward();
//               if(goforward){
//                 await controller.goForward();
//               }else{
//                 ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Can"t go Forward '))
//                 );
//               }
//             }, icon:Icon(Icons.arrow_forward_ios),)
//           ],
//         )
//             : SizedBox();
//       },
//     );
//   }
// }