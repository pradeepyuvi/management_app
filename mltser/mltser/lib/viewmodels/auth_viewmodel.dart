import '../services/auth_service.dart';
import '../models/user_model.dart';

class AuthViewModel {
  final AuthService _authService = AuthService();

  Future<UserModel?> login(String email, String password) async {
    final user = await _authService.login(email, password);
    return user != null ? UserModel.fromFirebaseUser(user) : null;
  }

  Future<UserModel?> register(String email, String password) async {
    final user = await _authService.register(email, password);
    return user != null ? UserModel.fromFirebaseUser(user) : null;
  }

  void logout() {
    _authService.logout();
  }

  UserModel? get currentUser {
    final user = _authService.currentUser;
    return user != null ? UserModel.fromFirebaseUser(user) : null;
  }
}
