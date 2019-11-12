class TenantDetails {
  final String userId;
  final int status;
  final String rights;
  final String username;
  final String photoUrl;
  final String source;

  TenantDetails({
    this.userId,
    this.status, 
    this.rights, 
    this.username, 
    this.photoUrl, 
    this.source
  });

  factory TenantDetails.fromJson(Map<String, dynamic> jsonObject) {
    return new TenantDetails(
      userId: jsonObject['ten_1']['id'],
      status: jsonObject['ten_1']['status'],
      username: jsonObject['ten_1']['user'],
      photoUrl: jsonObject['ten_1']['photoUrl'],
      rights: jsonObject['ten_1']['rights'],
      source: jsonObject['ten_1']['source']
    );
  }
}