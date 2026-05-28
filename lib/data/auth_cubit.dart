import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
part 'auth_state.dart';
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final String BaseUrl="https://api.freeapi.app/api/v1";
  final String registerEndpoint="/users/register";
  final String loginEndpoint="/users/login";
  Future<void> register(String username, String password, String role, String email,) async {
    emit(AuthLoading());
    try {
      var uri = Uri.parse("$BaseUrl$registerEndpoint",);
      var response = await http.post(uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "username": username.toLowerCase(),
          "password": password,
          "role": role,
          "email": email,
        }),
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(AuthSuccess(data["message"] ?? "User registered successfully",));
      } else {
        emit(AuthError(data["message"] ?? "Registration failed",));
      }
    } catch (e) {
      emit(AuthError("Error in Registering: $e"));
    }
  }
  Future<void>login(String username,String Password)async{
    emit(AuthLoading());
    try{
      var uri= Uri.parse(BaseUrl+loginEndpoint);
      var response = await http.post(uri,headers: {
        "Content-Type":"application/json",
      },
        body: jsonEncode({
          "username": username.toLowerCase(),
          "password": Password,
        }),
      );
      var data = jsonDecode(response.body);
      if(response.statusCode== 200 || response.statusCode == 201){
        emit(AuthSuccess(data["message"] ?? "Login successful"));
      }else{
        emit(AuthError(data["message"] ?? "Login failed"));
      }
    }catch(e){
      emit(AuthError("Error in Login: $e"));
    }
  }
}