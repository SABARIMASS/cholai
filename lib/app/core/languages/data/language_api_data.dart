class LanguageResponseData {
  final LanguageContent en;
  final LanguageContent tn;

  LanguageResponseData({required this.en, required this.tn});

  factory LanguageResponseData.fromJson(Map<String, dynamic> json) {
    return LanguageResponseData(
      en: LanguageContent.fromJson(json['en']),
      tn: LanguageContent.fromJson(json['tn']),
    );
  }
}

class LanguageContent {
  final String online;
  final String offline;
  final String home;
  final String rides;
  final String payout;
  final String refresh;
  final String earningToday;
  final String tripsCompleted;
  final String loginHours;
  final String lastUpdatedAt;
  final String connectingWithServer;
  final String acceptTheRide;
  final String seconds;
  final String rideId;
  final String jobRequested;
  final String estimatedFare;
  final String profile;
  final String helpAndSupport;
  final String more;
  final String about;
  final String signOut;
  final String requestToDeleteAccount;
  final String batteryOptimization;
  final String displayOverTheApp;
  final String changeTheme;
  final String changeLanguage;
  final String trips;
  final String upcomingTrips;
  final String earningForTheWeek;
  final String earningForLastWeek;
  final String earningForTheMonth;
  final String earningForLastMonth;
  final String earningForTheDay;
  final String earningForLastDay;
  final String surgePay;
  final String extraPayDuringCertainTime;
  final String networkError;
  final String months;
  final String cancel;
  final String weeks;
  final String ok;
  final String selectDate;
  final String enterDate;
  final String driverProfile;
  final String edit;
  final String ratings;
  final String tripsToday;
  final String totalEarnings;
  final String vehicleDetails;
  final String numberPlate;
  final String color;
  final String brand;
  final String model;
  final String manufacturedYear;
  final String documents;
  final String licenseImages;
  final String open;
  final String nationalIdImages;
  final String generalInformation;
  final String uniqueId;
  final String phoneNumber;
  final String mailId;
  final String address;
  final String registerDate;
  final String licenseNumber;
  final String bankDetails;
  final String accountHolderName;
  final String accountType;
  final String paymentType;
  final String bankName;
  final String bankAddress;
  final String accountNumber;
  final String ifscCode;
  final String currency;
  final String scheduledTime;
  final String payment;
  final String date;
  final String time;
  final String travel;
  final String rideTime;
  final String price;
  final String totalAmount;
  final String baseFare;
  final String subTotal;
  final String total;
  final String totalDuration;
  final String durationFare;
  final String totalDistance;
  final String distanceFare;
  final String waitingTime;
  final String waitingFare;
  final String zoneFare;
  final String minimumFare;
  final String surgeFare;
  final String cancellationFare;
  final String rideHistory;
  final String overallRides;
  final String distance;
  final String confirmOffline;
  final String confirmOfflineMessage;
  final String no;
  final String yes;
  final String confirmOnline;
  final String confirmOnlineMessage;
  final String deleteAccount;
  final String deleteAccountReasonMessage;
  final String yourEmailId;
  final String exampleEmail;
  final String reasonForDeletingAccount;
  final String describeIssuePlaceholder;
  final String descriptionMinCharacters;
  final String submitRequest;
  final String english;
  final String tamil;
  final String confirmAccountDeletion;
  final String confirmAccountDeletionMessage;
  final String enterEmail;
  final String enterValidEmail;

  final String tripsTodayTotalEarnings;

