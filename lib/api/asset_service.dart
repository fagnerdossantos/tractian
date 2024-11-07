import 'dart:convert' show jsonDecode;

import 'package:http/http.dart' show Response, get;

import '../logic/models/types.dart';

class AssetService {
  //
  final String baseUrl = 'https://fake-api.tractian.com/companies';

  Future<ApiResponse> fetch({required String id}) async {
    try {
      final Response response = await get(Uri.parse("$baseUrl/$id/assets"));

      if (response.statusCode != 200) return [];

      return ApiResponse.from(jsonDecode(response.body));

      //
    } catch (e) {
      return [];
    }
  }
}
