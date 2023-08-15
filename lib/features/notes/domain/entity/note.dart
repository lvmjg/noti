import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable()
class Note{
  final String title;
  final String content;
  @JsonKey(defaultValue: false)
  final bool hasImage;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? id;
  @JsonKey(includeFromJson: false, includeToJson: false)
  XFile? image;

  Note({required this.title, required this.content, required this.hasImage});

  factory Note.fromJson(String id, Map<String, dynamic> json){
   Note note = _$NoteFromJson(json);
   note.id = id;
   return note;
  }
  Map<String, dynamic> toJson() => _$NoteToJson(this);
}