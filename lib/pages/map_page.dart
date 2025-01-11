import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_final_project/pages/first_screen_page.dart';
import 'package:flutter_final_project/pages/chat_page.dart';
import 'package:flutter_final_project/pages/profile_page.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int _selectedIndex = 1; // تحديد الأيقونة النشطة بشكل افتراضي (الخريطة)

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // تحديث الأيقونة النشطة
    });

    if (index == 0)
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => FirstScreenPage()));

    if (index == 2)
      Navigator.push(context, MaterialPageRoute(builder: (_) => ChatPage()));
    if (index == 3)
      Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF008B49),
        title: Text(
          'Map Page',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(24.7136, 46.6753), // مركز الخريطة (الرياض)
          zoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(24.7136, 46.6753), // موقع العلامة
                builder: (ctx) => Icon(
                  Icons.location_on,
                  color: Color.fromARGB(255, 4, 226, 38),
                  size: 40.0,
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // استخدام المتغير لتحديد الأيقونة النشطة
        onTap: _onItemTapped, // استدعاء الوظيفة عند الضغط
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],

        selectedItemColor: Color(0xFF008B49),
        unselectedItemColor: Colors.black54,
      ),
    );
  }
}
