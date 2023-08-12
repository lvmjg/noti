import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable()
class Note{
  final String title;
  final String content;
  @JsonKey(includeFromJson: false, includeToJson: false)
  XFile? image;

  Note({required this.title, required this.content});

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  Map<String, dynamic> toJson() => _$NoteToJson(this);
}