// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DeviceControlItem {


  int? id;
  String status;
  String timestamp;
  int deviceId;
  DeviceControlItem({
    this.id,
    required this.status,
    required this.timestamp,
    required this.deviceId,
  });

 

  DeviceControlItem copyWith({
    int? id,
    String? status,
    String? timestamp,
    int? deviceId,
  }) {
    return DeviceControlItem(
      id: id ?? this.id,
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
      deviceId: deviceId ?? this.deviceId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
      'timestamp': timestamp,
      'deviceId': deviceId,
    };
  }

  factory DeviceControlItem.fromMap(Map<String, dynamic> map) {
    return DeviceControlItem(
      id: map['id'] != null ? map['id'] as int : null,
      status: map['status'] as String,
      timestamp: map['timestamp'] as String,
      deviceId: map['deviceId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeviceControlItem.fromJson(String source) => DeviceControlItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DeviceControlItem(id: $id, status: $status, timestamp: $timestamp, deviceId: $deviceId)';
  }

  @override
  bool operator ==(covariant DeviceControlItem other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.status == status &&
      other.timestamp == timestamp &&
      other.deviceId == deviceId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      status.hashCode ^
      timestamp.hashCode ^
      deviceId.hashCode;
  }
}
