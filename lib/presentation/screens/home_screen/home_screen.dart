import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_list/core/constants/const.dart';
import 'package:users_list/presentation/screens/detail_screen/detail_screen.dart';
import '../../../application/provider/pagination_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Users List',style: titlestyleWhite,),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final isWideScreen = screenWidth >= 600;

            return Consumer<UserListProvider>(
              builder: (context, provider, _) {
                if (provider.userList.isEmpty) {
                  provider.getAllData();
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo is ScrollEndNotification &&
                        scrollInfo.metrics.pixels >=
                            scrollInfo.metrics.maxScrollExtent) {
                      provider.loadMoreData();
                    }
                    return false;
                  },
                  child: ListView.builder(
                    itemCount: provider.userList.length,
                    itemBuilder: (context, index) {
                      final userData = provider.userList[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      id: userData.id.toString(),
                                    ),
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: isWideScreen ? 40 : 30,
                                  backgroundImage:
                                      NetworkImage(userData.image!),
                                ),
                                title: Text(
                                  '${userData.firstName!} ${userData.maidenName!} ${userData.lastName!}',
                                  style: titlestyle,
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Age: ${userData.age!.toString()}',
                                      style: subtitle,
                                    ),
                                    Text(
                                      'Gender: ${userData.gender!}',
                                      style: subtitle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
