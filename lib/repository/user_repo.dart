import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../model/user_model.dart';

//provider will create UserRepository instance once and cache it.
final userRepoProvider = Provider((ref) => UserRepository());

class UserRepository {
  Future<User> getUserData() {
    const String url = 'https://jsonplaceholder.typicode.com/users/1';
    final user = get(Uri.parse(url)).then(
      (value) => User.fromJson(
        jsonDecode(value.body),
      ),
    );
    return user;
  }
}
