class User {
  final int id;
  final String name;

  User({
    required this.id,
    required this.name,
  });
}

final User currentUser = User(id: 0, name: 'You');

final User customerService = User(id: 1, name: 'CS');
