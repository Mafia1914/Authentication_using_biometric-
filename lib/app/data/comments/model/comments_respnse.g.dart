// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_respnse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentsRespnse _$CommentsRespnseFromJson(Map<String, dynamic> json) =>
    CommentsRespnse(
      postId: (json['postId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$CommentsRespnseToJson(CommentsRespnse instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
