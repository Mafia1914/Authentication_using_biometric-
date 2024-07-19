import 'package:json_annotation/json_annotation.dart';
part 'comments_respnse.g.dart';

@JsonSerializable()
class CommentsRespnse {
  CommentsRespnse({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory CommentsRespnse.fromJson(Map<String, dynamic> json) =>
      _$CommentsRespnseFromJson(json);

  final int? postId; // Make it nullable
  final int? id; // Make it nullable
  final String? name; // Make it nullable
  final String? email; // Make it nullable
  final String? body; // Make it nullable

  Map<String, dynamic> toJson() => _$CommentsRespnseToJson(this);
}

