import '../../config/config.dart';
import '../../model/model.dart';

class SignupRepository {
  final _api = NetworkServicesApi();

  Future<User> signUpApi(dynamic payload) async {
    final response = await _api.postApi(AppUrls.signup, payload);
    return User.fromJson(response);
  }
}
