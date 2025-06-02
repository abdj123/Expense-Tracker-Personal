import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'am'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? amText = '',
  }) =>
      [enText, amText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // home
  {
    'cvfnbuuf': {
      'en': 'Total Asset',
      'am': 'ጠቅላላ ንብረት',
    },
    'mrhb97ew': {
      'en': ' USD',
      'am': 'የአሜሪካ ዶላር',
    },
    'flkos2vf': {
      'en': '42,350',
      'am': '42,350',
    },
    'xqax67yt': {
      'en': 'Today ',
      'am': 'ዛሬ',
    },
    '1jeo33i7': {
      'en': 'transactions',
      'am': 'ግብይቶች',
    },
    '0cm6y7nm': {
      'en': 'Accounts',
      'am': 'መለያዎች',
    },
    '9s9u1vv0': {
      'en': 'Cash in hand',
      'am': 'ጥሬ ገንዘብ በእጅ',
    },
    '96b9y5gv': {
      'en': 'Crypto',
      'am': 'ክሪፕቶ',
    },
    '5v2js3s8': {
      'en': 'Bank Accounts',
      'am': 'የባንክ ሂሳቦች',
    },
    '86g1zlgc': {
      'en': 'My Plans',
      'am': 'የእኔ እቅዶች',
    },
    'rq86nbxb': {
      'en': 'View all',
      'am': 'ሁሉንም ይመልከቱ',
    },
    '2jppuxh2': {
      'en': '# ',
      'am': '#',
    },
    'zmgabdbm': {
      'en': '#work',
      'am': '#ስራ',
    },
    '6wep7nl7': {
      'en': '#school',
      'am': '#ትምህርት ቤት',
    },
    'et4mas9j': {
      'en': 'Study Materials',
      'am': 'የጥናት ቁሳቁሶች',
    },
    't88s06rm': {
      'en': '80\$',
      'am': '80\$',
    },
    'gbrpyimp': {
      'en': '100\$',
      'am': '100\$',
    },
    'zekiegco': {
      'en': 'Budgets',
      'am': 'በጀቶች',
    },
    '98t9cpxg': {
      'en': 'etb of ',
      'am': 'etb የ',
    },
    'v65vcrap': {
      'en': 'etb',
      'am': 'ወዘተ',
    },
    'uiae94ew': {
      'en': '810 etb of 1500 etb',
      'am': '810 etb ከ 1500 ወ.ዘ.ተ',
    },
    'sd114aiq': {
      'en': '85%',
      'am': '85%',
    },
    'pkhidcdi': {
      'en': 'Food Monthly',
      'am': 'ምግብ ወርሃዊ',
    },
    'lik3hkms': {
      'en': '9770 etb of 12,000 etb',
      'am': '9770 etb ከ 12,000 ወዘተ',
    },
    'frhag6m3': {
      'en': '2230',
      'am': '2230',
    },
    'quxfxq3f': {
      'en': 'Recent Transactions',
      'am': 'የቅርብ ጊዜ ግብይቶች',
    },
    'ctd4g7v2': {
      'en': 'View all',
      'am': 'ሁሉንም ይመልከቱ',
    },
    'y9inyde8': {
      'en': '+ 3,110',
      'am': '+ 3,110',
    },
    'wu3w8wk6': {
      'en': 'Paid for food',
      'am': 'ለምግብ የተከፈለ',
    },
    'zcqmkepc': {
      'en': 'Expense',
      'am': 'ወጪ',
    },
    'nujhlamq': {
      'en': '- 312.9',
      'am': '- 312.9',
    },
    'qkgh85p7': {
      'en': 'Transfer',
      'am': 'ማስተላለፍ',
    },
    'd2b7bc0m': {
      'en': 'Gifts',
      'am': 'ስጦታዎች',
    },
    'mjz0kzlk': {
      'en': '+ 3,110',
      'am': '+ 3,110',
    },
    'p3cppjb0': {
      'en': 'Home',
      'am': 'ቤት',
    },
    'e21ikqiq': {
      'en': 'Home',
      'am': 'ቤት',
    },
  },
  // activity
  {
    'kuzd45yz': {
      'en': 'USD',
      'am': 'የአሜሪካ ዶላር',
    },
    'difbvpxa': {
      'en': '42,350',
      'am': '42,350',
    },
    '3aiihkkg': {
      'en': 'Today ',
      'am': 'ዛሬ',
    },
    'k5k63pty': {
      'en': 'transactions',
      'am': 'ግብይቶች',
    },
    'oe1dlf7w': {
      'en': 'History',
      'am': 'ታሪክ',
    },
    'spk48duq': {
      'en': '+ 3,110',
      'am': '+ 3,110',
    },
    '4j0ev7yo': {
      'en': 'Paid for food',
      'am': 'ለምግብ የተከፈለ',
    },
    'caj82vyl': {
      'en': 'Expense',
      'am': 'ወጪ',
    },
    '5eugwktp': {
      'en': '- 312.9',
      'am': '- 312.9',
    },
    'ctr02ub5': {
      'en': 'Transfer',
      'am': 'ማስተላለፍ',
    },
    'k16ucsih': {
      'en': 'Gifts',
      'am': 'ስጦታዎች',
    },
    'fdt7qvhv': {
      'en': '+ 3,110',
      'am': '+ 3,110',
    },
    'pzeq56gk': {
      'en': 'Activity',
      'am': 'እንቅስቃሴ',
    },
    'iyr6swz0': {
      'en': 'Import CBE Transactions',
      'am': 'የCBE ግብይቶችን አስመጣ',
    },
    'wdz98c9n': {
      'en': 'Activity',
      'am': 'እንቅስቃሴ',
    },
  },
  // plans
  {
    'zb6tuu1w': {
      'en': 'Total Asset',
      'am': 'ጠቅላላ ንብረት',
    },
    'fobqaip2': {
      'en': ' USD',
      'am': 'የአሜሪካ ዶላር',
    },
    'tlivuz2e': {
      'en': '42,350',
      'am': '42,350',
    },
    '7irxi9og': {
      'en': 'All Your Plans',
      'am': 'ሁሉም እቅዶችዎ',
    },
    '2arxue6a': {
      'en': '#',
      'am': '#',
    },
    'hr289eyx': {
      'en': '#work',
      'am': '#ስራ',
    },
    'w9nruvgz': {
      'en': '#work',
      'am': '#ስራ',
    },
    '88hnjh2a': {
      'en': 'Buying Laptop',
      'am': 'ላፕቶፕ መግዛት',
    },
    'gyb66tvi': {
      'en': '\$325',
      'am': '325 ዶላር',
    },
    'dznf5tfx': {
      'en': '\$80',
      'am': '80 ዶላር',
    },
    '3xgz5yrs': {
      'en': '#work',
      'am': '#ስራ',
    },
    '8npxta1l': {
      'en': 'Buying Laptop',
      'am': 'ላፕቶፕ መግዛት',
    },
    'tcx3zl38': {
      'en': '\$325',
      'am': '325 ዶላር',
    },
    'uey4mkml': {
      'en': '\$80',
      'am': '80 ዶላር',
    },
    'xaaamntb': {
      'en': 'Saving Plan',
      'am': 'የቁጠባ እቅድ',
    },
    '6tslmbaq': {
      'en': 'Plans',
      'am': 'ዕቅዶች',
    },
  },
  // Analysis
  {
    '1l8l1m51': {
      'en': 'Weekly',
      'am': 'በየሳምንቱ',
    },
    '49y9x797': {
      'en': 'Monthly',
      'am': 'ወርሃዊ',
    },
    'ak6h578i': {
      'en': 'Annual',
      'am': 'አመታዊ',
    },
    'hyyvxh1b': {
      'en': 'Monthly',
      'am': 'ወርሃዊ',
    },
    'y5yj3r4s': {
      'en': 'Daily',
      'am': 'በየቀኑ',
    },
    '329z6ptv': {
      'en': '9,350 etb',
      'am': '9,350 ወዘተ',
    },
    'rthxay2c': {
      'en': 'Weekly',
      'am': 'በየሳምንቱ',
    },
    'q2y2bl09': {
      'en': '22,430 etb',
      'am': '22,430 ወዘተ',
    },
    'e7e00qs3': {
      'en': 'Monthly',
      'am': 'ወርሃዊ',
    },
    'a20rvtwu': {
      'en': '42,920 etb',
      'am': '42,920 ወዘተ',
    },
    '6kpjm6tz': {
      'en': 'Spending Categories',
      'am': 'የወጪ ምድቦች',
    },
    'h1sypinw': {
      'en': 'Food & Groceries',
      'am': 'ምግብ እና ግሮሰሪ',
    },
    'zc6gyl8q': {
      'en': 'Bank Transfer',
      'am': 'የባንክ ማስተላለፍ',
    },
    'daq4djhb': {
      'en': 'Shopping & Ent.',
      'am': 'ግብይት እና መግባት',
    },
    'qgrtqqyg': {
      'en': 'Cash',
      'am': 'ጥሬ ገንዘብ',
    },
    'pds3nv8s': {
      'en': 'Transfers & Payments',
      'am': 'ማስተላለፎች እና ክፍያዎች',
    },
    '0fy7g8bz': {
      'en': 'Bank Transfer',
      'am': 'የባንክ ማስተላለፍ',
    },
    'ggmo6xf9': {
      'en': 'Housing & Utilities',
      'am': 'መኖሪያ ቤት እና መገልገያዎች',
    },
    'v798jepu': {
      'en': 'Bank Transfer',
      'am': 'የባንክ ማስተላለፍ',
    },
    'qmad7qc5': {
      'en': 'Transport',
      'am': 'መጓጓዣ',
    },
    'vz0ottvg': {
      'en': 'Cash',
      'am': 'ጥሬ ገንዘብ',
    },
    'ekal1xk4': {
      'en': 'Healthcare',
      'am': 'የጤና እንክብካቤ',
    },
    'nzk3sszm': {
      'en': 'Cash',
      'am': 'ጥሬ ገንዘብ',
    },
    '2mjtvm5u': {
      'en': 'Income',
      'am': 'ገቢ',
    },
    '916wnukq': {
      'en': 'Cash',
      'am': 'ጥሬ ገንዘብ',
    },
    'c2uk0z09': {
      'en': 'Other Expenses',
      'am': 'ሌሎች ወጪዎች',
    },
    'nugwkequ': {
      'en': 'Cash',
      'am': 'ጥሬ ገንዘብ',
    },
    'v69dopdx': {
      'en': 'Analysis',
      'am': 'ትንተና',
    },
    'bbz6r1ul': {
      'en': 'Get Reports',
      'am': 'ሪፖርቶችን ያግኙ',
    },
    'zt08ys2v': {
      'en': 'analysis',
      'am': 'ትንተና',
    },
  },
  // SigninPage
  {
    'ue5einah': {
      'en': 'Welcome Back',
      'am': 'እንኳን ደህና መጣህ',
    },
    '45irh3c9': {
      'en': 'Sign in to Continue',
      'am': 'ለመቀጠል ይግቡ',
    },
    '82x72lxe': {
      'en': 'Your Email Address',
      'am': 'የኢሜል አድራሻዎ',
    },
    'bmhqu5qh': {
      'en': 'Email',
      'am': 'ኢሜይል',
    },
    'o82i4eie': {
      'en': 'Password',
      'am': 'የይለፍ ቃል',
    },
    'uof92fg6': {
      'en': 'Password',
      'am': 'የይለፍ ቃል',
    },
    'kujinel5': {
      'en': 'Keep me logged in',
      'am': 'እንዳስገባ አቆይኝ።',
    },
    'b9ca2rtk': {
      'en': 'Forget Password?',
      'am': 'የይለፍ ቃል ረሳው?',
    },
    '9s011rbd': {
      'en': 'Login',
      'am': 'ግባ',
    },
    'nusmwhse': {
      'en': 'OR',
      'am': 'ወይም',
    },
    'frg13oql': {
      'en': 'Continue with Google',
      'am': 'በGoogle ይቀጥሉ',
    },
    '9aj2r43o': {
      'en': 'Don’t have account? ',
      'am': 'መለያ የለህም?',
    },
    '4izmswim': {
      'en': 'Create Now!',
      'am': 'አሁን ፍጠር!',
    },
    'utkozx32': {
      'en': 'Email is required',
      'am': 'ኢሜል ያስፈልጋል',
    },
    '0fq26oyz': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
    'kae2qfp5': {
      'en': 'Password is required',
      'am': 'የይለፍ ቃል ያስፈልጋል',
    },
    '8khxa4sa': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
    'f9om3w0r': {
      'en': 'Home',
      'am': 'ቤት',
    },
  },
  // add_balance
  {
    'c8yihbtl': {
      'en': 'Name',
      'am': 'ስም',
    },
    'lvicytci': {
      'en': 'Cash',
      'am': 'ጥሬ ገንዘብ',
    },
    '01707fpe': {
      'en': 'Amount',
      'am': 'መጠን',
    },
    'tax282bh': {
      'en': 'Available Balance',
      'am': 'የሚገኝ ቀሪ ሂሳብ',
    },
    'h6jerblr': {
      'en': 'ETB',
      'am': 'ኢ.ቲ.ቢ',
    },
    '8ab64ljf': {
      'en': 'Details',
      'am': 'ዝርዝሮች',
    },
    'irw4qwx8': {
      'en': 'Write Details Here',
      'am': 'ዝርዝሮችን እዚህ ይፃፉ',
    },
    'exavv9e9': {
      'en': 'Cash is required',
      'am': 'ጥሬ ገንዘብ ያስፈልጋል',
    },
    'xxd8zxw9': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
    'na8fzozy': {
      'en': 'Cash amount is required',
      'am': 'የገንዘብ መጠን ያስፈልጋል',
    },
    'vs7gs6my': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
    'cqgf66mx': {
      'en': 'Trans Details Here is required',
      'am': 'የትራንዚት ዝርዝሮች እዚህ ያስፈልጋል',
    },
    'u27uukwr': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
    '6vxfq4yv': {
      'en': 'Edit Cash Account',
      'am': 'የጥሬ ገንዘብ መለያ ያርትዑ',
    },
    '2s6zgr2o': {
      'en': 'Home',
      'am': 'ቤት',
    },
  },
  // crypto_accounts
  {
    'bn04lczm': {
      'en': 'Binance',
      'am': 'Binance',
    },
    'q7cxnqan': {
      'en': 'Exchange',
      'am': 'መለዋወጥ',
    },
    'fn34ghl3': {
      'en': '\$331',
      'am': '331 ዶላር',
    },
    'xxvwzrb7': {
      'en': 'Binance',
      'am': 'Binance',
    },
    '5sgz2ie4': {
      'en': 'Exchange',
      'am': 'መለዋወጥ',
    },
    'j2hs88l7': {
      'en': '\$331',
      'am': '331 ዶላር',
    },
    'mquqzph1': {
      'en': 'Binance',
      'am': 'Binance',
    },
    'uw7rjzu0': {
      'en': 'Wallet',
      'am': 'የኪስ ቦርሳ',
    },
    'kmmtm8y0': {
      'en': '\$331',
      'am': '331 ዶላር',
    },
    'auyzx0o5': {
      'en': 'Binance',
      'am': 'Binance',
    },
    'z2k0nqw3': {
      'en': 'Wallet',
      'am': 'የኪስ ቦርሳ',
    },
    'uh4qb5hc': {
      'en': '\$331',
      'am': '331 ዶላር',
    },
    'izvzeeja': {
      'en': 'Crypto Wallets',
      'am': 'ክሪፕቶ ቦርሳዎች',
    },
    '1gtj2818': {
      'en': 'Home',
      'am': 'ቤት',
    },
  },
  // plan_detail_page
  {
    '22072y0x': {
      'en': '#',
      'am': '#',
    },
    'wv85vec9': {
      'en': '#school',
      'am': '#ትምህርት ቤት',
    },
    'ehlf20cw': {
      'en': 'Budget Total',
      'am': 'አጠቃላይ በጀት',
    },
    'qmew2vur': {
      'en': 'Deposit',
      'am': 'ተቀማጭ ገንዘብ',
    },
    'stky4vi7': {
      'en': 'Withdrawal',
      'am': 'መውጣት',
    },
    'idbksa27': {
      'en': 'Saving History',
      'am': 'ታሪክን በማስቀመጥ ላይ',
    },
    'o6ypl5cn': {
      'en': '+ 3,110',
      'am': '+ 3,110',
    },
    'xwe1zef0': {
      'en': 'Saving Plan Detail',
      'am': 'የዕቅድ ዝርዝርን በማስቀመጥ ላይ',
    },
    'jrg4m7li': {
      'en': 'Home',
      'am': 'ቤት',
    },
  },
  // SignUp
  {
    'km0f54ds': {
      'en': 'Create an account',
      'am': 'መለያ ፍጠር',
    },
    '0beui5b4': {
      'en': 'Sign up to Continue',
      'am': 'ለመቀጠል ይመዝገቡ',
    },
    'q43wkaeg': {
      'en': 'Email',
      'am': 'ኢሜይል',
    },
    'gaxs2e22': {
      'en': 'Name',
      'am': 'ስም',
    },
    'xla38zv3': {
      'en': 'Password',
      'am': 'የይለፍ ቃል',
    },
    'v8ugeve2': {
      'en': 'Confirm Password',
      'am': 'የይለፍ ቃል ያረጋግጡ',
    },
    'iqmqznbc': {
      'en': 'Create Account',
      'am': 'መለያ ፍጠር',
    },
    'fo9ub4ux': {
      'en': 'OR',
      'am': 'ወይም',
    },
    'up4t0ccl': {
      'en': 'Continue with Google',
      'am': 'በGoogle ይቀጥሉ',
    },
    'tuh4n3rq': {
      'en': 'Already have an account? ',
      'am': 'መለያ አለህ?',
    },
    'msr2fwq4': {
      'en': ' Sign In here',
      'am': 'እዚህ ይግቡ',
    },
    'xyikw2od': {
      'en': 'Email is required',
      'am': 'ኢሜል ያስፈልጋል',
    },
    'kq95bvrl': {
      'en': 'Please Enter Valid Email Address',
      'am': 'እባክዎ የሚሰራ ኢሜይል አድራሻ ያስገቡ',
    },
    'xistcr2t': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
    'daiei389': {
      'en': 'Name is required',
      'am': 'ስም ያስፈልጋል',
    },
    '75uh9v2z': {
      'en': 'User name can not be less than 3 latters',
      'am': 'የተጠቃሚ ስም ከ 3 ኋለኛዎች በታች መሆን አይችልም።',
    },
    'hakut2jv': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
    'usmr5g00': {
      'en': 'Password is required',
      'am': 'የይለፍ ቃል ያስፈልጋል',
    },
    're6ad9v2': {
      'en': 'Password should be at least 8 characters',
      'am': 'የይለፍ ቃል ቢያንስ 8 ቁምፊዎች መሆን አለበት።',
    },
    'g6x4kh3o': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
    'rf0wu3oq': {
      'en': 'Confirm Password is required',
      'am': 'የይለፍ ቃል አረጋግጥ ያስፈልጋል',
    },
    'r1r3bv5f': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
    'cqu919td': {
      'en': 'UserName',
      'am': 'የተጠቃሚ ስም',
    },
    'gjfjs2ny': {
      'en': 'Overall',
      'am': 'በአጠቃላይ',
    },
    'wask6s5k': {
      'en': '5',
      'am': '5',
    },
    '16lmcgla': {
      'en':
          'Nice outdoor courts, solid concrete and good hoops for the neighborhood.',
      'am': 'ጥሩ የውጪ ፍርድ ቤቶች፣ ጠንካራ ኮንክሪት እና ለአካባቢው ጥሩ ሆፕ።',
    },
    '8g791m4u': {
      'en': 'Home',
      'am': 'ቤት',
    },
  },
  // new_saving_plan
  {
    'fe7icdba': {
      'en': 'Title',
      'am': 'ርዕስ',
    },
    'xx5vz20x': {
      'en': 'eg. Study Materials',
      'am': 'ለምሳሌ. የጥናት ቁሳቁሶች',
    },
    'h990ei9j': {
      'en': 'Amount',
      'am': 'መጠን',
    },
    'jceoz1ew': {
      'en': 'Enter Goal Amount',
      'am': 'የግብ መጠን ያስገቡ',
    },
    'hlv7o5dn': {
      'en': 'Category',
      'am': 'ምድብ',
    },
    'aajo45f5': {
      'en': 'Period',
      'am': 'ጊዜ',
    },
    'af5yp6yc': {
      'en': 'Day',
      'am': 'ቀን',
    },
    'gqby7x9o': {
      'en': 'Month',
      'am': 'ወር',
    },
    'ecm34cz8': {
      'en': 'Search...',
      'am': 'ፈልግ...',
    },
    'smxxqqo0': {
      'en': 'January',
      'am': 'ጥር',
    },
    'e4dvog0u': {
      'en': 'February',
      'am': 'የካቲት',
    },
    '8r9shlkv': {
      'en': 'March',
      'am': 'መጋቢት',
    },
    '1mg89nt7': {
      'en': 'April',
      'am': 'ሚያዚያ',
    },
    'ne5g1v3u': {
      'en': 'May',
      'am': 'ግንቦት',
    },
    'ly2e4lbe': {
      'en': 'June',
      'am': 'ሰኔ',
    },
    '78qfrdf0': {
      'en': 'July',
      'am': 'ሀምሌ',
    },
    '3f66yzxm': {
      'en': 'August',
      'am': 'ነሐሴ',
    },
    'jnfmiuko': {
      'en': 'September',
      'am': 'መስከረም',
    },
    'r9ff246b': {
      'en': 'October',
      'am': 'ጥቅምት',
    },
    'j2rz0aap': {
      'en': 'November',
      'am': 'ህዳር',
    },
    'muee8tpl': {
      'en': 'December',
      'am': 'ታህሳስ',
    },
    'izi6n1do': {
      'en': 'Start Date',
      'am': 'የመጀመሪያ ቀን',
    },
    '2l4g3rey': {
      'en': 'Save Plan',
      'am': 'እቅድ አስቀምጥ',
    },
    'u2vnxw2g': {
      'en': 'eg. Study Materials is required',
      'am': 'ለምሳሌ. የጥናት ቁሳቁስ ያስፈልጋል',
    },
    '47lpj7ys': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
    'p4tw985v': {
      'en': 'Enter API key is required',
      'am': 'የኤፒአይ ቁልፍ አስገባ ያስፈልጋል',
    },
    'eiq1hnfd': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
    '9i6fyrdg': {
      'en': 'period is required',
      'am': 'ጊዜ ያስፈልጋል',
    },
    'uo76mymy': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
    'uwliv1hi': {
      'en': 'Saving Plan',
      'am': 'የቁጠባ እቅድ',
    },
    'ey7qsu0g': {
      'en': 'Home',
      'am': 'ቤት',
    },
  },
  // notification_page
  {
    'ork8fvfk': {
      'en': 'Notifications',
      'am': 'ማሳወቂያዎች',
    },
    '4yq2m4zu': {
      'en': 'Home',
      'am': 'ቤት',
    },
  },
  // account_created
  {
    'chrpk7ob': {
      'en': 'Your Account Is Successfully Created',
      'am': 'መለያህ በተሳካ ሁኔታ ተፈጥሯል።',
    },
    '3mi6b7oe': {
      'en': 'Account setup complete. You can now start managing your expenses',
      'am': 'መለያ ማዋቀር ተጠናቅቋል። አሁን ወጪዎችዎን ማስተዳደር መጀመር ይችላሉ።',
    },
    'f9oe4nm5': {
      'en': 'Go to Home',
      'am': 'ወደ ቤት ሂድ',
    },
    '1qzxfrh7': {
      'en': 'Home',
      'am': 'ቤት',
    },
  },
  // settingPage
  {
    'juml40j9': {
      'en': 'General',
      'am': 'አጠቃላይ',
    },
    'ifx3hkvb': {
      'en': 'Profile',
      'am': 'መገለጫ',
    },
    'slq2ne4g': {
      'en': 'Notifications',
      'am': 'ማሳወቂያዎች',
    },
    'u62ukyfw': {
      'en': 'Export Data',
      'am': 'ውሂብ ወደ ውጪ ላክ',
    },
    'a9ir6pt6': {
      'en': 'Sync  Accounts',
      'am': 'መለያዎችን ያመሳስሉ',
    },
    'eav43rs4': {
      'en': 'App Lock',
      'am': 'የመተግበሪያ መቆለፊያ',
    },
    '3wiyzf0b': {
      'en': 'Preference',
      'am': 'ምርጫ',
    },
    'o32915sx': {
      'en': 'Language',
      'am': 'ቋንቋ',
    },
    'dcwngyv0': {
      'en': 'EN',
      'am': 'ኤን',
    },
    'z07l4nq4': {
      'en': 'EN',
      'am': 'ኤን',
    },
    'hyi9468c': {
      'en': 'Search...',
      'am': 'ፈልግ...',
    },
    'ker051ij': {
      'en': 'EN',
      'am': 'ኤን',
    },
    'ucrxy8ep': {
      'en': 'AM',
      'am': 'ኤም',
    },
    'e2s9b1j9': {
      'en': 'Dark mode',
      'am': 'ጨለማ ሁነታ',
    },
    '44c149y3': {
      'en': 'Others',
      'am': 'ሌሎች',
    },
    's06t7e8n': {
      'en': 'Privacy and Policy',
      'am': 'ግላዊነት እና ፖሊሲ',
    },
    'vwzpxx6c': {
      'en': 'Send Feedback',
      'am': 'ግብረ መልስ ላክ',
    },
    '3dqvnnfh': {
      'en': 'Logout',
      'am': 'ውጣ',
    },
    'ue9cuq76': {
      'en': 'Settings',
      'am': 'ቅንብሮች',
    },
    'i1qfe7fc': {
      'en': 'Home',
      'am': 'ቤት',
    },
  },
  // profile_page
  {
    'iemqrhss': {
      'en': 'Basic Info.',
      'am': 'መሰረታዊ መረጃ።',
    },
    'u8cst9mc': {
      'en': 'Name',
      'am': 'ስም',
    },
    'ocp92cjg': {
      'en': 'Contact Info.',
      'am': 'የእውቂያ መረጃ.',
    },
    'vcxwu9zw': {
      'en': 'Email Address',
      'am': 'ኢሜል አድራሻ',
    },
    'ifobdibh': {
      'en': 'Phone',
      'am': 'ስልክ',
    },
    'f3yfbij6': {
      'en': 'Password',
      'am': 'የይለፍ ቃል',
    },
    'fbg9ytq6': {
      'en': 'Last changed Dec 15',
      'am': 'መጨረሻ የተቀየረው ዲሴምበር 15',
    },
    '9mbdgj6l': {
      'en': 'Profile Setting',
      'am': 'የመገለጫ ቅንብር',
    },
    '047285ij': {
      'en': 'Home',
      'am': 'ቤት',
    },
  },
  // edit_profile
  {
    'vbvjjosr': {
      'en': 'Basic Info.',
      'am': 'መሰረታዊ መረጃ።',
    },
    'i8c9hn1l': {
      'en': 'Name',
      'am': 'ስም',
    },
    'pa5ft7jr': {
      'en': 'user name',
      'am': 'የተጠቃሚ ስም',
    },
    'xc95khc5': {
      'en': 'Contact Info.',
      'am': 'የእውቂያ መረጃ.',
    },
    'n0tgakcx': {
      'en': 'Email Address',
      'am': 'ኢሜል አድራሻ',
    },
    'ro8e8f5l': {
      'en': 'email address',
      'am': 'የኢሜል አድራሻ',
    },
    '2smvxogk': {
      'en': 'Phone',
      'am': 'ስልክ',
    },
    'abyl5ek3': {
      'en': 'phone number',
      'am': 'ስልክ ቁጥር',
    },
    'g18e5hda': {
      'en': 'Confirm',
      'am': 'አረጋግጥ',
    },
    'f4qyi4vv': {
      'en': 'Edit Profile',
      'am': 'መገለጫ አርትዕ',
    },
    'onj1rpk7': {
      'en': 'Home',
      'am': 'ቤት',
    },
  },
  // budgetPage
  {
    'e29qoex5': {
      'en': 'etb of ',
      'am': 'etb የ',
    },
    'pwei755p': {
      'en': 'etb',
      'am': 'ወዘተ',
    },
    'eov7x6b3': {
      'en': '810 etb of 1500 etb',
      'am': '810 etb ከ 1500 ወ.ዘ.ተ',
    },
    'ip1fgof2': {
      'en': '85%',
      'am': '85%',
    },
    'ghflhy51': {
      'en': 'Food Monthly',
      'am': 'ምግብ ወርሃዊ',
    },
    'tytq959n': {
      'en': '9770 etb of 12,000 etb',
      'am': '9770 etb ከ 12,000 ወዘተ',
    },
    'm88dctky': {
      'en': '2230',
      'am': '2230',
    },
    '8a33sf9t': {
      'en': 'Budgets',
      'am': 'በጀቶች',
    },
    '7e9wt8pk': {
      'en': 'Home',
      'am': 'ቤት',
    },
  },
  // foreget_password
  {
    'sn6xvmy2': {
      'en': 'Forget Password',
      'am': 'የይለፍ ቃል እርሳ',
    },
    'u1i1sq4s': {
      'en':
          'Enter your email, and we’ll send you an email to reset your password.',
      'am': 'ኢሜልዎን ያስገቡ እና የይለፍ ቃልዎን እንደገና ለማስጀመር ኢሜይል እንልክልዎታለን።',
    },
    'femehhju': {
      'en': 'Your Email Address',
      'am': 'የኢሜል አድራሻዎ',
    },
    'ibvowkyt': {
      'en': 'example1@gmail.com',
      'am': 'ምሳሌ1@gmail.com',
    },
    'wa6hhu0p': {
      'en': 'email address is required',
      'am': 'የኢሜል አድራሻ ያስፈልጋል',
    },
    'f6t87wqk': {
      'en': 'please enter valid email address',
      'am': 'እባክዎ ትክክለኛ የኢሜይል አድራሻ ያስገቡ',
    },
    'ab84tbim': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
    '6sk0j0rp': {
      'en': 'Continue',
      'am': 'ቀጥል',
    },
    'hzm15whg': {
      'en': 'Back',
      'am': 'ተመለስ',
    },
    'zii7f0qx': {
      'en': 'Home',
      'am': 'ቤት',
    },
  },
  // new_budget
  {
    '8mvywzuw': {
      'en': 'Title',
      'am': 'ርዕስ',
    },
    'mzog2rhy': {
      'en': 'eg. Study Materials',
      'am': 'ለምሳሌ. የጥናት ቁሳቁሶች',
    },
    'afkz8vrw': {
      'en': 'Amount',
      'am': 'መጠን',
    },
    'jml9ub6g': {
      'en': 'total budget',
      'am': 'ጠቅላላ በጀት',
    },
    'hi2ckaif': {
      'en': 'Category',
      'am': 'ምድብ',
    },
    'evbc0jjt': {
      'en': 'Period',
      'am': 'ጊዜ',
    },
    'm9vc8jqe': {
      'en': 'Day',
      'am': 'ቀን',
    },
    'f3m5y3er': {
      'en': 'Month',
      'am': 'ወር',
    },
    'ucwtolqt': {
      'en': 'Search...',
      'am': 'ፈልግ...',
    },
    '3jkcqqov': {
      'en': 'January',
      'am': 'ጥር',
    },
    'yrnhcw8g': {
      'en': 'February',
      'am': 'የካቲት',
    },
    'i39mau4n': {
      'en': 'March',
      'am': 'መጋቢት',
    },
    '955eayt3': {
      'en': 'April',
      'am': 'ሚያዚያ',
    },
    'qj530dy5': {
      'en': 'May',
      'am': 'ግንቦት',
    },
    'qcp9t4j2': {
      'en': 'June',
      'am': 'ሰኔ',
    },
    'almk9vh3': {
      'en': 'July',
      'am': 'ሀምሌ',
    },
    '6qv2gx3q': {
      'en': 'August',
      'am': 'ነሐሴ',
    },
    'fpd5sfuw': {
      'en': 'September',
      'am': 'መስከረም',
    },
    'vg6g7mjc': {
      'en': 'October',
      'am': 'ጥቅምት',
    },
    'me8fuxf7': {
      'en': 'November',
      'am': 'ህዳር',
    },
    'mtyhe63x': {
      'en': 'December',
      'am': 'ታህሳስ',
    },
    'bfhtcexq': {
      'en': 'Start Date',
      'am': 'የመጀመሪያ ቀን',
    },
    '6n07v0gu': {
      'en': 'Confirm',
      'am': 'አረጋግጥ',
    },
    'rt2k67pa': {
      'en': 'eg. Study Materials is required',
      'am': 'ለምሳሌ. የጥናት ቁሳቁስ ያስፈልጋል',
    },
    'yz3u3883': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
    'z3micq7i': {
      'en': 'Enter API key is required',
      'am': 'የኤፒአይ ቁልፍ አስገባ ያስፈልጋል',
    },
    'h7ux95oc': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
    'c2sn4g1u': {
      'en': 'period is required',
      'am': 'ጊዜ ያስፈልጋል',
    },
    'hh5tpp07': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
    'v61q69f0': {
      'en': 'New Budget',
      'am': 'አዲስ በጀት',
    },
    'idco9y6w': {
      'en': 'Home',
      'am': 'ቤት',
    },
  },
  // privacy_security
  {
    'i515kmvh': {
      'en': '🔐 Privacy and Policy Policy',
      'am': '🔐 የግላዊነት እና የፖሊሲ ፖሊሲ',
    },
    '9osfkheu': {
      'en':
          'Last Updated: May 01, 2025\n\nAt Our App, we value your privacy and are committed to protecting your personal and financial information. This Privacy and Security Policy explains how we handle your data and keep your information safe.',
      'am':
          'መጨረሻ የዘመነው፡ ግንቦት 01፣ 2025\n\nበእኛ መተግበሪያ፣ የእርስዎን ግላዊነት እናከብራለን እናም የእርስዎን የግል እና የፋይናንስ መረጃ ለመጠበቅ ቁርጠኞች ነን። ይህ የግላዊነት እና የደህንነት መመሪያ የእርስዎን ውሂብ እንዴት እንደምንይዝ እና የመረጃዎን ደህንነት እንደምንጠብቅ ያብራራል።',
    },
    '7btob0ia': {
      'en': '1. What We Collect',
      'am': '1. የምንሰበስበው',
    },
    'ell402jf': {
      'en':
          'We may collect the following information:\n\nPersonal details (name, email)\n\nFinancial records you add (income, expenses, categories)\n\nCurrency preference (e.g., ETB, USD, etc.)\n\nDevice and usage data (for improving app performance)\n\nWe do not collect or access your banking credentials or payment platform login details (e.g., crypto wallets, Payoneer).',
      'am':
          'የሚከተለውን መረጃ ልንሰበስብ እንችላለን፡-\n\nየግል ዝርዝሮች (ስም ፣ ኢሜል)\n\nየሚያክሏቸው የፋይናንስ መዝገቦች (ገቢ፣ ወጪዎች፣ ምድቦች)\n\nየምንዛሬ ምርጫ (ለምሳሌ፣ ኢቲቢ፣ ዶላር፣ ወዘተ.)\n\nየመሣሪያ እና የአጠቃቀም ውሂብ (የመተግበሪያውን አፈጻጸም ለማሻሻል)\n\nየእርስዎን የባንክ ምስክርነቶች ወይም የክፍያ መድረክ መግቢያ ዝርዝሮችን (ለምሳሌ፣ crypto wallets፣ Payoneer) አንሰበስብም ወይም አንደርስም።',
    },
    'lenuwkxp': {
      'en': '2. How We Use Your Data',
      'am': '2. የእርስዎን ውሂብ እንዴት እንደምንጠቀም',
    },
    'y9xo5al8': {
      'en':
          'We use your data to:\n\n- Help you track your income and expenses\n- Display insights and balances based on your currency preferences\n- Improve app performance and user experience\n- We will never sell your data or share it with third parties without your consent.',
      'am':
          'የእርስዎን ውሂብ ወደዚህ እንጠቀማለን፡-\n\n- ገቢዎን እና ወጪዎችዎን እንዲከታተሉ ይረዱዎታል\n- በእርስዎ የምንዛሬ ምርጫዎች ላይ በመመስረት ግንዛቤዎችን እና ሚዛኖችን ያሳዩ\n- የመተግበሪያውን አፈፃፀም እና የተጠቃሚ ተሞክሮ ያሻሽሉ።\n- ያለፈቃድዎ ውሂብዎን በጭራሽ አንሸጥም ወይም ለሶስተኛ ወገኖች አናጋራም።',
    },
    '1d29bwog': {
      'en': '3. Currency Handling',
      'am': '3. የገንዘብ አያያዝ',
    },
    'r4guwaxz': {
      'en':
          'To support transparency:\n\nYou can select your preferred currency for displaying total balance (e.g., USD, ETB, EUR).\n\nHowever, all individual entries remain in ETB to reflect consistency in local records.\n\nCrypto and Payoneer values are shown as-is from those platforms and are not converted.\n\n💡 Example: If you select USD, your total balance will show in USD, but your income/expense entries will still be in ETB (or crypto as recorded).',
      'am':
          'ግልጽነትን ለመደገፍ፡-\n\nጠቅላላ ቀሪ ሒሳብን ለማሳየት የመረጡትን ገንዘብ መምረጥ ይችላሉ (ለምሳሌ፡ USD፣ ETB፣ EUR)።\n\nነገር ግን፣ ሁሉም የግለሰብ ግቤቶች በአካባቢያዊ መዝገቦች ውስጥ ያለውን ወጥነት ለማንፀባረቅ በETB ውስጥ ይቀራሉ።\n\nየCrypto እና Payoneer ዋጋዎች ከነዚያ የመሣሪያ ስርዓቶች ሆነው ይታያሉ እና አይለወጡም።\n\n💡 ምሳሌ፡ USDን ከመረጡ አጠቃላይ ሂሳቡ በUSD ይታያል ነገር ግን የገቢ/ወጪ ግቤቶች አሁንም በETB (ወይም crypto እንደተመዘገበ) ይሆናል።',
    },
    'kok6rr5j': {
      'en': '4. Data Storage & Security',
      'am': '4. የውሂብ ማከማቻ እና ደህንነት',
    },
    '0ohrewxh': {
      'en':
          'Your data is stored securely using Firebase, with encrypted transmission (HTTPS).\n\nOnly you have access to your records unless you choose to share them.\n\nWe regularly update our security practices to prevent unauthorized access, loss, or misuse.',
      'am':
          'የእርስዎ ውሂብ ፋየርbaseን በመጠቀም ደህንነቱ በተጠበቀ ሁኔታ ይከማቻል፣ ከተመሰጠረ ማስተላለፊያ (ኤችቲቲፒኤስ) ጋር።\n\nመዝገቦችህን ለማጋራት ካልመረጥክ በስተቀር አንተ ብቻ ነህ።\n\nያልተፈቀደ መድረስን፣ መጥፋትን ወይም አላግባብ መጠቀምን ለመከላከል የደህንነት ተግባሮቻችንን በመደበኛነት እናዘምነዋለን።',
    },
    'xq9ts13r': {
      'en': '5. Your Control',
      'am': '5. የእርስዎ ቁጥጥር',
    },
    'uqp9wwfh': {
      'en':
          'You have full control over your data:\n\nYou can update or delete your entries at any time.\n\nYou can request full data deletion by contacting us at: abeselom.dejene@astu.edu.et',
      'am':
          'በውሂብህ ላይ ሙሉ ቁጥጥር አለህ፡-\n\nግቤቶችዎን በማንኛውም ጊዜ ማዘመን ወይም መሰረዝ ይችላሉ።\n\nመረጃውን ሙሉ በሙሉ እንዲሰረዝልን በ አድራሻ፡- abeselom.dejene@astu.edu.et መጠየቅ ይችላሉ።',
    },
    'kr2w4j51': {
      'en': '6. Children’s Privacy',
      'am': '6. የልጆች ግላዊነት',
    },
    'xi35ae3v': {
      'en':
          'This app is not intended for children under 13. We do not knowingly collect data from children.',
      'am':
          'ይህ መተግበሪያ ከ13 ዓመት በታች ለሆኑ ህጻናት የታሰበ አይደለም። እያወቅን ከልጆች መረጃ አንሰበስብም።',
    },
    'ze1rqwrq': {
      'en': '7. Changes to This Policy',
      'am': '7. በዚህ ፖሊሲ ላይ የተደረጉ ለውጦች',
    },
    '1q1hvcsw': {
      'en':
          'We may update this policy to reflect improvements or legal requirements. You’ll be notified in-app or via email of major changes.',
      'am':
          'ማሻሻያዎችን ወይም ህጋዊ መስፈርቶችን ለማንፀባረቅ ይህንን መመሪያ ልናዘምነው እንችላለን። በመተግበሪያ ውስጥ ወይም ስለ ዋና ለውጦች በኢሜይል ማሳወቂያ ይደርሰዎታል።',
    },
    'wiku7qbl': {
      'en': 'Privacy and Policy',
      'am': 'ግላዊነት እና ፖሊሲ',
    },
    'r29vvvcq': {
      'en': 'Home',
      'am': 'ቤት',
    },
  },
  // bottomsheet
  {
    'zgtciq3p': {
      'en': 'Balance Activity',
      'am': 'የተመጣጠነ እንቅስቃሴ',
    },
    'vv14mm3q': {
      'en': 'Total Asset',
      'am': 'ጠቅላላ ንብረት',
    },
    'l7d7wc3o': {
      'en': ' USD',
      'am': 'የአሜሪካ ዶላር',
    },
    'wo4rvu8y': {
      'en': '42,350',
      'am': '42,350',
    },
    'pm897ilr': {
      'en': 'Today ',
      'am': 'ዛሬ',
    },
    'h7zvcq31': {
      'en': 'transaction',
      'am': 'ግብይት',
    },
    '7i16xny9': {
      'en': '1D',
      'am': '1 ዲ',
    },
    'frih8cmq': {
      'en': '1W',
      'am': '1 ዋ',
    },
    'ma1j2qcc': {
      'en': '1M',
      'am': '1ሚ',
    },
    '1kpvcny0': {
      'en': '6M',
      'am': '6ሚ',
    },
  },
  // add_crypto_account
  {
    'xdhnoynx': {
      'en': 'Add Crypto Wallets',
      'am': 'ክሪፕቶ የኪስ ቦርሳዎችን ያክሉ',
    },
    'gnb9887u': {
      'en': 'Binance',
      'am': 'Binance',
    },
    'ke6nl0cn': {
      'en': 'BTC',
      'am': 'ቢቲሲ',
    },
    'tr4alevn': {
      'en': 'Metamask',
      'am': 'ሜታማስክ',
    },
    'joc0i67u': {
      'en': 'Tether',
      'am': 'ማሰር',
    },
    'ww37inhe': {
      'en': 'Next',
      'am': 'ቀጥሎ',
    },
  },
  // connect_popup
  {
    'rbmry1kg': {
      'en': 'Connecting with Binance exchange',
      'am': 'ከ Binance ልውውጥ ጋር በመገናኘት ላይ',
    },
    'xf32jgqt': {
      'en': 'Add Your Binance API key to connect your wallet ',
      'am': 'ቦርሳዎን ለማገናኘት የእርስዎን Binance API ቁልፍ ያክሉ',
    },
    'xbfhqvo1': {
      'en': 'API Key',
      'am': 'የኤፒአይ ቁልፍ',
    },
    '4xkymkyr': {
      'en': 'Enter API key',
      'am': 'የኤፒአይ ቁልፍ አስገባ',
    },
    'g5mxekpj': {
      'en': 'API Secret',
      'am': 'የኤፒአይ ሚስጥር',
    },
    'f3n70f5a': {
      'en': 'Enter API Secret',
      'am': 'የኤፒአይ ሚስጥር አስገባ',
    },
    'vdemrja3': {
      'en': 'Connecting with Crypto Wallet',
      'am': 'ከ Crypto Wallet ጋር በመገናኘት ላይ',
    },
    '8gpmsmr2': {
      'en': 'Add Your Wallet Address',
      'am': 'የኪስ ቦርሳ አድራሻዎን ያክሉ',
    },
    'a818z7zn': {
      'en': 'Wallet Adress',
      'am': 'የኪስ ቦርሳ አድራሻ',
    },
    'i221olph': {
      'en': 'Next',
      'am': 'ቀጥሎ',
    },
    'w2vobfj7': {
      'en':
          'By Clicking to Allow access, you authorize a system to use your Information in accordance with its Privacy Policy.',
      'am':
          'መዳረሻን ለመፍቀድ ጠቅ በማድረግ አንድ ስርዓት በግላዊነት መመሪያው መሰረት የእርስዎን መረጃ እንዲጠቀም ፍቃድ ይሰጣሉ።',
    },
  },
  // connect_sucess_popup
  {
    'a977m49l': {
      'en': 'Wallet Connect done!',
      'am': 'የኪስ ቦርሳ ግንኙነት ተከናውኗል!',
    },
    'tuderuui': {
      'en':
          'Your Account API key and API Secret have been securely connected. \n\nYou\'re now ready to proceed!',
      'am':
          'የእርስዎ መለያ ኤፒአይ ቁልፍ እና ኤፒአይ ሚስጥር ደህንነቱ በተጠበቀ ሁኔታ ተገናኝተዋል። \n\nአሁን ለመቀጠል ዝግጁ ነዎት!',
    },
    'g0tviwfr': {
      'en': 'Close',
      'am': 'ገጠመ',
    },
  },
  // plan_categories
  {
    'yp71bo68': {
      'en': 'Select category',
      'am': 'ምድብ ይምረጡ',
    },
    'z3ghipuq': {
      'en': 'Food & Groceries',
      'am': 'ምግብ እና ግሮሰሪ',
    },
    '982fucgu': {
      'en': 'Shopping & Entertainment',
      'am': 'ግብይት እና መዝናኛ',
    },
    'm6idudt0': {
      'en': 'Housing & Utilities',
      'am': 'መኖሪያ ቤት እና መገልገያዎች',
    },
    '4zz3a69v': {
      'en': 'Income',
      'am': 'ገቢ',
    },
    'wrqg62nn': {
      'en': 'Healthcare',
      'am': 'የጤና እንክብካቤ',
    },
    '6s1jf8y1': {
      'en': 'Transportation',
      'am': 'መጓጓዣ',
    },
    'yob1e10r': {
      'en': 'Transfers & Payments',
      'am': 'ማስተላለፎች እና ክፍያዎች',
    },
    'ezga0lz0': {
      'en': 'Other Expenses',
      'am': 'ሌሎች ወጪዎች',
    },
    'nx0m73ys': {
      'en': 'Next',
      'am': 'ቀጥሎ',
    },
  },
  // expense_detail
  {
    'a673gi4y': {
      'en': 'Expense Done!',
      'am': 'ወጪ ተከናውኗል!',
    },
    'u3ze2ae1': {
      'en': 'Date',
      'am': 'ቀን',
    },
    'hyd3eipj': {
      'en': 'Remark',
      'am': 'አስተያየት',
    },
    'nf8zfph5': {
      'en': 'Category',
      'am': 'ምድብ',
    },
    'ex39879n': {
      'en': 'From Account',
      'am': 'ከመለያ',
    },
    '21dlhnug': {
      'en': 'Close',
      'am': 'ገጠመ',
    },
  },
  // emptyNotifications
  {
    'bqr9h35a': {
      'en': 'You have no notification.',
      'am': 'ምንም ማሳወቂያ የለዎትም።',
    },
    '5j5frqm4': {
      'en': 'Notifications of services that you are taking will show here.',
      'am': 'የሚወስዷቸው አገልግሎቶች ማሳወቂያዎች እዚህ ይታያሉ።',
    },
  },
  // logout_popup
  {
    'w4m7rb2d': {
      'en': 'Logout Confirmation',
      'am': 'የመውጣት ማረጋገጫ',
    },
    'rqug1egi': {
      'en': 'Are you sure you want to logout?',
      'am': 'እርግጠኛ ነህ መውጣት ትፈልጋለህ?',
    },
    '7tys28cv': {
      'en': 'Cancel',
      'am': 'ሰርዝ',
    },
    '68gximbi': {
      'en': 'Logout',
      'am': 'ውጣ',
    },
  },
  // plan_balance_activ
  {
    'me7707qw': {
      'en': 'Transaction',
      'am': 'ግብይት',
    },
    '4dmsolq8': {
      'en': 'Enter Amount',
      'am': 'መጠን ያስገቡ',
    },
    'tr0syigs': {
      'en': '0.00',
      'am': '0.00',
    },
    'ac0lmi4p': {
      'en': '10',
      'am': '10',
    },
    'a6imubpv': {
      'en': '50',
      'am': '50',
    },
    'h9ggb3qb': {
      'en': '100',
      'am': '100',
    },
    '77gk9hlb': {
      'en': '200',
      'am': '200',
    },
    'c9w0hh9k': {
      'en': '1000',
      'am': '1000',
    },
    'qju9nyp6': {
      'en': 'Cancel',
      'am': 'ሰርዝ',
    },
    '2dzqwi4m': {
      'en': 'Confirm',
      'am': 'አረጋግጥ',
    },
    'qtul8klu': {
      'en': 'Amount is Required!',
      'am': 'መጠን ያስፈልጋል!',
    },
    '6sylkalq': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
  },
  // notification_preferance
  {
    's1oil7i1': {
      'en': 'Notification PREFERENCE',
      'am': 'የማስታወቂያ ምርጫ',
    },
    'z0tr0lct': {
      'en': 'Mobile Push Notifications',
      'am': 'የሞባይል ግፋ ማስታወቂያዎች',
    },
    'nly7bb0l': {
      'en': 'Receive push notification whenever their is any updates',
      'am': 'ማሻሻያዎች ሲሆኑ የግፋ ማሳወቂያ ይቀበሉ',
    },
    '9viwjg6o': {
      'en': 'Email Notification',
      'am': 'የኢሜል ማሳወቂያ',
    },
    'onu2m7la': {
      'en': 'Receive email  whenever their is any updates',
      'am': 'ማሻሻያዎች ሲሆኑ ኢሜል ይቀበሉ',
    },
  },
  // app_lock
  {
    'habzmzko': {
      'en': 'App Lock',
      'am': 'የመተግበሪያ መቆለፊያ',
    },
    'lf3wc1g8': {
      'en': 'Enter your PIN to unlock the app',
      'am': 'መተግበሪያውን ለመክፈት ፒንዎን ያስገቡ',
    },
    '8af9r7o9': {
      'en': '1',
      'am': '1',
    },
    'bsdvx1a0': {
      'en': '2',
      'am': '2',
    },
    '7appnwuj': {
      'en': '3',
      'am': '3',
    },
    '8iyz67o7': {
      'en': '4',
      'am': '4',
    },
    'jahhqued': {
      'en': '5',
      'am': '5',
    },
    '2vcg35fk': {
      'en': '6',
      'am': '6',
    },
    'ggn714ox': {
      'en': '7',
      'am': '7',
    },
    'zitmfsih': {
      'en': '8',
      'am': '8',
    },
    'antdn1xp': {
      'en': '9',
      'am': '9',
    },
    '2gsy6kgf': {
      'en': '0',
      'am': '0',
    },
    'uh5rj9tm': {
      'en': 'Forgot PIN?',
      'am': 'ፒን ረሱ?',
    },
  },
  // plan_warning
  {
    'shkmx1l3': {
      'en': 'Dismiss',
      'am': 'አሰናብት',
    },
  },
  // reusable_popup
  {
    'oa770xeh': {
      'en': 'Warning',
      'am': 'ማስጠንቀቂያ',
    },
    'lvhrh7js': {
      'en':
          'You\'re trying to add more than your savings goal. This might affect your budget planning.',
      'am': 'ከቁጠባ ግብዎ የበለጠ ለመጨመር እየሞከሩ ነው። ይህ የበጀት እቅድዎን ሊጎዳ ይችላል።',
    },
    '8mk2grw3': {
      'en': 'Cancel',
      'am': 'ሰርዝ',
    },
    'p4vq6i6m': {
      'en': 'Confirm',
      'am': 'አረጋግጥ',
    },
  },
  // verify_email
  {
    'jjzsr1ox': {
      'en': 'Email Not Verified',
      'am': 'ኢሜይል አልተረጋገጠም።',
    },
    'zmxslnb7': {
      'en':
          'Please check your inbox and verify your email address to access all features.',
      'am': 'እባክዎ ሁሉንም ባህሪያት ለመድረስ የገቢ መልእክት ሳጥንዎን ያረጋግጡ እና የኢሜል አድራሻዎን ያረጋግጡ።',
    },
    'f53ecgyf': {
      'en': 'Resend Verification Email',
      'am': 'የማረጋገጫ ኢሜይልን እንደገና ላክ',
    },
  },
  // change_password
  {
    'rqogue1x': {
      'en': 'Change Password',
      'am': 'የይለፍ ቃል ቀይር',
    },
    'fzn3rrr7': {
      'en': 'New Password',
      'am': 'አዲስ የይለፍ ቃል',
    },
    '13otrrlz': {
      'en': 'Confirm New Password',
      'am': 'አዲስ የይለፍ ቃል ያረጋግጡ',
    },
    'i19hlqk1': {
      'en': 'Update Password',
      'am': 'የይለፍ ቃል አዘምን',
    },
    'rbanyfpo': {
      'en': 'Ppassword Field is required',
      'am': 'የPpassword መስክ ያስፈልጋል',
    },
    '497giq7f': {
      'en': 'the password should be atleast 8 characters long',
      'am': 'የይለፍ ቃሉ ቢያንስ 8 ቁምፊዎች መሆን አለበት።',
    },
    '2ra7osit': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
    'xr1cobsd': {
      'en': 'Confirm Password Field is required',
      'am': 'የይለፍ ቃል ያረጋግጡ መስክ ያስፈልጋል',
    },
    '60hiad9n': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
  },
  // empty_list
  {
    'g3d6txvd': {
      'en': 'Nothing to show',
      'am': 'ምንም የሚታይ ነገር የለም።',
    },
    '51zt8xd6': {
      'en': 'Your list is currently empty. Items you add will appear here.',
      'am': 'ዝርዝርዎ በአሁኑ ጊዜ ባዶ ነው። የሚያክሏቸው ዕቃዎች እዚህ ይታያሉ።',
    },
  },
  // empty_listCopy
  {
    'iy3unnjh': {
      'en': 'No Transactions Yet!',
      'am': 'እስካሁን ምንም ግብይቶች የሉም!',
    },
  },
  // add_bank_account
  {
    'cvbsgq9w': {
      'en': 'Add Bank Account',
      'am': 'የባንክ ሂሳብ አክል',
    },
    '3nx473s7': {
      'en': 'Paypal',
      'am': 'Paypal',
    },
    'plrhnnpr': {
      'en': 'CBE',
      'am': 'ንግድ ባንክ',
    },
    'a6i9hgd7': {
      'en': 'COOP',
      'am': 'COOP',
    },
    'cb5fq0ub': {
      'en': 'BOA',
      'am': 'BOA',
    },
    'vgwxhauh': {
      'en': 'SIINQEE',
      'am': 'SIINQEE',
    },
    '2x4jg4d0': {
      'en': 'TELE BIRR',
      'am': 'ቴሌ ቢአር',
    },
    '5g4x1mj2': {
      'en': 'Next',
      'am': 'ቀጥሎ',
    },
  },
  // exportdata
  {
    '66dcazv1': {
      'en': 'Export Transactions',
      'am': 'ግብይቶችን ወደ ውጪ ላክ',
    },
    'r3wja4kr': {
      'en': 'Select a time range for your transaction data export',
      'am': 'የግብይት ውሂብ ወደ ውጭ ለመላክ የጊዜ ክልል ይምረጡ',
    },
    '21mb8b41': {
      'en': 'Last Week',
      'am': 'ባለፈው ሳምንት',
    },
    'yzgn87fa': {
      'en': 'Last Month',
      'am': 'ባለፈው ወር',
    },
    's1x76ac4': {
      'en': 'Last Year',
      'am': 'ያለፈው ዓመት',
    },
    '477fh2hu': {
      'en': 'All Time',
      'am': 'ሁል ጊዜ',
    },
    'kkrhocgn': {
      'en': 'Export Data',
      'am': 'ውሂብ ወደ ውጪ ላክ',
    },
  },
  // connect_popup_bank
  {
    'siyjua2n': {
      'en': 'Connecting with Bank Account',
      'am': 'ከባንክ ሂሳብ ጋር መገናኘት',
    },
    'uqgwujux': {
      'en': 'Add Your Account API key to connect your wallet ',
      'am': 'የኪስ ቦርሳዎን ለማገናኘት የእርስዎን መለያ ኤፒአይ ቁልፍ ያክሉ',
    },
    'hejlwuws': {
      'en': 'API Key',
      'am': 'የኤፒአይ ቁልፍ',
    },
    'jzabs7rq': {
      'en': 'Enter API key',
      'am': 'የኤፒአይ ቁልፍ አስገባ',
    },
    'd2umkm2a': {
      'en': 'API Secret',
      'am': 'የኤፒአይ ሚስጥር',
    },
    'niyzeu2c': {
      'en': 'Enter API Secret',
      'am': 'የኤፒአይ ሚስጥር አስገባ',
    },
    'stsimyzp': {
      'en': 'Next',
      'am': 'ቀጥሎ',
    },
    'kqotidlz': {
      'en':
          'By Clicking to Allow access, you authorize a system to use your Information in accordance with its Privacy Policy.',
      'am':
          'መዳረሻን ለመፍቀድ ጠቅ በማድረግ አንድ ስርዓት በግላዊነት መመሪያው መሰረት የእርስዎን መረጃ እንዲጠቀም ፍቃድ ይሰጣሉ።',
    },
  },
  // syncWarnPopup
  {
    '6cosn9v0': {
      'en': 'Important Notice',
      'am': 'ጠቃሚ ማሳሰቢያ',
    },
    'pypqtzvk': {
      'en': 'One-Time Action Warning',
      'am': 'የአንድ ጊዜ የድርጊት ማስጠንቀቂያ',
    },
    '6brrq1ls': {
      'en':
          'This synchronization can only be performed once. Before proceeding, please ensure you have connected all necessary financial accounts:',
      'am':
          'ይህ ማመሳሰል አንድ ጊዜ ብቻ ሊከናወን ይችላል። ከመቀጠልዎ በፊት፣ እባክዎ ሁሉንም አስፈላጊ የፋይናንስ ሂሳቦችን ማገናኘትዎን ያረጋግጡ።',
    },
    'cj4kg0y1': {
      'en': 'Bank accounts',
      'am': 'የባንክ ሂሳቦች',
    },
    'vgnolfiu': {
      'en': 'PayPal accounts',
      'am': 'የ PayPal መለያዎች',
    },
    'sx9c5lol': {
      'en': 'Cryptocurrency wallets',
      'am': 'ክሪፕቶ ምንዛሬ የኪስ ቦርሳ',
    },
    'sfkfgks8': {
      'en': 'Investment accounts',
      'am': 'የኢንቨስትመንት መለያዎች',
    },
    'fwltfpr0': {
      'en':
          'You will not be able to perform this action again. For optimal results, ensure all accounts are connected before proceeding.',
      'am':
          'ይህን ድርጊት እንደገና ማከናወን አይችሉም። ለተሻለ ውጤት ከመቀጠልዎ በፊት ሁሉም መለያዎች መገናኘታቸውን ያረጋግጡ።',
    },
    '3w8qm2vj': {
      'en': 'I Understand, Proceed Anyway',
      'am': 'ገባኝ፣ ለማንኛውም ቀጥል።',
    },
    'y2teeem3': {
      'en': 'Cancel',
      'am': 'ሰርዝ',
    },
  },
  // importCBE
  {
    'bl50qdw7': {
      'en': 'Import CBE Transactions',
      'am': 'የCBE ግብይቶችን አስመጣ',
    },
    'wogei1mc': {
      'en':
          'Enter your CBE transaction URL to import your bank transactions directly into the app.',
      'am': 'የባንክ ግብይቶችዎን በቀጥታ ወደ መተግበሪያው ለማስገባት የእርስዎን CBE የግብይት ዩአርኤል ያስገቡ።',
    },
    'inpnpjuo': {
      'en': 'CBE Transaction URL',
      'am': 'CBE ግብይት URL',
    },
    'ecsxcsdw': {
      'en': 'Import Transactions',
      'am': 'ግብይቶችን አስመጣ',
    },
    'p10c2ut4': {
      'en': 'Only CBE transaction URLs are supported at this time.',
      'am': 'በዚህ ጊዜ የCBE ግብይት ዩአርኤሎች ብቻ ይደገፋሉ።',
    },
    '32gv1pvw': {
      'en': 'CBE Transaction URL is required',
      'am': 'CBE የግብይት ዩአርኤል ያስፈልጋል',
    },
    'nn2s9m2p': {
      'en': 'Please choose an option from the dropdown',
      'am': 'እባክዎ ከተቆልቋዩ ውስጥ አንድ አማራጭ ይምረጡ',
    },
  },
  // Get_Report_PDF
  {
    'gh8xobsi': {
      'en': 'Export Financial Report',
      'am': 'የፋይናንስ ሪፖርት ወደ ውጪ ላክ',
    },
    '7sz1u8zq': {
      'en':
          'Select a time range to generate your financial insights report. The report will be exported as a PDF file.',
      'am':
          'የእርስዎን የፋይናንስ ግንዛቤዎች ሪፖርት ለማመንጨት የጊዜ ክልል ይምረጡ። ሪፖርቱ እንደ ፒዲኤፍ ፋይል ወደ ውጭ ይላካል።',
    },
    'q3h4mvm9': {
      'en': 'Last Week',
      'am': 'ባለፈው ሳምንት',
    },
    'ucwwj8a7': {
      'en': 'Last Month',
      'am': 'ባለፈው ወር',
    },
    '4e4rn3sd': {
      'en': 'Last Year',
      'am': 'ያለፈው ዓመት',
    },
    'fgwtx7rd': {
      'en': 'All Time',
      'am': 'ሁል ጊዜ',
    },
    'kafzk8oz': {
      'en': 'Get Report',
      'am': 'ሪፖርት ያግኙ',
    },
  },
  // Miscellaneous
  {
    'bpjltgor': {
      'en': '',
      'am': '',
    },
    'c6xedstg': {
      'en': '',
      'am': '',
    },
    '8zutrelx': {
      'en': '',
      'am': '',
    },
    'l86md36o': {
      'en': '',
      'am': '',
    },
    '6ng9vyoh': {
      'en': '',
      'am': '',
    },
    'bor7teny': {
      'en': '',
      'am': '',
    },
    '6kyssseq': {
      'en': '',
      'am': '',
    },
    '3iczjlkq': {
      'en': '',
      'am': '',
    },
    '72h93fn8': {
      'en': '',
      'am': '',
    },
    '8pgwex7u': {
      'en': '',
      'am': '',
    },
    'ento81ut': {
      'en': '',
      'am': '',
    },
    't9l2ufwr': {
      'en': '',
      'am': '',
    },
    'bzhwp5gd': {
      'en': '',
      'am': '',
    },
    'vqiaa8lk': {
      'en': '',
      'am': '',
    },
    'tda0paiv': {
      'en': '',
      'am': '',
    },
    'rm79i8f0': {
      'en': '',
      'am': '',
    },
    'zzwr9j8h': {
      'en': '',
      'am': '',
    },
    '2ihoi643': {
      'en': '',
      'am': '',
    },
    'nrneg0c5': {
      'en': '',
      'am': '',
    },
    'grhmx47w': {
      'en': '',
      'am': '',
    },
    'etdkdi92': {
      'en': '',
      'am': '',
    },
    'nu6wmicc': {
      'en': '',
      'am': '',
    },
    's4k6p7b0': {
      'en': '',
      'am': '',
    },
    'k7ezfrb9': {
      'en': '',
      'am': '',
    },
    'r8qeaq90': {
      'en': '',
      'am': '',
    },
    '7jwpu46a': {
      'en': '',
      'am': '',
    },
    'j2rh0dj0': {
      'en': '',
      'am': '',
    },
  },
].reduce((a, b) => a..addAll(b));
