// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Device {

  int? id;
  String deviceName;
  String type;


  Device({
     this.id,
    required this.deviceName,
    required this.type,
  });


  Device copyWith({
    int? id,
    String? deviceName,
    String? type,
  }) {
    return Device(
      id: id ?? this.id,
      deviceName: deviceName ?? this.deviceName,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'deviceName': deviceName,
      'type': type,
    };
  }

  factory Device.fromMap(Map<String, dynamic> map) {
    return Device(
      id: map['id'] as int,
      deviceName: map['deviceName'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Device.fromJson(String source) => Device.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Device(id: $id, deviceName: $deviceName, type: $type)';

  @override
  bool operator ==(covariant Device other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.deviceName == deviceName &&
      other.type == type;
  }

  @override
  int get hashCode => id.hashCode ^ deviceName.hashCode ^ type.hashCode;
}