  final String confirmSignOut;
  final String confirmSignOutMessage;
  final String forceLoginRequired;
  final String forceLoginMessage;
  final String cancelRide;
  final String cancelRideMessage;
  final String continueText;
  final String permissionToTrack;
  final String dearUser;
  final String ongoingRideShiftMessage;
  final String ongoingRide;
  final String deviceLoginConflict;
  final String deviceLoginConflictMessage;
  final String forceLogout;
  final String forceLogoutMessage;
  final String onlineSignOutWarning;
  final String signOutWarning;
  final String activeRideWarning;
  final String logout;
  final String activeRideDetected;
  final String activeRideDetectedMessage;
  final String additionalNotes;
  final String okay;
  final String next;
  final String alwaysOnLocationAccessMessage;
  final String enableLocationServicesMessage;
  final String enableLocationServices;
  final String allowAlwaysOnLocationAccess;
  final String enableNotifications;
  final String enableNotificationsMessage;
  final String disableBatteryOptimization;
  final String disableBatteryOptimizationMessage;
  final String displayOverOtherApps;
  final String displayOverOtherAppsMessage;
  final String signIn;
  final String welcomeMessage;

  final String noAccount;
  final String signUp;
  final String createProfile;
  final String name;
  final String exampleName;
  final String email;

  final String dob;
  final String exampleDob;

  final String exampleAddress;
  final String gender;
  final String selectGender;
  final String licenceNumber;
  final String exampleLicenceNumber;
  final String licenceExpiryDate;
  final String exampleLicenceExpiryDate;
  final String nationalIdNumber;
  final String exampleNationalIdNumber;
  final String bankAccountNumber;
  final String exampleBankAccountNumber;

  final String exampleBankName;
  final String isOwnAsset;
  final String assetPlateNumber;
  final String exampleAssetPlateNumber;
  final String assetModel;
  final String signUpButton;
  final String assetModels;
  final String enterValidPhoneNumber;
  final String startTypingToSearch;
  final String search;
  final String selectCountryCode;
  final String verifyOtp;
  final String otpInstruction;
  final String verifyCode;
  final String emailRequired;
  final String validEmail;
  final String nameRequired;
  final String validName;
  final String panRequired;
  final String validPan;
  final String aadhaarRequired;
  final String validAadhaar;
  final String dobRequired;
  final String validDateFormat;
  final String futureDob;
  final String minimumAge;
  final String maximumAge;
  final String fieldRequired;
  final String assetPlateRequired;
  final String validAssetPlate;
  final String assetPlateLength;
  final String addressRequired;
  final String addressLength;
  final String licenceNumberRequired;
  final String validLicenceNumber;
  final String licenceNumberLength;
  final String nationalIdRequired;
  final String nationalIdDigits;
  final String nationalIdLength;
  final String licenceExpiryRequired;
  final String validExpiryDate;
  final String futureExpiryDate;
  final String bankAccountRequired;
  final String bankAccountDigits;
  final String bankAccountLength;
  final String bankNameRequired;
  final String validBankName;
  final String validNumber;
  final String minNumberLength;
  final String maxNumberLength;
  final String minNumber;
  final String coreDataFetching;
  final String accessingLocation;
  final String settingUp;
  final String profileEdit;
  final String profilePicture;
  final String driversLicenseFront;
  final String driversLicenseBack;
  final String nationalIdFront;
  final String nationalIdBack;
  final String registrationDocument;
  final String assetImage;
  final String assetThumbnail;
  final String insuranceDocument;
  final String pollutionDocument;
  final String rideInfo;
  String invalidOtp;
  String otpVerificationFailed;
  String missingOrIncompleteItems;
  String licenceExpiryDateError;
  String assetThumbImages;

  String insuranceCertificate;
  String pollutionCertificate;

  String uploadDocuments;
  String submit;
  String paymentPending;
  String completed;
  String accepted;
  String inProgress;
  String cancelled;
  String assigned;
  String requested;
  String driverArrived;
  String accessToken;
  String accessTokenDescription;
  String submitAccessToken;
  String enterValidAccessToken;
  String wallet;
  String currentBalance;
  String topUpWallet;
  String transactions;
  String seeAll;
  String noTransactions;
  String transactionHistory;
  String addAmountToWallet;
  String enterAmountToAdd;
  String enterValidAmount;
  String loading;
  String addingFunds;
  final String amountToSettle;
  final String commissionAmount;
  final String packageDuration;
  final String packageDistance;
  final String packageType;
  final String additionalDistanceFare;
  final String additionalDurationFare;
  final String additionalFarePerKm;
  final String additionalFarePerMin;
  final String markAsArrived;
  final String startTrip;
  final String completeTrip;
  final String paymentCompletedSuccessfully;
  final String arrivedAtPickupLocation;
  final String pickUpPassenger;
  final String arrivedAtDestination;
  final String goToHome;
  final String endWithCash;
  final String call;
  final String recenter;
  final String goToMap;
  final String paymentReceived;

