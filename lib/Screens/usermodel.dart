import 'package:flutter/material.dart';
import 'package:myproject/models/user_model.dart';
import 'package:myproject/services/user_service.dart';
import 'package:myproject/viewmodel/user_provider.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    // print(user!.data![0].firstName);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 6, 4, 138),
      ),
      body: Center(child: buildBody(provider)),
    );
  }

  Widget buildBody(UserProvider provider) {
    switch (provider.pageState) {
      case PageState.LOADING:
        {
          return const CircularProgressIndicator();
        }
      case PageState.SUCCES:
        {
          return ListView.builder(
              itemCount: provider.user.data!.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(
                      '${provider.user.data![index].firstName!} ${provider.user.data![index].lastName!}'),
                  subtitle: Text(provider.user.data![index].email!),
                  leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(provider.user.data![index].avatar)),
                );
              }));
        }

      default:
        {
          return const SizedBox.shrink();
        }
    }
  }
}
