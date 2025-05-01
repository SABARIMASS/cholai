class GetCoreResponseData {
  GetCoreResponseData({this.status, this.message, this.responseData});

  num? status;
  String? message;
  final ResponseData? responseData;

  factory GetCoreResponseData.fromJson(Map<String, dynamic> json) {
    return GetCoreResponseData(
      status: json["status"] ?? 0,
      message: json["message"] ?? "",
      responseData:
          json["responseData"] == null
              ? null
              : ResponseData.fromJson(json["responseData"]),
    );
  }
}

class ResponseData {
  ResponseData({
    required this.orgSettings,
    required this.riderMapKeyAndroid,
    required this.policyUrl,
  });

  final OrgSettings? orgSettings;
  final String? riderMapKeyAndroid;
  final String? policyUrl;
  factory ResponseData.fromJson(Map<String, dynamic> json) {
    return ResponseData(
      orgSettings:
          json["orgSettings"] == null
              ? null
              : OrgSettings.fromJson(json["orgSettings"]),
      riderMapKeyAndroid:
          json["riderMapKeyAndroid"] is String
              ? json["riderMapKeyAndroid"]
              : "",
      policyUrl: json["privacyPolicay"] is String ? json["privacyPolicay"] : "",
    );
  }
}

class OrgSettings {
  OrgSettings({
    this.id,
    this.organizationId,
    this.name,
    this.exotelIncomingNumber,
    this.orgSettingsId,
    this.currency,
    this.customerConfig,
    this.driverConfig,
    this.dispatch,
    this.appVersionConfig,
    this.location,
    // this.appColor,
    r,
  });
  final String? id;
  final String? organizationId;
  final String? name;
  final String? exotelIncomingNumber;
  final String? orgSettingsId;
  final Currency? currency;
  final CustomerConfig? customerConfig;
  final DriverConfig? driverConfig;
  final DispatchConfigs? dispatch;
  final AppVersionConfig? appVersionConfig;
  final Location? location;
  // final GetThemeData? appColor;

  factory OrgSettings.fromJson(Map<String, dynamic> json) {
    return OrgSettings(
      id: json["_id"] ?? "",
      organizationId: json["organization_id"] ?? "",
      name: json["name"] ?? "",
      exotelIncomingNumber: json['exotel_incoming_number'] ?? '',
      orgSettingsId: json["id"] ?? "",
      currency:
          json["currency"] == null ? null : Currency.fromJson(json["currency"]),
      dispatch:
          json["dispatch_config"] == null
              ? null
              : DispatchConfigs.fromJson(json["dispatch_config"]),
      customerConfig:
          json["customer_config"] == null
              ? null
              : CustomerConfig.fromJson(json["customer_config"]),
      driverConfig:
          json["driver_config"] == null
              ? null
              : DriverConfig.fromJson(json["driver_config"]),
      appVersionConfig:
          json["app_version_config"] == null
              ? null
              : AppVersionConfig.fromJson(json["app_version_config"]),
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
      // appColor:
      //     json["color_code"] is Map<String, dynamic>
      //         ? GetThemeData.fromJson(json["color_code"])
      //         : null,
    );
  }
}

class Currency {
  Currency({
    required this.autoExchangeRate,
    required this.showInStorefront,
    required this.id,
    required this.code,
    required this.name,
    required this.nameFormatted,
    required this.symbol,
    required this.pricePrecision,
    required this.format,
    required this.formatter,
    required this.isBaseCurrency,
    required this.type,
    required this.exchangeRate,
    required this.effectiveDate,
    required this.effectiveDateFormatted,
    required this.status,
    required this.active,
    required this.label,
    required this.value,
  });

  final String autoExchangeRate;
  final bool showInStorefront;
  final String id;
  final String code;
  final String name;
  final String nameFormatted;
  final String symbol;
  final num pricePrecision;
  final String format;
  final Formatter? formatter;
  final bool isBaseCurrency;
  final String type;
  final dynamic exchangeRate;
  final String effectiveDate;
  final String effectiveDateFormatted;
  final String status;
  final String active;
  final String label;
  final String value;

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      autoExchangeRate: json["auto_exchange_rate"] ?? "",
      showInStorefront: json["show_in_storefront"] ?? false,
      id: json["_id"] ?? "",
      code: json["code"] ?? "",
      name: json["name"] ?? "",
      nameFormatted: json["name_formatted"] ?? "",
      symbol: json["symbol"] ?? "",
      pricePrecision: json["price_precision"] ?? 0,
      format: json["format"] ?? "",
      formatter:
          json["formatter"] == null
              ? null
              : Formatter.fromJson(json["formatter"]),
      isBaseCurrency: json["is_base_currency"] ?? false,
      type: json["type"] ?? "",
      exchangeRate: json["exchange_rate"] ?? "",
      effectiveDate: json["effective_date"] ?? "",
      effectiveDateFormatted: json["effective_date_formatted"] ?? "",
      status: json["status"] ?? "",
      active: json["active"] ?? "",
      label: json["label"] ?? "",
      value: json["value"] ?? "",
    );
  }
}

