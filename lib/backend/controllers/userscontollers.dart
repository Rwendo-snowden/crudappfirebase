import 'package:crudappfirebase/backend/models/users.dart';

class Userscontroller {
  // create a new instance for the model
  Users users = Users();
  //
  List allUsers = [];
  //
  late final name;
  late final age;
  // creating a constractor to intiallize this class
  Userscontroller({required this.name, required this.age});
  // this function is for adding data into the database
  addData() async {
    await users.user.add({
      'name': name,
      'age': age,
    }).then((value) => print('user added success'));
  }

  //
  // this function is for fetching data from firestore
}
