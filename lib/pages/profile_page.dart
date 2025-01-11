import 'package:flutter/material.dart';
import 'package:flutter_final_project/pages/chat_page.dart';
import 'package:flutter_final_project/pages/first_screen_page.dart';
import 'package:flutter_final_project/pages/home_page.dart';
import 'package:flutter_final_project/pages/map_page.dart';
import 'package:flutter_final_project/service/database.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3; // تحديد الأيقونة النشطة بشكل افتراضي
  String userEmail = "Loading..."; // النص الافتراضي أثناء تحميل الإيميل

  @override
  void initState() {
    super.initState();
    fetchUserEmail(); // استدعاء الدالة لجلب الإيميل عند بداية الصفحة
  }

  void fetchUserEmail() async {
    try {
      // افترض أن هناك دالة في قاعدة البيانات لجلب معلومات المستخدم
      final email = await Database().getUserEmail();
      setState(() {
        userEmail = email; // تحديث الإيميل في الواجهة
      });
    } catch (e) {
      setState(() {
        userEmail = "Error loading email";
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // تحديث الأيقونة النشطة
    });

    // تحديد الصفحة التي سيتم التنقل إليها بناءً على الأيقونة المضغوطة
    if (index == 0)
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => FirstScreenPage()));
    if (index == 1)
      Navigator.push(context, MaterialPageRoute(builder: (_) => MapPage()));
    if (index == 2)
      Navigator.push(context, MaterialPageRoute(builder: (_) => ChatPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF008B49),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              size: 100,
              color: Colors.black54,
            ),
            SizedBox(height: 16),
            Text(
              userEmail, // عرض الإيميل الذي تم تحميله
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 226, 4, 4),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'Log Out',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
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
