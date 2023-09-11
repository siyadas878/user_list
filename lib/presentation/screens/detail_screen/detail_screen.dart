import 'package:flutter/material.dart';
import 'package:users_list/application/provider/get_all_provider.dart';
import '../../widgets/card_widget.dart';

class DetailScreen extends StatelessWidget {
  final String id;

  const DetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final isWeb = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: GetAllUsers().getUserData(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text('Empty Data'),
                );
              }
              var user = snapshot.data;

              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: isWeb
                          ? 240
                          : 160, 
                      height: isWeb ? 240 : 160,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.teal,
                          width: 4.0, 
                        ),
                      ),
                      child: CircleAvatar(
                        radius: isWeb ? 120 : 80,
                        backgroundImage: NetworkImage(user!.image!),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    CardWidget(
                        text:
                            'Name:  ${user.firstName!} ${user.maidenName!} ${user.lastName!}'),
                    CardWidget(text: "Age: ${user.age!.toString()}"),
                    CardWidget(text: "Gender: ${user.gender!}"),
                    CardWidget(text: "Email: ${user.email!}"),
                    CardWidget(text: "Phone: ${user.phone!.toString()}"),
                    CardWidget(text: "Blood: ${user.bloodGroup!}"),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