  final String fetchCurrentLocation;
  final String driverAllowance;
  final String discountFare;
  LanguageContent({
    required this.online,
    required this.offline,
    required this.home,
    required this.rides,
    required this.payout,
    required this.refresh,
    required this.earningToday,
    required this.tripsCompleted,
    required this.loginHours,
    required this.lastUpdatedAt,
    required this.connectingWithServer,
    required this.acceptTheRide,
    required this.seconds,
    required this.rideId,
    required this.jobRequested,
    required this.estimatedFare,
    required this.profile,
    required this.helpAndSupport,
    required this.more,
    required this.about,
    required this.signOut,
    required this.requestToDeleteAccount,
    required this.batteryOptimization,
    required this.displayOverTheApp,
    required this.changeTheme,
    required this.changeLanguage,
    required this.trips,
    required this.upcomingTrips,
    required this.earningForTheWeek,
    required this.earningForLastWeek,
    required this.earningForTheMonth,
    required this.earningForLastMonth,
    required this.earningForTheDay,
    required this.earningForLastDay,
    required this.surgePay,
    required this.extraPayDuringCertainTime,
    required this.networkError,
    required this.months,
    required this.cancel,
    required this.weeks,
    required this.ok,
    required this.selectDate,
    required this.enterDate,
    required this.driverProfile,
    required this.edit,
    required this.ratings,
    required this.tripsToday,
    required this.totalEarnings,
    required this.vehicleDetails,
    required this.numberPlate,
    required this.color,
    required this.brand,
    required this.model,
    required this.manufacturedYear,
    required this.documents,
    required this.licenseImages,
    required this.open,
    required this.nationalIdImages,
    required this.generalInformation,
    required this.uniqueId,
    required this.phoneNumber,
    required this.mailId,
    required this.address,
    required this.registerDate,
    required this.licenseNumber,
    required this.bankDetails,
    required this.accountHolderName,
    required this.accountType,
    required this.paymentType,
    required this.bankName,
    required this.bankAddress,
    required this.accountNumber,
    required this.ifscCode,
    required this.currency,
    required this.scheduledTime,
    required this.payment,
    required this.date,
    required this.time,
    required this.travel,
    required this.rideTime,
    required this.price,
    required this.totalAmount,
    required this.baseFare,
    required this.subTotal,
    required this.total,
    required this.totalDuration,
    required this.durationFare,
    required this.totalDistance,
    required this.distanceFare,
    required this.waitingTime,
    required this.waitingFare,
    required this.zoneFare,
    required this.minimumFare,
    required this.surgeFare,
    required this.cancellationFare,
    required this.rideHistory,
    required this.overallRides,
    required this.distance,
    required this.confirmOffline,
    required this.confirmOfflineMessage,
    required this.no,
    required this.yes,
    required this.confirmOnline,
    required this.confirmOnlineMessage,
    required this.deleteAccount,
    required this.deleteAccountReasonMessage,
    required this.yourEmailId,
    required this.exampleEmail,
    required this.reasonForDeletingAccount,
    required this.describeIssuePlaceholder,
    required this.descriptionMinCharacters,
    required this.submitRequest,
    required this.english,
    required this.tamil,
    required this.confirmAccountDeletion,
    required this.confirmAccountDeletionMessage,
    required this.enterEmail,
    required this.enterValidEmail,
    required this.tripsTodayTotalEarnings,
    required this.confirmSignOut,
    required this.confirmSignOutMessage,
    required this.forceLoginRequired,
    required this.forceLoginMessage,
    required this.cancelRide,
    required this.cancelRideMessage,
    required this.continueText,
    required this.permissionToTrack,
    required this.dearUser,
    required this.ongoingRideShiftMessage,
    required this.ongoingRide,
    required this.deviceLoginConflict,
    required this.deviceLoginConflictMessage,
    required this.forceLogout,
    required this.forceLogoutMessage,
    required this.onlineSignOutWarning,
    required this.signOutWarning,
    required this.activeRideWarning,
    required this.logout,
    required this.activeRideDetected,
    required this.activeRideDetectedMessage,
    required this.additionalNotes,
    required this.okay,
    required this.next,
    required this.alwaysOnLocationAccessMessage,
    required this.enableLocationServicesMessage,
    required this.enableLocationServices,
    required this.allowAlwaysOnLocationAccess,
    required this.enableNotifications,
    required this.enableNotificationsMessage,
    required this.disableBatteryOptimization,
    required this.disableBatteryOptimizationMessage,
    required this.displayOverOtherApps,
    required this.displayOverOtherAppsMessage,
    required this.signIn,
    required this.welcomeMessage,
    required this.noAccount,
    required this.signUp,
    required this.createProfile,
    required this.name,
    required this.exampleName,
    required this.email,
    required this.dob,
    required this.exampleDob,
    required this.exampleAddress,
    required this.gender,
    required this.selectGender,
    required this.licenceNumber,
    required this.exampleLicenceNumber,
    required this.licenceExpiryDate,
    required this.exampleLicenceExpiryDate,
    required this.nationalIdNumber,
    required this.exampleNationalIdNumber,
    required this.bankAccountNumber,
    required this.exampleBankAccountNumber,
    required this.exampleBankName,
    required this.isOwnAsset,
    required this.assetPlateNumber,
    required this.exampleAssetPlateNumber,
    required this.assetModel,
    required this.signUpButton,
    required this.assetModels,
    required this.enterValidPhoneNumber,
    required this.startTypingToSearch,
    required this.search,
    required this.selectCountryCode,
    required this.verifyOtp,
    required this.otpInstruction,
    required this.verifyCode,
    required this.emailRequired,
    required this.validEmail,
    required this.nameRequired,
    required this.validName,
    required this.panRequired,
    required this.validPan,
    required this.aadhaarRequired,
    required this.validAadhaar,
    required this.dobRequired,
    required this.validDateFormat,
    required this.futureDob,
    required this.minimumAge,
    required this.maximumAge,
    required this.fieldRequired,
    required this.assetPlateRequired,
    required this.validAssetPlate,
    required this.assetPlateLength,
    required this.addressRequired,
    required this.addressLength,
    required this.licenceNumberRequired,
    required this.validLicenceNumber,
    required this.licenceNumberLength,
    required this.nationalIdRequired,
    required this.nationalIdDigits,
    required this.nationalIdLength,
    required this.licenceExpiryRequired,
    required this.validExpiryDate,
    required this.futureExpiryDate,
    required this.bankAccountRequired,
    required this.bankAccountDigits,
    required this.bankAccountLength,
    required this.bankNameRequired,
    required this.validBankName,
    required this.validNumber,
    required this.minNumberLength,
    required this.maxNumberLength,
    required this.minNumber,
    required this.coreDataFetching,
    required this.accessingLocation,
    required this.settingUp,
    required this.profileEdit,
    required this.profilePicture,
    required this.driversLicenseFront,
    required this.driversLicenseBack,
    required this.nationalIdFront,
    required this.nationalIdBack,
    required this.registrationDocument,
    required this.assetImage,
    required this.assetThumbnail,
    required this.insuranceDocument,
    required this.pollutionDocument,
    required this.rideInfo,
    required this.invalidOtp,
    required this.otpVerificationFailed,
    required this.missingOrIncompleteItems,
    required this.licenceExpiryDateError,
    required this.assetThumbImages,
    required this.insuranceCertificate,
    required this.pollutionCertificate,
    required this.uploadDocuments,
    required this.submit,
    required this.paymentPending,
    required this.completed,
    required this.accepted,
    required this.inProgress,
    required this.cancelled,
    required this.assigned,
    required this.requested,
    required this.driverArrived,
    required this.accessToken,
    required this.accessTokenDescription,
    required this.submitAccessToken,
    required this.enterValidAccessToken,
    required this.wallet,
    required this.currentBalance,
    required this.topUpWallet,
    required this.transactions,
    required this.seeAll,
    required this.noTransactions,
    required this.transactionHistory,
    required this.addAmountToWallet,
    required this.enterAmountToAdd,
    required this.enterValidAmount,
    required this.loading,
    required this.addingFunds,
    required this.amountToSettle,
    required this.commissionAmount,
    required this.packageDuration,
    required this.packageDistance,
    required this.packageType,
    required this.additionalDistanceFare,
    required this.additionalDurationFare,
    required this.additionalFarePerKm,
    required this.additionalFarePerMin,
    required this.markAsArrived,
    required this.startTrip,
    required this.completeTrip,
    required this.paymentCompletedSuccessfully,
    required this.arrivedAtPickupLocation,
    required this.pickUpPassenger,
    required this.arrivedAtDestination,
    required this.goToHome,
    required this.endWithCash,
    required this.call,
    required this.recenter,
    required this.goToMap,
    required this.paymentReceived,
    required this.fetchCurrentLocation,
    required this.driverAllowance,
    required this.discountFare,
  });

