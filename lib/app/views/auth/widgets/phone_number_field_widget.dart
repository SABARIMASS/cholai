import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cholai/shared/theme.dart';

import '../../../../shared/app_style.dart';

class Country {
  final String name;
  final String countryCode;
  final String phoneCode;
  final String flag;

  Country({
    required this.name,
    required this.countryCode,
    required this.phoneCode,
    required this.flag,
  });
}

class CountryCodePickerTextField extends StatefulWidget {
  final TextEditingController textController;
  final Function(Country)? onCountrySelected;
  final void Function(String)? onSubmitted;
  const CountryCodePickerTextField({
    super.key,
    required this.textController,
    this.onCountrySelected,
    this.onSubmitted,
  });

  @override
  CountryCodePickerTextFieldState createState() =>
      CountryCodePickerTextFieldState();
}

class CountryCodePickerTextFieldState
    extends State<CountryCodePickerTextField> {
  Country _selectedCountry = Country(
    name: "India",
    countryCode: "IN",
    phoneCode: "+91",
    flag: "🇮🇳",
  ); // Default to India

  @override
  void initState() {
    widget.onCountrySelected?.call(_selectedCountry);
    super.initState();
  }

  void _onCountryChange(CountryCode countryCode) {
    final newCountry = Country(
      name: countryCode.name ?? '',
      countryCode: countryCode.code ?? '',
      phoneCode: countryCode.dialCode ?? '',
      flag: countryCode.flagUri ?? '', // Flag comes from the library
    );
    setState(() {
      _selectedCountry = newCountry;
    });
    widget.onCountrySelected?.call(newCountry);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        // border:
        //     Border.all(color: Theme.of(context).appTheme.kLightBorderColor)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 30.h,
            child: CountryCodePicker(
              margin: EdgeInsets.only(right: 8.w),
              backgroundColor: Theme.of(context).appTheme.kAppBackgroundColor,
              padding: EdgeInsets.symmetric(),
              onChanged: _onCountryChange,
              initialSelection: _selectedCountry.countryCode,
              showFlag: true,
              showCountryOnly: false,
              flagWidth: 23.r,
              showOnlyCountryWhenClosed: false,
              favorite: ['+91', 'IN'],
              searchDecoration: InputDecoration(
                prefixIconConstraints: BoxConstraints(),
                suffixIcon: SizedBox.shrink(),
                prefixIcon: SizedBox.shrink(),
                contentPadding: EdgeInsets.symmetric(),
                hintText: 'Search country',
                hintStyle: TextStyle(
                  color: Theme.of(context).appTheme.kHintTextColor,
                ),
                filled: true,
                fillColor: Theme.of(context).appTheme.kAppBackgroundColor,
                border: InputBorder.none, // Removes the bottom line
                // contentPadding: EdgeInsets.symmetric(horizontal: 12),
                // focusedBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.grey), // Cursor color
                //   borderRadius: BorderRadius.circular(8),
                // ),
                // enabledBorder: OutlineInputBorder(
                //   borderSide: BorderSide.none,
                //   borderRadius: BorderRadius.circular(8),
                // ),
              ),
              textStyle: TextStyle(
                fontWeight: AppFontWeight.semibold.value,
                fontSize: AppFontSize.small.value,
                color:
                    Theme.of(
                      context,
                    ).appTheme.kPrimaryTextColor, // Specify text color
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter Mobile Number",
                  style: TextStyle(
                    fontWeight: AppFontWeight.semibold.value,
                    fontSize: AppFontSize.small.value,
                    color:
                        Theme.of(
                          context,
                        ).appTheme.kHintTextColor, // Specify text color
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.r),
                    border: Border.all(
                      color: Theme.of(context).appTheme.kLightBorderColor,
                    ),
                    color: Theme.of(context).appTheme.kLightColor,
                  ),
                  child: TextField(
                    autofocus: true,
                    cursorColor: Theme.of(context).appTheme.kCursorColor,
                    controller: widget.textController,
                    onSubmitted: widget.onSubmitted,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d{0,15}$')),
                    ],
                    style: TextStyle(
                      fontWeight: AppFontWeight.semibold.value,
                      fontSize: AppFontSize.small.value,
                      color:
                          Theme.of(
                            context,
                          ).appTheme.kPrimaryTextColor, // Specify text color
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 9.h),
                      constraints: BoxConstraints(
                        maxHeight: 30.h,
                        minHeight: 30.h,
                      ),
                      hintStyle: TextStyle(
                        fontWeight: AppFontWeight.semibold.value,
                        fontSize: AppFontSize.small.value,
                        color:
                            Theme.of(
                              context,
                            ).appTheme.kHintTextColor, // Specify text color
                      ),
                      hintText: '9812367345',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
