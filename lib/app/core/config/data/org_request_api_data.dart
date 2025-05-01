class OrganizationRequestData {
  final String orgUniqueId;

  OrganizationRequestData({
    required this.orgUniqueId,
  });

  // Convert the object to JSON
  Map<String, dynamic> toJson() {
    return {
      'orgUniqueId': orgUniqueId,
    };
  }
}
