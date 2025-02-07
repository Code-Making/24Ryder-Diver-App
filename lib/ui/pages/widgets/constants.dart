class Values {
  static const List<String> gender = ['Male', 'Female'];

  static var pushNotifTopicId;
  static const httpReqTimeOut = Duration(seconds: 30);
  static const sessionDuration = Duration(hours: 5);
  //int constants
  static const int MIN_RECHARGE = 10; //NPR
  static const int MAX_RECHARGE = 5000; //NPR
  //double constants
  static const double DEFAULT_THRESHOLD = 3.0; //magnitudes
  //String constants
  static const EN_JAPAN = 'japan';
  static const EN_NEPAL = 'nepal';
  static const JP_JAPAN = '日本';
  static const JP_NEPAL = 'ネパール';
  static const NTC = 'ntc';

  static const NCELL = 'ncell';

  static const SMARTCELL = 'smartcell';
  static const PushNotifTopicId = 'bnpjwallet';
  //List constants
  static const List<String> SMARTCELL_TOPUP = [
    '20',
    '50',
    '100',
    '200',
    '500',
    '1000'
  ];
  static const List<String> TOPUP_PRICES = [
    "100",
    "200",
    "500",
    "1,000",
    "2,000",
    "5,000",
    "10,000",
    "25,000"
  ];
  static const List<String> GENDER = ['Male', 'Female'];
  static const List<String> PAYMENT_PURPOSE = [
    'Utilities',
    'Partner Services',
    'Bill Payments',
    'Others',
  ];
  static const List<String> MARITIAL_STATUS = [
    'Married',
    'Unmarried',
    'Divorced',
    'Single',
    'Widow'
  ];

  static const List<String> MONTHS = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  //others
  static final ntcRegx =
      RegExp(r'^9(74|75|84|85|86)\d{7}$', caseSensitive: false);

  // static RegExp get japaneseMobileNumber =>
  //     RegExp(r'^0(70|90|80)\d{8}$', caseSensitive: false);

  static final List<RegExp> allRegex = [
    ntcRegx,
    ncellRegx,
    smartCellRegx,
    ntcLandLineRegex
  ];
  static RegExp get alphaNumericOnly => RegExp(r"^(?=.*[A-Z])(?=.*[0-9])");
  static RegExp get japaneseMobileNumber =>
      RegExp(r'^0(70|90|80)\d{8}$', caseSensitive: false);
  static RegExp get jpAddress =>
      RegExp(r'(...??[都道府県])(.+?市.+?区|.+?[市区町村])(.+)');
  static RegExp get nameOnly => RegExp(r"^(?=.*[A-Z][a-z]) ");

  static RegExp get ncellRegx =>
      RegExp(r'^9(80|81|82)\d{7}$', caseSensitive: false);
  static RegExp get ntcLandLineRegex =>
      RegExp(r'^\d{8}$', caseSensitive: false);
  static RegExp get pwValidator => RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&\[\]{}()^\-=|,.<>/:;~+_])[A-Za-z\d@$!%*?#&\[\]{}(),.\-=|^<>/:;~+_]{8,}$",
      caseSensitive: true);
  static RegExp get smartCellRegx =>
      RegExp(r'^9(61|62|88)\d{7}$', caseSensitive: false);
  var restricEmojiRegex =
      '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';
}
