class CreateUserRequestModel {
  String name = '';
  String indexNumber = '';
  String referenceNumber = '';
  String macAddress = '';

  Map<String, String> toJson() {
    Map<String, String> map = {
      'name': name.trim(),
      'index_number': indexNumber.trim(),
      'reference_number': referenceNumber.trim(),
      "mac_address": macAddress.trim()
    };
    return map;
  }
}

class CreateUserResponseModel {
  String? userId;
  String? name;
  String? referenceNumber;
  String? indexNumber;

  CreateUserResponseModel({
    this.userId,
    this.name,
    this.referenceNumber,
    this.indexNumber,
  });
}
