class UserModel {
  final String? email;
  final String? uid;
  final String? name;
  final String? role;
  final String? branch;
  final String? batch;
  final String? id;
  final String? mobile;
  final DateTime? createdAt;
  final String?FCM_Token;

  UserModel({
    this.email,
    this.name,
    this.role,
    this.branch,
    this.batch,
    this.id,
    this.uid,
    this.mobile,
    this.createdAt,
    this.FCM_Token,
  });

  /// Factory constructor to create a `UserModel` from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String?,
      name: json['name'] ?? 'user',
      role: json['role'] ?? 'student',
      branch: json['branch'] ?? 'branch',
      batch: json['batch'] ?? 'batch',
      id: json['id'] ?? 'id',
      uid: json['uid'] ?? 'uid',
      mobile: json['mobile'] ?? 'mobile',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      FCM_Token: json['FCM_Token']??'FCM_Token'
    );
  }

  /// Method to convert the `UserModel` to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'role': role,
      'branch': branch,
      'batch': batch,
      'id': id,
      'uid': uid,
      'mobile': mobile,
      'createdAt': createdAt?.toIso8601String(),
      'FCM_Token':FCM_Token,
    };
  }

  @override
  String toString() {
    return 'UserModel(email: $email, name: $name, role: $role, branch: $branch, batch: $batch, id: $id, uid: $uid, mobile: $mobile, createdAt: $createdAt,FCM_Token:$FCM_Token)';
  }

}
