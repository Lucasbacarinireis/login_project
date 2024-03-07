import 'package:login_project/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getList();
}
