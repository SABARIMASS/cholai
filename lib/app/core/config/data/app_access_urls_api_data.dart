class OrganizationResponseData {
  final String baseUrl;
  final String docBaseUrl;
  final String docTempBaseUrl;
  final String anonKey;
  final String orgUniqueId;
  final String tenantUniqueId;
  final String tenantId;

  OrganizationResponseData({
    this.baseUrl = '',
    this.docBaseUrl = '',
    this.docTempBaseUrl = '',
    this.anonKey = '',
    this.orgUniqueId = '',
    this.tenantUniqueId = '',
    this.tenantId = '',
  });

  // Factory constructor to create an instance from a JSON object
  factory OrganizationResponseData.fromJson(Map<String, dynamic> json) {
    return OrganizationResponseData(
      baseUrl: json['base_url'] ?? '',
      docBaseUrl: json['doc_base_url'] ?? '',
      docTempBaseUrl: json['doc_temp_base_url'] ?? '',
      anonKey: json['anon_key'] ?? '',
      orgUniqueId: json['org_unique_id'] ?? '',
      tenantUniqueId: json['tenant_unique_id'] ?? '',
      tenantId: json['tenant_id'] ?? '',
    );
  }

  // Method to convert an instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'base_url': baseUrl,
      'doc_base_url': docBaseUrl,
      'doc_temp_base_url': docTempBaseUrl,
      'anon_key': anonKey,
      'org_unique_id': orgUniqueId,
      'tenant_unique_id': tenantUniqueId,
      'tenant_id': tenantId,
    };
  }
}

class AppGetApiResponse {
  int status;
  String message;
  final OrganizationResponseData? responseData;

  AppGetApiResponse({
    this.status = 0,
    this.message = '',
    this.responseData,
  });

  // Factory constructor to create an instance from a JSON object
  factory AppGetApiResponse.fromJson(Map<String, dynamic> json) {
    return AppGetApiResponse(
      status: json['status'] ?? 0,
      message: json['message'] ?? '',
      responseData: json['responseData'] != null
          ? OrganizationResponseData?.fromJson(json['responseData'])
          : null,
    );
  }

  // Method to convert an instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'responseData': responseData?.toJson(),
    };
  }
}
