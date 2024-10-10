class UserModel {
  final String name;
  final int id;

  UserModel({required this.id, required this.name});
}

List<UserModel> userList = [
  UserModel(id: 1, name: "Shakib Al Hasan"),
  UserModel(id: 2, name: "Tamim Iqbal"),
  UserModel(id: 3, name: "Mushfiqur Rahim"),
  UserModel(id: 4, name: "Mashrafee Bin Mortaza"),
];
