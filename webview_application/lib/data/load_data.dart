import 'package:dio/dio.dart';
import 'package:web_application/data/site_info.dart';

class LoadData {
  final String _url;
  final Dio _dio = Dio();
  late String dioError;

  Future<SiteInfo> getData() async {
    if (_url.isEmpty) return Future.value(SiteInfo.empty());
    try {
      final responce = await _dio.get(_url);
      return Future.value(SiteInfo.initSite(responce.data));
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  LoadData(this._url);
}
