import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_final_project/service/gbt.dart';
import 'package:flutter_final_project/pages/first_screen_page.dart';
import 'package:flutter_final_project/pages/map_page.dart';
import 'package:flutter_final_project/pages/profile_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ChatUser me = ChatUser(id: "1", firstName: "User");
  ChatUser bot = ChatUser(id: "2", firstName: "Travel Guide Bot");

  List<ChatMessage> messageList = [];

  int _selectedIndex = 2; // تعيين الأيقونة النشطة (الدردشة)

  @override
  void initState() {
    super.initState();

    // إرسال رسالة ترحيبية من البوت عند فتح التطبيق
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _sendWelcomeMessage();
    });
  }

  void _sendWelcomeMessage() {
    ChatMessage welcomeMessage = ChatMessage(
      user: bot,
      text:
          "Welcome to Saudi Explorer! 🌟 I’m your smart assistant here to help you uncover the beauty and hidden gems of Saudi Arabia. Whether you’re looking for top tourist attractions, exciting activities, or places to enjoy authentic Saudi cuisine, I’m here to answer your questions and guide you on your journey. Don’t hesitate to ask anything—let’s start your adventure now! 🚀✨",
      createdAt: DateTime.now(),
    );

    setState(() {
      messageList.insert(0, welcomeMessage);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // تحديث الأيقونة النشطة
    });

    if (index == 0)
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => FirstScreenPage()));
    if (index == 1)
      Navigator.push(context, MaterialPageRoute(builder: (_) => MapPage()));

    if (index == 3)
      Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Travel Guide Chat"),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF008B49), Color(0xFF004D26)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: DashChat(
          currentUser: me,
          messages: messageList,
          onSend: (newMessage) async {
            // إضافة رسالة المستخدم إلى القائمة
            messageList.insert(0, newMessage);
            setState(() {});

            // الحصول على رد البوت
            String content = await Gpt().getData(newMessage.text);
            ChatMessage botMessage = ChatMessage(
              user: bot,
              text: content,
              createdAt: DateTime.now(),
            );

            // إضافة رسالة البوت إلى القائمة
            messageList.insert(0, botMessage);
            setState(() {});
          },
          messageOptions: MessageOptions(
            currentUserTextColor: Colors.white,
            textColor: Colors.black,
            containerColor: Colors.white.withOpacity(0.8),
          ),
          inputOptions: InputOptions(
            alwaysShowSend: true,
            inputDecoration: InputDecoration(
              hintText: "Type your message...",
              filled: true,
              fillColor: Colors.white.withOpacity(0.8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
            sendButtonBuilder: (onSend) {
              return IconButton(
                icon: Icon(Icons.send, color: Colors.white),
                onPressed: onSend,
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // تحديد الأيقونة النشطة
        onTap: _onItemTapped, // استدعاء الدالة لتغيير الأيقونة النشطة
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
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
