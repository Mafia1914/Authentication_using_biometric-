// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pts_respn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PtsR _$PtsRFromJson(Map<String, dynamic> json) => PtsR(
      userId: (json['userId'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$PtsRToJson(PtsR instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
