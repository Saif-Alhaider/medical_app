class UserAccount {
  final String firstName, lastName, email, password;
  UserAccount({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}

class User{
  static final List<UserAccount> users = [];


  void addUser(UserAccount account){
    users.add(account);
    // print(_users);
  }
  // List<UserAccount> get users => _users; 

  
}
