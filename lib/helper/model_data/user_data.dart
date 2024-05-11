import '../../model/user.dart';

List<User> getUserData() {
  return [
    User(
      userId: 1,
      userName: "Atul Patel",
      emailId: "atul@gmail.com",
      password: "atul123",
    ),
    User(
      userId: 2,
      userName: "Shreyash Porwal",
      emailId: "shreyash@gmail.com",
      password: "shreyash123",
    ),
    User(
      userId: 3,
      userName: "Vedant Rana",
      emailId: "vedant@gmail.com",
      password: "vedant123",
    ),
    // Add more users as needed
  ];
}