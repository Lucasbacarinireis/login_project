import 'package:flutter/material.dart';
import 'package:login_project/controllers/home_controller.dart';
import 'package:login_project/models/post_model.dart';
import 'package:login_project/repositories/home_repository_imp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _homeController.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ValueListenableBuilder<List<PostModel>>(
          valueListenable: _homeController.posts,
          builder: (_, list, __) {
            return ListView.separated(
              itemCount: list.length,
              itemBuilder: (_, idx) => ListTile(
                trailing: Icon(Icons.arrow_forward),
                leading: Text(list[idx].id.toString()),
                title: Text(list[idx].title),
              ),
              separatorBuilder: (_, __) => Divider(),
            );
          }),
    );
  }
}
