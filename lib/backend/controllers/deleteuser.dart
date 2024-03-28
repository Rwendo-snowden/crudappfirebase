import 'package:crudappfirebase/backend/models/users.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class dataDelete {
  Users users = Users();

  deleted(var id) async {
    await users.user.doc(id).delete();
  }
}
