import 'package:flutter/material.dart';
import 'package:users_list/application/provider/get_all_provider.dart';
import 'package:users_list/domain/models/user_model.dart';
import 'package:users_list/presentation/screens/detail_screen/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title:const Text('Users List'),),
      body: SafeArea(
          child: FutureBuilder<List<UserData>?>(
        future: GetAllUsers().getalldata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(id: 
                        snapshot.data![index].id.toString()
                        ),));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              NetworkImage(snapshot.data![index].image!),
                        ),
                        title: Text(snapshot.data![index].firstName!),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Age: ${snapshot.data![index].age!.toString()}'),
                            Text('Gender: ${snapshot.data![index].gender!}')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      )),
    );
  }
}