  // Factory method to create LanguageContent from JSON
  factory LanguageContent.fromJson(Map<String, dynamic> json) {
    return LanguageContent(
      online: json['online'] ?? '',
      offline: json['offline'] ?? '',
      home: json['home'] ?? '',
      rides: json['rides'] ?? '',
      payout: json['payout'] ?? '',
      refresh: json['refresh'] ?? '',
      earningToday: json['earning_today'] ?? '',
      tripsCompleted: json['trips_completed'] ?? '',
      loginHours: json['login_hours'] ?? '',
      lastUpdatedAt: json['last_updated_at'] ?? '',
      connectingWithServer: json['connecting_with_server'] ?? '',
      acceptTheRide: json['accept_the_ride'] ?? '',
      seconds: json['seconds'] ?? '',
      rideId: json['ride_id'] ?? '',
      jobRequested: json['job_requested'] ?? '',
      estimatedFare: json['estimated_fare'] ?? '',
      profile: json['profile'] ?? '',
      helpAndSupport: json['help_and_support'] ?? '',
      more: json['more'] ?? '',
      about: json['about'] ?? '',
      signOut: json['sign_out'] ?? '',
      requestToDeleteAccount: json['request_to_delete_account'] ?? '',
      batteryOptimization: json['battery_optimization'] ?? '',
      displayOverTheApp: json['display_over_the_app'] ?? '',
      changeTheme: json['change_theme'] ?? '',
      changeLanguage: json['change_language'] ?? '',
      trips: json['trips'] ?? '',
      upcomingTrips: json['upcoming_trips'] ?? '',
      earningForTheWeek: json['earning_for_the_week'] ?? '',
      earningForLastWeek: json['earning_for_last_week'] ?? '',
      earningForTheMonth: json['earning_for_the_month'] ?? '',
      earningForLastMonth: json['earning_for_last_month'] ?? '',
      earningForTheDay: json['earning_for_the_day'] ?? '',
      earningForLastDay: json['earning_for_last_day'] ?? '',
      surgePay: json['surge_pay'] ?? '',
      extraPayDuringCertainTime: json['extra_pay_during_certain_time'] ?? '',
      networkError: json['network_error'],
      months: json['months'],
      cancel: json['cancel'],
      weeks: json['weeks'],
      ok: json['ok'],
      selectDate: json['select_date'],
      enterDate: json['enter_date'],
      driverProfile: json['driver_profile'],
      edit: json['edit'],
      ratings: json['ratings'],
      tripsToday: json['trips_today'],
      totalEarnings: json['total_earnings'],
      vehicleDetails: json['vehicle_details'],
      numberPlate: json['number_plate'],
      color: json['color'],
      brand: json['brand'],
      model: json['model'],
      manufacturedYear: json['manufactured_year'],
      documents: json['documents'],
      licenseImages: json['license_images'],
      open: json['open'],
      nationalIdImages: json['national_id_images'],
      generalInformation: json['general_information'],
      uniqueId: json['unique_id'],
      phoneNumber: json['phone_number'],
      mailId: json['mail_id'],
      address: json['address'],
      registerDate: json['register_date'],
      licenseNumber: json['license_number'],
      bankDetails: json['bank_details'],
      accountHolderName: json['account_holder_name'],
      accountType: json['account_type'],
      paymentType: json['payment_type'],
      bankName: json['bank_name'],
      bankAddress: json['bank_address'],
      accountNumber: json['account_number'],
      ifscCode: json['ifsc_code'],
      currency: json['currency'],
      scheduledTime: json['scheduled_time'],
      payment: json['payment'],
      date: json['date'],
      time: json['time'],
      travel: json['travel'],
      rideTime: json['ride_time'],
      price: json['price'],
      totalAmount: json['total_amount'],
      baseFare: json['base_fare'],
      subTotal: json['sub_total'],
      total: json['total'],
      totalDuration: json['total_duration'],
      durationFare: json['duration_fare'],
      totalDistance: json['total_distance'],
      distanceFare: json['distance_fare'],
      waitingTime: json['waiting_time'],
      waitingFare: json['waiting_fare'],
      zoneFare: json['zone_fare'],
      minimumFare: json['minimum_fare'],
      surgeFare: json['surge_fare'],
      cancellationFare: json['cancellation_fare'],
      rideHistory: json['ride_history'],
      overallRides: json['overall_rides'],
      distance: json['distance'],
      confirmOffline: json['confirm_offline'],
      confirmOfflineMessage: json['confirm_offline_message'],
      no: json['no'],
      yes: json['yes'],
      confirmOnline: json['confirm_online'],
      confirmOnlineMessage: json['confirm_online_message'],
      deleteAccount: json['delete_account'],
      deleteAccountReasonMessage: json['delete_account_reason_message'],
      yourEmailId: json['your_email_id'],
      exampleEmail: json['example_email'],
      reasonForDeletingAccount: json['reason_for_deleting_account'],
      describeIssuePlaceholder: json['describe_issue_placeholder'],
      descriptionMinCharacters: json['description_min_characters'],
      submitRequest: json['submit_request'],
      english: json['english'],
      tamil: json['tamil'],
      confirmAccountDeletion: json['confirm_account_deletion'],
      confirmAccountDeletionMessage: json['confirm_account_deletion_message'],
      enterEmail: json['enterEmail'],
      enterValidEmail: json['enterValidEmail'],
      tripsTodayTotalEarnings: json['tripsTodayTotalEarnings'],
      confirmSignOut: json['confirmSignOut'],
      confirmSignOutMessage: json['confirmSignOutMessage'],
      forceLoginRequired: json['forceLoginRequired'],
      forceLoginMessage: json['forceLoginMessage'],
      cancelRide: json['cancelRide'],
      cancelRideMessage: json['cancelRideMessage'],
      continueText: json['continue'],
      permissionToTrack: json['permissionToTrack'],
      dearUser: json['dearUser'],
      ongoingRideShiftMessage: json['ongoingRideShiftMessage'],
      ongoingRide: json['ongoingRide'],
      deviceLoginConflict: json['deviceLoginConflict'],
      deviceLoginConflictMessage: json['deviceLoginConflictMessage'],
      forceLogout: json['forceLogout'],
      forceLogoutMessage: json['forceLogoutMessage'],
      onlineSignOutWarning: json['onlineSignOutWarning'],
      signOutWarning: json['signOutWarning'],
      activeRideWarning: json['activeRideWarning'],
      logout: json['logout'],
      activeRideDetected: json['activeRideDetected'],
      activeRideDetectedMessage: json['activeRideDetectedMessage'],
      additionalNotes: json['additionalNotes'],
      okay: json['okay'],
      next: json['next'],
      alwaysOnLocationAccessMessage: json['alwaysOnLocationAccessMessage'],
      enableLocationServicesMessage: json['enableLocationServicesMessage'],
      enableLocationServices: json['enableLocationServices'],
      allowAlwaysOnLocationAccess: json['allowAlwaysOnLocationAccess'],
      enableNotifications: json['enableNotifications'],
      enableNotificationsMessage: json['enableNotificationsMessage'],
      disableBatteryOptimization: json['disableBatteryOptimization'],
      disableBatteryOptimizationMessage:
          json['disableBatteryOptimizationMessage'],
      displayOverOtherApps: json['displayOverOtherApps'],
      displayOverOtherAppsMessage: json['displayOverOtherAppsMessage'],
      signIn: json['signIn'],
      welcomeMessage: json['welcomeMessage'],
      noAccount: json['noAccount'],
      signUp: json['signUp'],
      createProfile: json['createProfile'],
      name: json['name'],
      exampleName: json['exampleName'],
      email: json['email'],
      dob: json['dob'],
      exampleDob: json['exampleDob'],
      exampleAddress: json['exampleAddress'],
      gender: json['gender'],
      selectGender: json['selectGender'],
      licenceNumber: json['licenceNumber'],
      exampleLicenceNumber: json['exampleLicenceNumber'],
      licenceExpiryDate: json['licenceExpiryDate'],
      exampleLicenceExpiryDate: json['exampleLicenceExpiryDate'],
      nationalIdNumber: json['nationalIdNumber'],
      exampleNationalIdNumber: json['exampleNationalIdNumber'],
      bankAccountNumber: json['bankAccountNumber'],
      exampleBankAccountNumber: json['exampleBankAccountNumber'],
      exampleBankName: json['exampleBankName'],
      isOwnAsset: json['isOwnAsset'],
      assetPlateNumber: json['assetPlateNumber'],
      exampleAssetPlateNumber: json['exampleAssetPlateNumber'],
      assetModel: json['assetModel'],
      signUpButton: json['signUpButton'],
      assetModels: json['assetModels'],
      enterValidPhoneNumber: json['enterValidPhoneNumber'],
      startTypingToSearch: json['startTypingToSearch'],
      search: json['search'],
      selectCountryCode: json['selectCountryCode'],
      verifyOtp: json['verifyOtp'],
      otpInstruction: json['otpInstruction'],
      verifyCode: json['verifyCode'],
      emailRequired: json['emailRequired'],
      validEmail: json['validEmail'],
      nameRequired: json['nameRequired'],
      validName: json['validName'],
      panRequired: json['panRequired'],
      validPan: json['validPan'],
      aadhaarRequired: json['aadhaarRequired'],
      validAadhaar: json['validAadhaar'],
      dobRequired: json['dobRequired'],
      validDateFormat: json['validDateFormat'],
      futureDob: json['futureDob'],
      minimumAge: json['minimumAge'],
      maximumAge: json['maximumAge'],
      fieldRequired: json['fieldRequired'],
      assetPlateRequired: json['assetPlateRequired'],
      validAssetPlate: json['validAssetPlate'],
      assetPlateLength: json['assetPlateLength'],
      addressRequired: json['addressRequired'],
      addressLength: json['addressLength'],
      licenceNumberRequired: json['licenceNumberRequired'],
      validLicenceNumber: json['validLicenceNumber'],
      licenceNumberLength: json['licenceNumberLength'],
      nationalIdRequired: json['nationalIdRequired'],
      nationalIdDigits: json['nationalIdDigits'],
      nationalIdLength: json['nationalIdLength'],
      licenceExpiryRequired: json['licenceExpiryRequired'],
      validExpiryDate: json['validExpiryDate'],
      futureExpiryDate: json['futureExpiryDate'],
      bankAccountRequired: json['bankAccountRequired'],
      bankAccountDigits: json['bankAccountDigits'],
      bankAccountLength: json['bankAccountLength'],
      bankNameRequired: json['bankNameRequired'],
      validBankName: json['validBankName'],
      validNumber: json['validNumber'],
      minNumberLength: json['minNumberLength'],
      maxNumberLength: json['maxNumberLength'],
      minNumber: json['minNumber'],
      coreDataFetching: json['coreDataFetching'],
      accessingLocation: json['accessingLocation'],
      settingUp: json['settingUp'],
      profileEdit: json['profileEdit'],
      profilePicture: json['profilePicture'],
      driversLicenseFront: json['driversLicenseFront'],
      driversLicenseBack: json['driversLicenseBack'],
      nationalIdFront: json['nationalIdFront'],
      nationalIdBack: json['nationalIdBack'],
      registrationDocument: json['registrationDocument'],
      assetImage: json['assetImage'],
      assetThumbnail: json['assetThumbnail'],
      insuranceDocument: json['insuranceDocument'],
      pollutionDocument: json['pollutionDocument'],
      rideInfo: json['rideInfo'],
      invalidOtp: json['invalidOtp'],
      otpVerificationFailed: json['otpVerificationFailed'],
      missingOrIncompleteItems: json['missingOrIncompleteItems'],
      licenceExpiryDateError: json['licenceExpiryDateError'],
      assetThumbImages: json['assetThumbImages'],
      insuranceCertificate: json['insuranceCertificate'],
      pollutionCertificate: json['pollutionCertificate'],
      uploadDocuments: json['uploadDocuments'],
      submit: json['submit'],
      paymentPending: json['paymentPending'],
      completed: json['completed'],
      accepted: json['accepted'],
      inProgress: json['inProgress'],
      cancelled: json['cancelled'],
      assigned: json['assigned'],
      requested: json['requested'],
      driverArrived: json['driverArrived'],
      accessToken: json['accessToken'],
      accessTokenDescription: json['accessTokenDescription'],
      submitAccessToken: json['submitAccessToken'],
      enterValidAccessToken: json['enterValidAccessToken'],
      wallet: json['wallet'],
      currentBalance: json['currentBalance'],
      topUpWallet: json['topUpWallet'],
      transactions: json['transactions'],
      seeAll: json['seeAll'],
      noTransactions: json['noTransactions'],
      transactionHistory: json['transactionHistory'],
      addAmountToWallet: json['addAmountToWallet'],
      enterAmountToAdd: json['enterAmountToAdd'],
      enterValidAmount: json['enterValidAmount'],
      loading: json['loading'],
      addingFunds: json['addingFunds'],
      amountToSettle: json['amountToSettle'],
      commissionAmount: json['commissionAmount'],
      packageDuration: json['packageDuration'],
      packageDistance: json['packageDistance'],
      packageType: json['packageType'],
      additionalDistanceFare: json['additionalDistanceFare'],
      additionalDurationFare: json['additionalDurationFare'],
      additionalFarePerKm: json['additionalFarePerKm'],
      additionalFarePerMin: json['additionalFarePerMin'],
      markAsArrived: json['markAsArrived'],
      startTrip: json['startTrip'],
      completeTrip: json['completeTrip'],
      paymentCompletedSuccessfully: json['paymentCompletedSuccessfully'],
      arrivedAtPickupLocation: json['arrivedAtPickupLocation'],
      pickUpPassenger: json['pickUpPassenger'],
      arrivedAtDestination: json['arrivedAtDestination'],
      goToHome: json['goToHome'],
      endWithCash: json['endWithCash'],
      call: json['call'],
      recenter: json['recenter'],
      goToMap: json['goToMap'],
      paymentReceived: json['paymentReceived'],
      fetchCurrentLocation: json['fetchCurrentLocation'],
      driverAllowance: json['driverAllowance'],
      discountFare: json['discountFare'],
    );
  }
}
