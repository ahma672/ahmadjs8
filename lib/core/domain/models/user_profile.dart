import 'package:flutter/foundation.dart';

@immutable
class UserProfile {
  final String uid;
  final String email;
  final String displayName;
  final String? avatarUrl;
  final bool isAdmin;
  final bool isPremium;
  final String paymentStatus; // 'none', 'pending', 'approved'
  final Map<String, dynamic> metadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserProfile({
    required this.uid,
    required this.email,
    required this.displayName,
    this.avatarUrl,
    this.isAdmin = false,
    this.isPremium = false,
    this.paymentStatus = 'none',
    this.metadata = const {},
    required this.createdAt,
    required this.updatedAt,
  });

  UserProfile copyWith({
    String? uid,
    String? email,
    String? displayName,
    String? avatarUrl,
    bool? isAdmin,
    bool? isPremium,
    String? paymentStatus,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserProfile(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      isAdmin: isAdmin ?? this.isAdmin,
      isPremium: isPremium ?? this.isPremium,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'avatarUrl': avatarUrl,
      'isAdmin': isAdmin,
      'isPremium': isPremium,
      'paymentStatus': paymentStatus,
      'metadata': metadata,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      displayName: map['displayName'] ?? '',
      avatarUrl: map['avatarUrl'],
      isAdmin: map['isAdmin'] ?? false,
      isPremium: map['isPremium'] ?? false,
      paymentStatus: map['paymentStatus'] ?? 'none',
      metadata: map['metadata'] ?? {},
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : DateTime.now(),
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'])
          : DateTime.now(),
    );
  }

  @override
  String toString() {
    return 'UserProfile(uid: $uid, email: $email, displayName: $displayName, '
        'isAdmin: $isAdmin, isPremium: $isPremium)';
  }
}
