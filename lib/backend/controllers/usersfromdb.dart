import 'package:crudappfirebase/backend/models/users.dart';
import 'package:crudappfirebase/frontend/frontendcontroller/tableclass.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class usersfromdb extends GetxController {
  // create a new instance for the model
  Users users = Users();

  //
  List allUsers = [];
  List usersid = [];
  //
  //

  //
  getData() async {
    await users.user.get().then((value) {
      // store the users data here
      List users = value.docs.map((e) => e.data()).toList();
      // store the doks ids here
      List ids = value.docs.map((e) => e.id).toList();
      allUsers = users;
      usersid = ids;
      print(allUsers);
      update();
      return allUsers;
    });
  }

  ///
}
