// class S {
//   S();

//   static S? _current;

//   static S get current {
//     assert(_current != null,
//         'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
//     return _current!;
//   }

//   static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

//   static Future<S> load(Locale locale) {
//     final name = (locale.countryCode?.isEmpty ?? false)
//         ? locale.languageCode
//         : locale.toString();
//     final localeName = Intl.canonicalizedLocale(name);
//     return initializeMessages(localeName).then((_) {
//       Intl.defaultLocale = localeName;
//       final instance = S();
//       S._current = instance;

//       return instance;
//     });
//   }

//   static S of(BuildContext context) {
//     final instance = S.maybeOf(context);
//     assert(instance != null,
//         'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
//     return instance!;
//   }

//   static S? maybeOf(BuildContext context) {
//     return Localizations.of<S>(context, S);
//   }

//   /// `Address`
//   String get Address {
//     return Intl.message(
//       'Address',
//       name: 'Address',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Change Password`
//   String get Change_Password {
//     return Intl.message(
//       'Change Password',
//       name: 'Change_Password',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `City`
//   String get City {
//     return Intl.message(
//       'City',
//       name: 'City',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Confirmation`
//   String get Confirmation {
//     return Intl.message(
//       'Confirmation',
//       name: 'Confirmation',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Confirmed by`
//   String get Confirmed_by {
//     return Intl.message(
//       'Confirmed by',
//       name: 'Confirmed_by',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Confirm New Password`
//   String get Confirm_New_Password {
//     return Intl.message(
//       'Confirm New Password',
//       name: 'Confirm_New_Password',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Custom`
//   String get Custom {
//     return Intl.message(
//       'Custom',
//       name: 'Custom',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Dashboard`
//   String get Dashboard {
//     return Intl.message(
//       'Dashboard',
//       name: 'Dashboard',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Delivered by`
//   String get Delivered_by {
//     return Intl.message(
//       'Delivered by',
//       name: 'Delivered_by',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Delivered`
//   String get Delivered {
//     return Intl.message(
//       'Delivered',
//       name: 'Delivered',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Delivery`
//   String get Delivery {
//     return Intl.message(
//       'Delivery',
//       name: 'Delivery',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Delivery Rate`
//   String get Delivery_Rate {
//     return Intl.message(
//       'Delivery Rate',
//       name: 'Delivery_Rate',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Failed`
//   String get Failed {
//     return Intl.message(
//       'Failed',
//       name: 'Failed',
//       desc: '',
//       args: [],
//     );
//   }

//   /// ` Last 3 Months`
//   String get Last_3_Months {
//     return Intl.message(
//       ' Last 3 Months',
//       name: 'Last_3_Months',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Loading ...`
//   String get Loading {
//     return Intl.message(
//       'Loading ...',
//       name: 'Loading',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `New Password`
//   String get New_Password {
//     return Intl.message(
//       'New Password',
//       name: 'New_Password',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Old Password`
//   String get Old_Password {
//     return Intl.message(
//       'Old Password',
//       name: 'Old_Password',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Ongoing`
//   String get Ongoing {
//     return Intl.message(
//       'Ongoing',
//       name: 'Ongoing',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Orders`
//   String get Orders {
//     return Intl.message(
//       'Orders',
//       name: 'Orders',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Planning`
//   String get Planning {
//     return Intl.message(
//       'Planning',
//       name: 'Planning',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Products`
//   String get Products {
//     return Intl.message(
//       'Products',
//       name: 'Products',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Phone`
//   String get Phone {
//     return Intl.message(
//       'Phone',
//       name: 'Phone',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Pack`
//   String get Pack {
//     return Intl.message(
//       'Pack',
//       name: 'Pack',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Payment`
//   String get Payment {
//     return Intl.message(
//       'Payment',
//       name: 'Payment',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Profile`
//   String get Profile {
//     return Intl.message(
//       'Profile',
//       name: 'Profile',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Personal Informations`
//   String get Personal_Informations {
//     return Intl.message(
//       'Personal Informations',
//       name: 'Personal_Informations',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Quantity`
//   String get Quantity {
//     return Intl.message(
//       'Quantity',
//       name: 'Quantity',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `QTY`
//   String get QTY {
//     return Intl.message(
//       'QTY',
//       name: 'QTY',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Reports`
//   String get Reports {
//     return Intl.message(
//       'Reports',
//       name: 'Reports',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Revenue`
//   String get Revenue {
//     return Intl.message(
//       'Revenue',
//       name: 'Revenue',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Save Changes`
//   String get Save_Changes {
//     return Intl.message(
//       'Save Changes',
//       name: 'Save_Changes',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Stores`
//   String get Stores {
//     return Intl.message(
//       'Stores',
//       name: 'Stores',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Stock`
//   String get Stock {
//     return Intl.message(
//       'Stock',
//       name: 'Stock',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `See more`
//   String get See_more {
//     return Intl.message(
//       'See more',
//       name: 'See_more',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `See less`
//   String get See_less {
//     return Intl.message(
//       'See less',
//       name: 'See_less',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Today`
//   String get Today {
//     return Intl.message(
//       'Today',
//       name: 'Today',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `This Week`
//   String get This_Week {
//     return Intl.message(
//       'This Week',
//       name: 'This_Week',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Yesterday`
//   String get Yesterday {
//     return Intl.message(
//       'Yesterday',
//       name: 'Yesterday',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `DH`
//   String get DH {
//     return Intl.message(
//       'DH',
//       name: 'DH',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `From`
//   String get From {
//     return Intl.message(
//       'From',
//       name: 'From',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `To`
//   String get To {
//     return Intl.message(
//       'To',
//       name: 'To',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Confirm`
//   String get Confirm {
//     return Intl.message(
//       'Confirm',
//       name: 'Confirm',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Cancel`
//   String get Cancel {
//     return Intl.message(
//       'Cancel',
//       name: 'Cancel',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `Start Date`
//   String get Start_Date {
//     return Intl.message(
//       'Start Date',
//       name: 'Start_Date',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `End Date`
//   String get End_Date {
//     return Intl.message(
//       'End Date',
//       name: 'End_Date',
//       desc: '',
//       args: [],
//     );
//   }

//   /// `No products in stock.`
//   String get No_products_in_stock {
//     return Intl.message(
//       'No products in stock.',
//       name: 'No_products_in_stock',
//       desc: '',
//       args: [],
//     );
//   }
// }
