abstract class BaseApiServices {

  Future<dynamic> getApiResponse(String url);

  Future<dynamic> getApiResponseWithHeader(String url, dynamic header);

  Future<dynamic> getPostApiResponse(String url, dynamic data);

  Future<dynamic> getPostApiResponseWithHeader(String url, dynamic header, dynamic data);
}