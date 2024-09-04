import 'package:bloc_ecom_app/config/app_urls.dart';
import 'package:bloc_ecom_app/config/data/network/network_services_api.dart';
import '../../model/user.dart';

class SignupRepository {
  final _api = NetworkServicesApi();

  Future<User> signUpApi(dynamic payload) async {
    final response = await _api.postApi(AppUrls.signup, payload);
    return User.fromJson(response);
  }
}
