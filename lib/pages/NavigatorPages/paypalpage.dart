// import 'dart:async';
// import 'dart:convert';
// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:tagyourtaxi_driver/styles/styles.dart';
// import 'package:http/http.dart' as http;

// class PaypalPage extends StatefulWidget {
//   const PaypalPage({Key? key}) : super(key: key);

//   @override
//   State<PaypalPage> createState() => _PaypalPageState();
// }

// class _PaypalPageState extends State<PaypalPage> {

//   final IFrameElement _iframeElement = IFrameElement();

//   @override
//   void initState(){
//     paypal();
//     super.initState();
//   }

//  String paypal(){
//     return ('''
// <html>
// <head>
//   <meta name="viewport" content="width=device-width, initial-scale=1">
// </head>
// <body>
//   <!-- Replace "test" with your own sandbox Business account app client ID -->
//   <script src="https://www.paypal.com/sdk/js?client-id=Aa8HGreQGcfmH5Hbo6JFF2QEJWRVosLWS_MGavCA--Eo0Rl_EPQpA0IR10kLbkVL36qkfCT-NTSgZrtQ&currency=USD"></script>
//   <!-- Set up a container element for the button -->
//   <div id="paypal-button-container"></div>
//   <script>
//     paypal.Buttons({
//       // Sets up the transaction when a payment button is clicked
//       createOrder: (data, actions) => {
//         return actions.order.create({
//           purchase_units: [{
//             amount: {
//               value: '77.44' // Can also reference a variable or function
//             }
//           }]
//         });
//       },
//       // Finalize the transaction after payer approval
//       onApprove: (data, actions) => {
//         return actions.order.capture().then(function(orderData) {
//           // Successful capture! For dev/demo purposes:
//           console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));
//           const transaction = orderData.purchase_units[0].payments.captures[0];
//           alert(`Transaction \${transaction.status}: \${transaction.id}\n\nSee console for all available details`);
//           // When ready to go live, remove the alert and show a success message within this page. For example:
//           // const element = document.getElementById('paypal-button-container');
//           // element.innerHTML = '<h3>Thank you for your payment!</h3>';
//           // Or go to another URL:  actions.redirect('thank_you.html');
//         });
//       }
//     }).render('#paypal-button-container');
//   </script>
// </body>
// </html>
// ''');
//   }

//  // <div id="paypal-button-container" class="paypal-button-container"></div>
//     // <!-- Add card fields here in step 5 -->
//     // <script src="app.js"></script>

//   final Completer<WebViewController> _controller =
//   Completer<WebViewController>();
//   dynamic _con;

//     _loadHTML() async {
//     _con.loadUrl(Uri.dataFromString(
//         paypal(),
//         mimeType: 'text/html',
//         encoding: Encoding.getByName('utf-8')
//     ).toString());
//   }

//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//     return Material(
//       child: Container(
//         height: media.height*1,
//         width: media.width*1,
//         color: page,
//         child: WebView(
//           initialUrl: 'https://misoftwares.in',
//           javascriptMode: JavascriptMode.unrestricted,
//           onWebViewCreated: (WebViewController webViewController) {
//             // _controller.complete(webViewController);
//             _con = webViewController;
//             _loadHTML();
//           },
//         ),
//       ),
//     );
//   }
// }
