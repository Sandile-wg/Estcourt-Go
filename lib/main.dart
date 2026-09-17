import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
void main() => runApp(EstcourtGoApp());
class EstcourtGoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  final String phone = "0781234567"; // SHINTSHA LAPHA - FAKA INOMBOLO YAKHO!
  void _whatsapp() async {
    final uri = Uri.parse('https://wa.me/27${phone.substring(1)}?text=Hello Estcourt Go');
    launchUrl(uri, mode: LaunchMode.externalApplication);
  }
  void _call() async { launchUrl(Uri.parse('tel:$phone')); }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Color(0xFF1565C0), title: Text('ESTCOURT GO', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold))),
      body: Column(children: [
        SizedBox(height:20),
        Icon(Icons.local_shipping, size:80, color: Colors.blue),
        Text('ESTCOURT', style: TextStyle(fontSize:36, fontWeight: FontWeight.bold, color: Colors.blue)),
        Text('GO', style: TextStyle(fontSize:48, fontWeight: FontWeight.bold, color: Colors.amber)),
        Text('H100 & TAXI SERVICES', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('REGISTERED • LICENSED • INSURED', style: TextStyle(fontSize:10, color: Colors.grey)),
        Spacer(),
        Padding(padding: EdgeInsets.all(20), child: Column(children: [
          SizedBox(width: double.infinity, height:60, child: ElevatedButton.icon(onPressed: _whatsapp, icon: Icon(Icons.message), label: Text('BOOK NOW - WHATSAPP'), style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white))),
          SizedBox(height:12),
          SizedBox(width: double.infinity, height:60, child: ElevatedButton.icon(onPressed: _call, icon: Icon(Icons.phone), label: Text('CALL: $phone'), style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1565C0), foregroundColor: Colors.white))),
        ])),
        SizedBox(height:20),
      ]),
    );
  }
}