class Formatter {
  Formatter({required this.decimalSeparator, required this.numberSeparator});

  final String decimalSeparator;
  final String numberSeparator;

  factory Formatter.fromJson(Map<String, dynamic> json) {
    return Formatter(
      decimalSeparator: json["decimal_separator"] ?? "",
      numberSeparator: json["number_separator"] ?? "",
    );
  }
}

class CustomerConfig {
  CustomerConfig({required this.freeWaitingTime, required this.speedLimit});

  final WaitingTime? freeWaitingTime;
  final WaitingTime? speedLimit;

  factory CustomerConfig.fromJson(Map<String, dynamic> json) {
    return CustomerConfig(
      freeWaitingTime:
          json["free_waiting_time"] == null
              ? null
              : WaitingTime.fromJson(json["free_waiting_time"]),
      speedLimit:
          json["speed_limit_for_waiting_time"] == null
              ? null
              : WaitingTime.fromJson(json["speed_limit_for_waiting_time"]),
    );
  }
}

class WaitingTime {
  final String? label;
  final String? description;
  final String? type;
  final num? value;

  WaitingTime({this.label, this.description, this.type, this.value});

  factory WaitingTime.fromJson(Map<String, dynamic> json) {
    return WaitingTime(
      label: json['label'] is String ? json['label'] : null,
      description: json['description'] is String ? json['description'] : null,
      type: json['type'] is String ? json['type'] : null,
      value: json['value'] is num ? json['value'] : null,
    );
  }
}

class DriverConfig {
  DriverConfig({required this.minimumWalletAmountToAdd});

  final MinimumWalletAmountToAdd? minimumWalletAmountToAdd;
  factory DriverConfig.fromJson(Map<String, dynamic> json) {
    return DriverConfig(
      minimumWalletAmountToAdd:
          json["minimum_wallet_amount_to_add"] == null
              ? null
              : MinimumWalletAmountToAdd.fromJson(
                json["minimum_wallet_amount_to_add"],
              ),
    );
  }
}

class MinimumWalletAmountToAdd {
  MinimumWalletAmountToAdd({
    required this.label,
    required this.description,
    required this.type,
    required this.value,
  });

  final String label;
  final String description;
  final String type;
  final num value;

  factory MinimumWalletAmountToAdd.fromJson(Map<String, dynamic> json) {
    return MinimumWalletAmountToAdd(
      label: json["label"] ?? "",
      description: json["description"] ?? "",
      type: json["type"] ?? "",
      value: json["value"] ?? 0,
    );
  }
}

class DispatchConfigs {
  RideRequestTime? rideRequestTime;
  DispatchConfigs({this.rideRequestTime});

  DispatchConfigs.fromJson(Map<String, dynamic> json) {
    rideRequestTime =
        json['ride_request_time'] != null
            ? RideRequestTime.fromJson(json['ride_request_time'])
            : null;
  }
}

class RideRequestTime {
  String? label;
  String? description;
  String? type;
  int? value;

  RideRequestTime({this.label, this.description, this.type, this.value});

  RideRequestTime.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    description = json['description'];
    type = json['type'];
    value = int.tryParse("${json['value']}") ?? 10;
  }
}

class AppVersionConfig {
  AppVersionConfig({
    required this.androidAppVersion,
    required this.iosAppVersion,
    required this.androidForceUpdateVersion,
    required this.iosForceUpdateVersion,
    required this.androidUpdateMessage,
    required this.iosUpdateMessage,
    required this.androidForceUpdateMessage,
    required this.iosForceUpdateMessage,
  });

  final String androidAppVersion;
  final String iosAppVersion;
  final String androidForceUpdateVersion;
  final String iosForceUpdateVersion;
  final String androidUpdateMessage;
  final String iosUpdateMessage;
  final String androidForceUpdateMessage;
  final String iosForceUpdateMessage;

  factory AppVersionConfig.fromJson(Map<String, dynamic> json) {
    return AppVersionConfig(
      androidAppVersion: json["android_app_version"] ?? "",
      iosAppVersion: json["ios_app_version"] ?? "",
      androidForceUpdateVersion: json["android_force_update_version"] ?? "",
      iosForceUpdateVersion: json["ios_force_update_version"] ?? "",
      androidUpdateMessage: json["android_update_message"] ?? "",
      iosUpdateMessage: json["ios_update_message"] ?? "",
      androidForceUpdateMessage: json["android_force_update_message"] ?? "",
      iosForceUpdateMessage: json["ios_force_update_message"] ?? "",
    );
  }
}

class Location {
  Location({
    required this.type,
    required this.coordinates,
    required this.address,
    required this.description,
  });

  final String type;
  final List<num> coordinates;
  final String address;
  final String description;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json["type"] ?? "",
      coordinates:
          json["coordinates"] == null
              ? []
              : List<num>.from(json["coordinates"]!.map((x) => x)),
      address: json["address"] ?? "",
      description: json["description"] ?? "",
    );
  }
}
