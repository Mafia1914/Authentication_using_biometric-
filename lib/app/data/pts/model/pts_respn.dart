import 'package:json_annotation/json_annotation.dart';
part 'pts_respn.g.dart';

@JsonSerializable()
class PtsR {
  PtsR({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PtsR.fromJson(Map<String, dynamic> json) =>_$PtsRFromJson(json);

  final int userId;
  final int id;
  final String title;
  final String body;

  Map<String, dynamic> toJson() => _$PtsRToJson(this);
}
