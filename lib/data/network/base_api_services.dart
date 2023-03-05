

abstract class BaseApiServices{

  //Abstarct classes can be used for extend functions of that abstract class
  Future<dynamic> getApi(String url) ;
  Future<dynamic> postApi(dynamic data, String url) ;
//Future Method
}