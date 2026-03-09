import 'package:food_app/core/constants/supabase_keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  static Future<void> initSupabase() async {
    await Supabase.initialize(
      url: SupabaseKeys.supabaseUrl,
      anonKey: SupabaseKeys.apiKey,
    );
  }
}
