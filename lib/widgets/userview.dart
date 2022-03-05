import 'package:flutter/material.dart';
import 'package:sawayo_assignment/models/userdata.dart';

class Userview extends StatelessWidget {
  const Userview({Key? key, this.userData}) : super(key: key);
  final UserData? userData;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.grey,
        child: Text(
          userData!.name.isNotEmpty ? userData!.name[0] : "?",
          style:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      title: Text(userData!.name),
      subtitle: Text("${userData!.address.city}, ${userData!.address.zipcode}"),
    );
  }
}
