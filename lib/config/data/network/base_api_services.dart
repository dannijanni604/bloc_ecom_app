abstract class BaseApiServices{

  Future <dynamic> getApi(String url);

  Future <dynamic> postApi(String url, var payload);

  Future <dynamic> deleteApi(String url);

}