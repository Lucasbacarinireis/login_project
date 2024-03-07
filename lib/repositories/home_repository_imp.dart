import 'package:dio/dio.dart';
import 'package:login_project/models/post_model.dart';
import 'package:login_project/repositories/home_repository.dart';

class HomeRepositoryImp implements HomeRepository {
  final dio = Dio();

  @override
  Future<List<PostModel>> getList() async {
    Response response;
    response = await dio.get('https://jsonplaceholder.typicode.com/posts');

    return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
  }
}
