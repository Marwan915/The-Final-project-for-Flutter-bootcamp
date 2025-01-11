import 'package:supabase_flutter/supabase_flutter.dart';

class Database {
  final supabase = Supabase.instance.client;

//====================================================================================\\
  //                             for auth table

  signup({required String email, required String password}) async {
    await supabase.auth.signUp(password: password, email: email);
  }

  login({required String email, required String password}) async {
    await supabase.auth.signInWithPassword(password: password, email: email);
  }

  //====================================================================================\\
  //                       Fetch the email of the current user
  Future<String> getUserEmail() async {
    try {
      // جلب معلومات المستخدم الحالي
      final user = supabase.auth.currentUser;

      if (user != null) {
        return user.email ?? "No Email Found"; // إرجاع الإيميل إذا كان موجودًا
      } else {
        return "No User Logged In"; // إذا لم يكن هناك مستخدم مسجل
      }
    } catch (e) {
      throw Exception("Error fetching user email: $e");
    }
  }
}
