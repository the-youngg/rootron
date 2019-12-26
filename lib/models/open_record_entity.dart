class OpenRecordEntity {
	int positionId;
	String createTime;
	String updateTime;
	int id;
	String type;
	int doorId;
	int applicant;

	OpenRecordEntity({this.positionId, this.createTime, this.updateTime, this.id, this.type, this.doorId, this.applicant});

	OpenRecordEntity.fromJson(Map<String, dynamic> json) {
		positionId = json['positionId'];
		createTime = json['createTime'];
		updateTime = json['updateTime'];
		id = json['id'];
		type = json['type'];
		doorId = json['doorId'];
		applicant = json['applicant'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['positionId'] = this.positionId;
		data['createTime'] = this.createTime;
		data['updateTime'] = this.updateTime;
		data['id'] = this.id;
		data['type'] = this.type;
		data['doorId'] = this.doorId;
		data['applicant'] = this.applicant;
		return data;
	}
}
