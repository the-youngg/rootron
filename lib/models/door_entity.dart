class DoorEntity {
	String name;
	int id;
	String deviceId;

	DoorEntity({this.name, this.id, this.deviceId});

	DoorEntity.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		id = json['id'];
		deviceId = json['deviceId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['id'] = this.id;
		data['deviceId'] = this.deviceId;
		return data;
	}
}
