import 'package:allfit_flutter/domains/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tailor.freezed.dart';
part 'tailor.g.dart';

@freezed
class Tailor with _$Tailor {
  const factory Tailor({
    required String id,
    required String authUid,
    required String email,
    required String name,
    String? description,
    required Address address,
    required String phone,
    required String bankAccount,
    required Category category,
    required DateTime createdAt,
    DateTime? deletedAt,
  }) = _Tailor;

  const Tailor._();

  String? get first => category.first;
  String? get second => category.second;
  String? get third => category.third;

  factory Tailor.fromJson(Map<String, dynamic> json) => _$TailorFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    String? first,
    String? second,
    String? third,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
