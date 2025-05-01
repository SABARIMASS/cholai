import 'language_global.dart';
import 'languages.dart';

class TnLanguage {
  // Create hashmap for English language
  Map<String, String> tnLanguage = {
    LanguageGlobal.home: Languages.languageContent.tn.home,
    LanguageGlobal.onlineStatus: Languages.languageContent.tn.online,
    LanguageGlobal.offlineStatus: Languages.languageContent.tn.offline,
    LanguageGlobal.rides: Languages.languageContent.tn.rides,
    LanguageGlobal.payout: Languages.languageContent.tn.payout,
    LanguageGlobal.refresh: Languages.languageContent.tn.refresh,
    LanguageGlobal.earningToday: Languages.languageContent.tn.earningToday,
    LanguageGlobal.tripsCompleted: Languages.languageContent.tn.tripsCompleted,
    LanguageGlobal.loginHours: Languages.languageContent.tn.loginHours,
    LanguageGlobal.lastUpdatedAt: Languages.languageContent.tn.lastUpdatedAt,
    LanguageGlobal.connectingWithServer:
        Languages.languageContent.tn.connectingWithServer,
    LanguageGlobal.acceptTheRide: Languages.languageContent.tn.acceptTheRide,
    LanguageGlobal.seconds: Languages.languageContent.tn.seconds,
    LanguageGlobal.rideId: Languages.languageContent.tn.rideId,
    LanguageGlobal.jobRequested: Languages.languageContent.tn.jobRequested,
    LanguageGlobal.estimatedFare: Languages.languageContent.tn.estimatedFare,
    LanguageGlobal.profile: Languages.languageContent.tn.profile,
    LanguageGlobal.helpAndSupport: Languages.languageContent.tn.helpAndSupport,
    LanguageGlobal.more: Languages.languageContent.tn.more,
    LanguageGlobal.about: Languages.languageContent.tn.about,
    LanguageGlobal.signOut: Languages.languageContent.tn.signOut,
    LanguageGlobal.requestToDeleteAccount:
        Languages.languageContent.tn.requestToDeleteAccount,
    LanguageGlobal.batteryOptimization:
        Languages.languageContent.tn.batteryOptimization,
    LanguageGlobal.displayOverTheApp:
        Languages.languageContent.tn.displayOverTheApp,
    LanguageGlobal.changeTheme: Languages.languageContent.tn.changeTheme,
    LanguageGlobal.changeLanguage: Languages.languageContent.tn.changeLanguage,
    LanguageGlobal.trips: Languages.languageContent.tn.trips,
    LanguageGlobal.upcomingTrips: Languages.languageContent.tn.upcomingTrips,
    LanguageGlobal.earningForTheWeek:
        Languages.languageContent.tn.earningForTheWeek,
    LanguageGlobal.earningForLastWeek:
        Languages.languageContent.tn.earningForLastWeek,
    LanguageGlobal.earningForTheMonth:
        Languages.languageContent.tn.earningForTheMonth,
    LanguageGlobal.earningForLastMonth:
        Languages.languageContent.tn.earningForLastMonth,
    LanguageGlobal.earningForTheDay:
        Languages.languageContent.tn.earningForTheDay,
    LanguageGlobal.earningForLastDay:
        Languages.languageContent.tn.earningForLastDay,
    LanguageGlobal.surgePay: Languages.languageContent.tn.surgePay,
    LanguageGlobal.extraPayDuringCertainTime:
        Languages.languageContent.tn.extraPayDuringCertainTime,
    LanguageGlobal.networkError: Languages.languageContent.tn.networkError,
    LanguageGlobal.manufacturedYear:
        Languages.languageContent.tn.manufacturedYear,
    LanguageGlobal.documents: Languages.languageContent.tn.documents,
    LanguageGlobal.licenseImages: Languages.languageContent.tn.licenseImages,
    LanguageGlobal.open: Languages.languageContent.tn.open,
    LanguageGlobal.nationalIdImages:
        Languages.languageContent.tn.nationalIdImages,
    LanguageGlobal.generalInformation:
        Languages.languageContent.tn.generalInformation,
    LanguageGlobal.uniqueId: Languages.languageContent.tn.uniqueId,
    LanguageGlobal.phoneNumber: Languages.languageContent.tn.phoneNumber,
    LanguageGlobal.mailId: Languages.languageContent.tn.mailId,
    LanguageGlobal.address: Languages.languageContent.tn.address,
    LanguageGlobal.registerDate: Languages.languageContent.tn.registerDate,
    LanguageGlobal.licenseNumber: Languages.languageContent.tn.licenseNumber,
    LanguageGlobal.bankDetails: Languages.languageContent.tn.bankDetails,
    LanguageGlobal.accountHolderName:
        Languages.languageContent.tn.accountHolderName,
    LanguageGlobal.accountType: Languages.languageContent.tn.accountType,
    LanguageGlobal.paymentType: Languages.languageContent.tn.paymentType,
    LanguageGlobal.bankName: Languages.languageContent.tn.bankName,
    LanguageGlobal.bankAddress: Languages.languageContent.tn.bankAddress,
    LanguageGlobal.accountNumber: Languages.languageContent.tn.accountNumber,
    LanguageGlobal.ifscCode: Languages.languageContent.tn.ifscCode,
    LanguageGlobal.currency: Languages.languageContent.tn.currency,
    LanguageGlobal.scheduledTime: Languages.languageContent.tn.scheduledTime,
    LanguageGlobal.date: Languages.languageContent.tn.date,
    LanguageGlobal.time: Languages.languageContent.tn.time,
    LanguageGlobal.travel: Languages.languageContent.tn.travel,
    LanguageGlobal.rideTime: Languages.languageContent.tn.rideTime,
    LanguageGlobal.price: Languages.languageContent.tn.price,
    LanguageGlobal.totalAmount: Languages.languageContent.tn.totalAmount,
    LanguageGlobal.baseFare: Languages.languageContent.tn.baseFare,
    LanguageGlobal.subTotal: Languages.languageContent.tn.subTotal,
    LanguageGlobal.total: Languages.languageContent.tn.total,
    LanguageGlobal.totalDuration: Languages.languageContent.tn.totalDuration,
    LanguageGlobal.durationFare: Languages.languageContent.tn.durationFare,
    LanguageGlobal.totalDistance: Languages.languageContent.tn.totalDistance,
    LanguageGlobal.distanceFare: Languages.languageContent.tn.distanceFare,
    LanguageGlobal.waitingTime: Languages.languageContent.tn.waitingTime,
    LanguageGlobal.waitingFare: Languages.languageContent.tn.waitingFare,
    LanguageGlobal.zoneFare: Languages.languageContent.tn.zoneFare,
    LanguageGlobal.minimumFare: Languages.languageContent.tn.minimumFare,
    LanguageGlobal.surgeFare: Languages.languageContent.tn.surgeFare,
    LanguageGlobal.cancellationFare:
        Languages.languageContent.tn.cancellationFare,
    LanguageGlobal.rideHistory: Languages.languageContent.tn.rideHistory,
    LanguageGlobal.overallRides: Languages.languageContent.tn.overallRides,
    LanguageGlobal.distance: Languages.languageContent.tn.distance,
    LanguageGlobal.confirmOffline: Languages.languageContent.tn.confirmOffline,
    LanguageGlobal.confirmOfflineMessage:
        Languages.languageContent.tn.confirmOfflineMessage,
    LanguageGlobal.no: Languages.languageContent.tn.no,
    LanguageGlobal.yes: Languages.languageContent.tn.yes,
    LanguageGlobal.confirmOnline: Languages.languageContent.tn.confirmOnline,
    LanguageGlobal.confirmOnlineMessage:
        Languages.languageContent.tn.confirmOnlineMessage,
    LanguageGlobal.deleteAccount: Languages.languageContent.tn.deleteAccount,
    LanguageGlobal.deleteAccountReasonMessage:
        Languages.languageContent.tn.deleteAccountReasonMessage,
    LanguageGlobal.yourEmailId: Languages.languageContent.tn.yourEmailId,
    LanguageGlobal.exampleEmail: Languages.languageContent.tn.exampleEmail,
    LanguageGlobal.reasonForDeletingAccount:
        Languages.languageContent.tn.reasonForDeletingAccount,
    LanguageGlobal.describeIssuePlaceholder:
        Languages.languageContent.tn.describeIssuePlaceholder,
    LanguageGlobal.descriptionMinCharacters:
        Languages.languageContent.tn.descriptionMinCharacters,
    LanguageGlobal.submitRequest: Languages.languageContent.tn.submitRequest,
    LanguageGlobal.english: Languages.languageContent.tn.english,
    LanguageGlobal.tamil: Languages.languageContent.tn.tamil,
    LanguageGlobal.confirmAccountDeletion:
        Languages.languageContent.tn.confirmAccountDeletion,
    LanguageGlobal.confirmAccountDeletionMessage:
        Languages.languageContent.tn.confirmAccountDeletionMessage,
    LanguageGlobal.enterEmail: Languages.languageContent.tn.enterEmail,
    LanguageGlobal.enterValidEmail:
        Languages.languageContent.tn.enterValidEmail,
    LanguageGlobal.edit: Languages.languageContent.tn.edit,
    LanguageGlobal.ratings: Languages.languageContent.tn.ratings,
    LanguageGlobal.tripsTodayTotalEarnings:
        Languages.languageContent.tn.tripsTodayTotalEarnings,
    LanguageGlobal.vehicleDetails: Languages.languageContent.tn.vehicleDetails,
    LanguageGlobal.numberPlate: Languages.languageContent.tn.numberPlate,
    LanguageGlobal.model: Languages.languageContent.tn.model,
    LanguageGlobal.confirmSignOut: Languages.languageContent.tn.confirmSignOut,
    LanguageGlobal.confirmSignOutMessage:
        Languages.languageContent.tn.confirmSignOutMessage,
    LanguageGlobal.forceLoginRequired:
        Languages.languageContent.tn.forceLoginRequired,
    LanguageGlobal.forceLoginMessage:
        Languages.languageContent.tn.forceLoginMessage,
    LanguageGlobal.cancelRide: Languages.languageContent.tn.cancelRide,
    LanguageGlobal.cancelRideMessage:
        Languages.languageContent.tn.cancelRideMessage,
    LanguageGlobal.continueText: Languages.languageContent.tn.continueText,
    LanguageGlobal.permissionToTrack:
        Languages.languageContent.tn.permissionToTrack,
    LanguageGlobal.dearUser: Languages.languageContent.tn.dearUser,
    LanguageGlobal.ongoingRideShiftMessage:
        Languages.languageContent.tn.ongoingRideShiftMessage,
    LanguageGlobal.deviceLoginConflict:
        Languages.languageContent.tn.deviceLoginConflict,
    LanguageGlobal.forceLogout: Languages.languageContent.tn.forceLogout,
    LanguageGlobal.onlineSignOutWarning:
        Languages.languageContent.tn.onlineSignOutWarning,
    LanguageGlobal.signOutWarning: Languages.languageContent.tn.signOutWarning,
    LanguageGlobal.activeRideDetected:
        Languages.languageContent.tn.activeRideDetected,
    LanguageGlobal.additionalNotes:
        Languages.languageContent.tn.additionalNotes,
    LanguageGlobal.okay: Languages.languageContent.tn.okay,
    LanguageGlobal.next: Languages.languageContent.tn.next,
    LanguageGlobal.enableLocationServicesMessage:
        Languages.languageContent.tn.enableLocationServicesMessage,
    LanguageGlobal.enableLocationServices:
        Languages.languageContent.tn.enableLocationServices,
    LanguageGlobal.enableNotificationsMessage:
        Languages.languageContent.tn.enableNotificationsMessage,
    LanguageGlobal.allowAlwaysOnLocationAccess:
        Languages.languageContent.tn.allowAlwaysOnLocationAccess,
    LanguageGlobal.alwaysOnLocationAccessMessage:
        Languages.languageContent.tn.alwaysOnLocationAccessMessage,
    LanguageGlobal.enableNotifications:
        Languages.languageContent.tn.enableNotifications,
    LanguageGlobal.disableBatteryOptimization:
        Languages.languageContent.tn.disableBatteryOptimization,
    LanguageGlobal.displayOverOtherApps:
        Languages.languageContent.tn.displayOverOtherApps,
    LanguageGlobal.disableBatteryOptimizationMessage:
        Languages.languageContent.tn.disableBatteryOptimizationMessage,
    LanguageGlobal.displayOverOtherAppsMessage:
        Languages.languageContent.tn.displayOverOtherAppsMessage,
    LanguageGlobal.home: Languages.languageContent.tn.home,
    LanguageGlobal.signIn: Languages.languageContent.tn.signIn,
    LanguageGlobal.welcomeMessage: Languages.languageContent.tn.welcomeMessage,
    LanguageGlobal.noAccount: Languages.languageContent.tn.noAccount,
    LanguageGlobal.signUp: Languages.languageContent.tn.signUp,
    LanguageGlobal.createProfile: Languages.languageContent.tn.createProfile,
    LanguageGlobal.name: Languages.languageContent.tn.name,
    LanguageGlobal.exampleName: Languages.languageContent.tn.exampleName,
    LanguageGlobal.email: Languages.languageContent.tn.email,
    LanguageGlobal.dob: Languages.languageContent.tn.dob,
    LanguageGlobal.exampleDob: Languages.languageContent.tn.exampleDob,
    LanguageGlobal.exampleAddress: Languages.languageContent.tn.exampleAddress,
    LanguageGlobal.gender: Languages.languageContent.tn.gender,
    LanguageGlobal.selectGender: Languages.languageContent.tn.selectGender,
    LanguageGlobal.licenceNumber: Languages.languageContent.tn.licenceNumber,
    LanguageGlobal.exampleLicenceNumber:
        Languages.languageContent.tn.exampleLicenceNumber,
    LanguageGlobal.licenceExpiryDate:
        Languages.languageContent.tn.licenceExpiryDate,
    LanguageGlobal.exampleLicenceExpiryDate:
        Languages.languageContent.tn.exampleLicenceExpiryDate,
    LanguageGlobal.nationalIdNumber:
        Languages.languageContent.tn.nationalIdNumber,
    LanguageGlobal.exampleNationalIdNumber:
        Languages.languageContent.tn.exampleNationalIdNumber,
    LanguageGlobal.bankAccountNumber:
        Languages.languageContent.tn.bankAccountNumber,
    LanguageGlobal.exampleBankAccountNumber:
        Languages.languageContent.tn.exampleBankAccountNumber,
    LanguageGlobal.exampleBankName:
        Languages.languageContent.tn.exampleBankName,
    LanguageGlobal.isOwnAsset: Languages.languageContent.tn.isOwnAsset,
    LanguageGlobal.assetPlateNumber:
        Languages.languageContent.tn.assetPlateNumber,
    LanguageGlobal.exampleAssetPlateNumber:
        Languages.languageContent.tn.exampleAssetPlateNumber,
    LanguageGlobal.assetModel: Languages.languageContent.tn.assetModel,
    LanguageGlobal.signUpButton: Languages.languageContent.tn.signUpButton,
    LanguageGlobal.assetModels: Languages.languageContent.tn.assetModels,
    LanguageGlobal.enterValidPhoneNumber:
        Languages.languageContent.tn.enterValidPhoneNumber,
    LanguageGlobal.startTypingToSearch:
        Languages.languageContent.tn.startTypingToSearch,
    LanguageGlobal.search: Languages.languageContent.tn.search,
    LanguageGlobal.selectCountryCode:
        Languages.languageContent.tn.selectCountryCode,
    LanguageGlobal.verifyOtp: Languages.languageContent.tn.verifyOtp,
    LanguageGlobal.otpInstruction: Languages.languageContent.tn.otpInstruction,
    LanguageGlobal.verifyCode: Languages.languageContent.tn.verifyCode,
    LanguageGlobal.emailRequired: Languages.languageContent.tn.emailRequired,
    LanguageGlobal.validEmail: Languages.languageContent.tn.validEmail,
    LanguageGlobal.nameRequired: Languages.languageContent.tn.nameRequired,
    LanguageGlobal.validName: Languages.languageContent.tn.validName,
    LanguageGlobal.panRequired: Languages.languageContent.tn.panRequired,
    LanguageGlobal.validPan: Languages.languageContent.tn.validPan,
    LanguageGlobal.aadhaarRequired:
        Languages.languageContent.tn.aadhaarRequired,
    LanguageGlobal.validAadhaar: Languages.languageContent.tn.validAadhaar,
    LanguageGlobal.dobRequired: Languages.languageContent.tn.dobRequired,
    LanguageGlobal.validDateFormat:
        Languages.languageContent.tn.validDateFormat,
    LanguageGlobal.futureDob: Languages.languageContent.tn.futureDob,
    LanguageGlobal.minimumAge: Languages.languageContent.tn.minimumAge,
    LanguageGlobal.maximumAge: Languages.languageContent.tn.maximumAge,
    LanguageGlobal.fieldRequired: Languages.languageContent.tn.fieldRequired,
    LanguageGlobal.assetPlateRequired:
        Languages.languageContent.tn.assetPlateRequired,
    LanguageGlobal.validAssetPlate:
        Languages.languageContent.tn.validAssetPlate,
    LanguageGlobal.assetPlateLength:
        Languages.languageContent.tn.assetPlateLength,
    LanguageGlobal.addressRequired:
        Languages.languageContent.tn.addressRequired,
    LanguageGlobal.addressLength: Languages.languageContent.tn.addressLength,
    LanguageGlobal.licenceNumberRequired:
        Languages.languageContent.tn.licenceNumberRequired,
    LanguageGlobal.validLicenceNumber:
        Languages.languageContent.tn.validLicenceNumber,
    LanguageGlobal.licenceNumberLength:
        Languages.languageContent.tn.licenceNumberLength,
    LanguageGlobal.nationalIdRequired:
        Languages.languageContent.tn.nationalIdRequired,
    LanguageGlobal.nationalIdDigits:
        Languages.languageContent.tn.nationalIdDigits,
    LanguageGlobal.nationalIdLength:
        Languages.languageContent.tn.nationalIdLength,
    LanguageGlobal.licenceExpiryRequired:
        Languages.languageContent.tn.licenceExpiryRequired,
    LanguageGlobal.validExpiryDate:
        Languages.languageContent.tn.validExpiryDate,
    LanguageGlobal.futureExpiryDate:
        Languages.languageContent.tn.futureExpiryDate,
    LanguageGlobal.bankAccountRequired:
        Languages.languageContent.tn.bankAccountRequired,
    LanguageGlobal.bankAccountDigits:
        Languages.languageContent.tn.bankAccountDigits,
    LanguageGlobal.bankAccountLength:
        Languages.languageContent.tn.bankAccountLength,
    LanguageGlobal.bankNameRequired:
        Languages.languageContent.tn.bankNameRequired,
    LanguageGlobal.validBankName: Languages.languageContent.tn.validBankName,
    LanguageGlobal.validNumber: Languages.languageContent.tn.validNumber,
    LanguageGlobal.minNumberLength:
        Languages.languageContent.tn.minNumberLength,
    LanguageGlobal.maxNumberLength:
        Languages.languageContent.tn.maxNumberLength,
    LanguageGlobal.minNumber: Languages.languageContent.tn.minNumber,
    LanguageGlobal.coreDataFetching:
        Languages.languageContent.tn.coreDataFetching,
    LanguageGlobal.accessingLocation:
        Languages.languageContent.tn.accessingLocation,
    LanguageGlobal.settingUp: Languages.languageContent.tn.settingUp,
    LanguageGlobal.profileEdit: Languages.languageContent.tn.profileEdit,
    LanguageGlobal.profilePicture: Languages.languageContent.tn.profilePicture,
    LanguageGlobal.driversLicenseFront:
        Languages.languageContent.tn.driversLicenseFront,
    LanguageGlobal.driversLicenseBack:
        Languages.languageContent.tn.driversLicenseBack,
    LanguageGlobal.nationalIdFront:
        Languages.languageContent.tn.nationalIdFront,
    LanguageGlobal.nationalIdBack: Languages.languageContent.tn.nationalIdBack,
    LanguageGlobal.registrationDocument:
        Languages.languageContent.tn.registrationDocument,
    LanguageGlobal.assetImage: Languages.languageContent.tn.assetImage,
    LanguageGlobal.assetThumbnail: Languages.languageContent.tn.assetThumbnail,
    LanguageGlobal.insuranceDocument:
        Languages.languageContent.tn.insuranceDocument,
    LanguageGlobal.pollutionDocument:
        Languages.languageContent.tn.pollutionDocument,
    LanguageGlobal.rideInfo: Languages.languageContent.tn.rideInfo,
    LanguageGlobal.invalidOtp: Languages.languageContent.tn.invalidOtp,
    LanguageGlobal.otpVerificationFailed:
        Languages.languageContent.tn.otpVerificationFailed,
    LanguageGlobal.missingOrIncompleteItems:
        Languages.languageContent.tn.missingOrIncompleteItems,
    LanguageGlobal.licenceExpiryDateError:
        Languages.languageContent.tn.licenceExpiryDateError,
    LanguageGlobal.assetThumbImages:
        Languages.languageContent.tn.assetThumbImages,
    LanguageGlobal.insuranceCertificate:
        Languages.languageContent.tn.insuranceCertificate,
    LanguageGlobal.pollutionCertificate:
        Languages.languageContent.tn.pollutionCertificate,
    LanguageGlobal.uploadDocuments:
        Languages.languageContent.tn.uploadDocuments,
    LanguageGlobal.submit: Languages.languageContent.tn.submit,
    LanguageGlobal.paymentPending: Languages.languageContent.tn.paymentPending,
    LanguageGlobal.completed: Languages.languageContent.tn.completed,
    LanguageGlobal.accepted: Languages.languageContent.tn.accepted,
    LanguageGlobal.inProgress: Languages.languageContent.tn.inProgress,
    LanguageGlobal.cancelled: Languages.languageContent.tn.cancelled,
    LanguageGlobal.assigned: Languages.languageContent.tn.assigned,
    LanguageGlobal.requested: Languages.languageContent.tn.requested,
    LanguageGlobal.driverArrived: Languages.languageContent.tn.driverArrived,
    LanguageGlobal.accessToken: Languages.languageContent.tn.accessToken,
    LanguageGlobal.accessTokenDescription:
        Languages.languageContent.tn.accessTokenDescription,
    LanguageGlobal.submitAccessToken:
        Languages.languageContent.tn.submitAccessToken,
    LanguageGlobal.enterValidAccessToken:
        Languages.languageContent.tn.enterValidAccessToken,
    LanguageGlobal.wallet: Languages.languageContent.tn.wallet,
    LanguageGlobal.currentBalance: Languages.languageContent.tn.currentBalance,
    LanguageGlobal.topUpWallet: Languages.languageContent.tn.topUpWallet,
    LanguageGlobal.transactions: Languages.languageContent.tn.transactions,
    LanguageGlobal.seeAll: Languages.languageContent.tn.seeAll,
    LanguageGlobal.noTransactions: Languages.languageContent.tn.noTransactions,
    LanguageGlobal.transactionHistory:
        Languages.languageContent.tn.transactionHistory,
    LanguageGlobal.addAmountToWallet:
        Languages.languageContent.tn.addAmountToWallet,
    LanguageGlobal.enterAmountToAdd:
        Languages.languageContent.tn.enterAmountToAdd,
    LanguageGlobal.enterValidAmount:
        Languages.languageContent.tn.enterValidAmount,
    LanguageGlobal.loading: Languages.languageContent.tn.loading,
    LanguageGlobal.addingFunds: Languages.languageContent.tn.addingFunds,
    LanguageGlobal.amountToSettle: Languages.languageContent.tn.amountToSettle,
    LanguageGlobal.commissionAmount:
        Languages.languageContent.tn.commissionAmount,
    LanguageGlobal.profilePicture: Languages.languageContent.tn.profilePicture,
    LanguageGlobal.submit: Languages.languageContent.tn.submit,
    LanguageGlobal.packageDuration:
        Languages.languageContent.tn.packageDuration,
    LanguageGlobal.packageDistance:
        Languages.languageContent.tn.packageDistance,
    LanguageGlobal.packageType: Languages.languageContent.tn.packageType,
    LanguageGlobal.additionalDistanceFare:
        Languages.languageContent.tn.additionalDistanceFare,
    LanguageGlobal.additionalDurationFare:
        Languages.languageContent.tn.additionalDurationFare,
    LanguageGlobal.additionalFarePerKm:
        Languages.languageContent.tn.additionalFarePerKm,
    LanguageGlobal.additionalFarePerMin:
        Languages.languageContent.tn.additionalFarePerMin,
    LanguageGlobal.markAsArrived: Languages.languageContent.tn.markAsArrived,
    LanguageGlobal.startTrip: Languages.languageContent.tn.startTrip,
    LanguageGlobal.completeTrip: Languages.languageContent.tn.completeTrip,
    LanguageGlobal.payment: Languages.languageContent.tn.payment,
    LanguageGlobal.paymentCompletedSuccessfully:
        Languages.languageContent.tn.paymentCompletedSuccessfully,
    LanguageGlobal.arrivedAtPickupLocation:
        Languages.languageContent.tn.arrivedAtPickupLocation,
    LanguageGlobal.pickUpPassenger:
        Languages.languageContent.tn.pickUpPassenger,
    LanguageGlobal.arrivedAtDestination:
        Languages.languageContent.tn.arrivedAtDestination,
    LanguageGlobal.goToHome: Languages.languageContent.tn.goToHome,
    LanguageGlobal.endWithCash: Languages.languageContent.tn.endWithCash,
    LanguageGlobal.call: Languages.languageContent.tn.call,
    LanguageGlobal.cancel: Languages.languageContent.tn.cancel,
    LanguageGlobal.recenter: Languages.languageContent.tn.recenter,
    LanguageGlobal.goToMap: Languages.languageContent.tn.goToMap,
    LanguageGlobal.paymentReceived:
        Languages.languageContent.tn.paymentReceived,
    LanguageGlobal.fetchCurrentLocation:
        Languages.languageContent.tn.fetchCurrentLocation,
    LanguageGlobal.driverAllowance:
        Languages.languageContent.tn.driverAllowance,
    LanguageGlobal.discountFare: Languages.languageContent.tn.discountFare,
  };
}
