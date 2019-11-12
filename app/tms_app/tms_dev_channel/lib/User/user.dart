class User {
  final String userId;
  final int status;
  final String rights;
  final String username;
  final String photoUrl;
  final String source;

  User({
    this.status,
    this.rights,
    this.userId,
    this.username,
    this.photoUrl,
    this.source
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
      userId: json['id'],
      status: json['status'],
      username: json['user'],
      photoUrl: json['photoUrl'],
      rights: json['rights'],
      source: json['source']
    );
  }
}