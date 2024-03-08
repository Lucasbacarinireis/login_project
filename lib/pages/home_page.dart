import 'package:flutter/material.dart';
import 'package:login_project/controllers/home_controller.dart';
import 'package:login_project/models/post_model.dart';
import 'package:login_project/repositories/home_repository_imp.dart';
import 'package:login_project/services/prefs_service.dart';

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
        actions: [
          IconButton(
            onPressed: () {
              PrefsService.logout();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/login", (route) => true);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
          valueListenable: _homeController.posts,
          builder: (_, list, __) {
            return ListView.separated(
              itemCount: list.length,
              itemBuilder: (_, index) => ListTile(
                trailing: Icon(Icons.arrow_forward),
                leading: Text(list[index].id.toString()),
                title: Text(list[index].title),
                onTap: () => Navigator.of(context).pushNamed(
                  "/detailsPage",
                  arguments: list[index],
                ),
              ),
              separatorBuilder: (_, __) => Divider(),
            );
          }),
    );
  }
}
