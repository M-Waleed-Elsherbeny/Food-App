import 'package:dartz/dartz.dart';
import 'package:food_app/core/services/api_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:developer';

class AuthRepo {
  final ApiServices apiServices = ApiServices();

  final supabase = Supabase.instance.client;

  Future<Either<String, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
      return right(null);
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }

  Future<Either<String, void>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await supabase.auth.signUp(email: email, password: password);
      await saveUser(name: name, email: email);
      return right(null);
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }

  Future<Either<String, void>> logout() async {
    try {
      await supabase.auth.signOut();
      return right(null);
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }

  Future<Either<String, void>> saveUser({
    required String name,
    required String email,
  }) async {
    try {
      await supabase.from("users").insert({
        "id": supabase.auth.currentUser!.id,
        "name": name,
        "email": email,
      });
      log("User saved");
      return right(null);
    } on Exception catch (e) {
      log(e.toString());
      return left(e.toString());
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }

  // Future<Either<String, Map<String, dynamic>>>
  Future getUser() async {
    try {
      final res = await supabase
          .from("users")
          .select()
          .eq("id", supabase.auth.currentUser!.id)
          .single();
      log(res.toString());
      return right(res);
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }
}
