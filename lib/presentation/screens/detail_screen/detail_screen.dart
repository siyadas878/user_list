import 'package:flutter/material.dart';
import 'package:users_list/application/provider/get_all_provider.dart';
import '../../widgets/card_widget.dart';

class DetailScreen extends StatelessWidget {
  final String id;
  const DetailScreen({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: 
      FutureBuilder(
        future: GetAllUsers().getUserData(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(!snapshot.hasData){
            return const Center(child: Text('Empty Data'),);
          }
          var user=snapshot.data;
          return Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(user!.image!),),
            CardWidget(text: 'Name:  ${user.firstName!}'),
            CardWidget(text: "Gender: ${user.gender!}"),
            CardWidget(text: "Email: ${user.email!}"),
            CardWidget(text: "Blood: ${user.bloodGroup!}"),
                  ],),
          );
        },
        // child: 
      )),
    );
  }
}

