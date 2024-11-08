import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _githubUrl = 'https://api.github.com/gists/public';
  final String _unsplashUrl = 'https://api.unsplash.com/photos';
  final String _unsplashClientId = '2ooOGFjEcBoRuANFpCzAt9Ny8-FEN4jQEXeW2DorXFc';

  ApiService() {
    final cacheOptions = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.refreshForceCache,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 1),
    );

    _dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
  }

  Future<List<dynamic>> getPublicGists() async {
    try {
      final response = await _dio.get(_githubUrl);
      return response.data;
    } catch (e) {
      throw Exception('Failed to load public gists');
    }
  }

  Future<List<dynamic>> getUnsplashImages() async {
    try {
      final response = await _dio.get(
        _unsplashUrl,
        queryParameters: {
          'client_id': _unsplashClientId,
        },
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to load Unsplash images');
    }
  }
}