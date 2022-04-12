import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter_cases/models/chatroom/users.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rooms.g.dart';

@JsonSerializable()
class Room {
  final String id;
  final String name;
  final String description;
  final String lastMessage;

  Room({
    required this.id,
    required this.name,
    required this.description,
    required this.lastMessage,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}

@JsonSerializable()
class RoomMessage {
  final User sender;
  final DateTime timestamp;
  final String content;

  RoomMessage({
    required this.sender,
    required this.timestamp,
    required this.content,
  });

  factory RoomMessage.fromJson(Map<String, dynamic> json) =>
      _$RoomMessageFromJson(json);

  Map<String, dynamic> tojson() => _$RoomMessageToJson(this);
}

@Collection<Room>('rooms')
@Collection<RoomMessage>('rooms/*/messages')
final roomsRef = RoomCollectionReference();
