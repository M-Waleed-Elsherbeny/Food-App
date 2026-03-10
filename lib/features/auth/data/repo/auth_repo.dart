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
    required String email,
    required String password,
  }) async {
    try {
      await supabase.auth.signUp(email: email, password: password);
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
}
