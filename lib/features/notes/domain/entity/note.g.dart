// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
      json['title'] as String,
      json['content'] as String,
      json['imageId'] as String,
    );

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'imageId': instance.imageId,
    };
