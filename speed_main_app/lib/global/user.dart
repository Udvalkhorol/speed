class User {
  String id;
  static User _instance;

  factory User() {
    _instance ??= User._internal();
    return _instance;
  }

  User._internal() {
    _init();
  }

  //#endregion

  //#region [ properties ]

  //#region [ domain ]
  /// by login response
  String session;
  String custCode;
  String credStatus;
  int expireTimeout;
  String mobile;

  //#endregion

  String pin;
  bool allowBioAuth;
  bool secureMode = true;
  bool loggedIn = false;

  String get_pin_cache() {
    //todo on production comment this below
    // return gSP.getString(ConstSPKey.cPin) ?? '';
  }

  //#endregion

  //#region [ methods ]
  void _init() {
    /// init mobile
    // mobile = get_mobile_cache();

    /// init pin
    // todo coment this code on production
    pin = get_pin_cache();
  }

  /// loggedIn
  // bool isSignedIn() => (session) != null && loggedIn;
  //
  // /// update user data after login success
  // void update(String pmobile, String ppin, bool prememberMe, int pfingerPrintFlag, bool isAgent) {
  //   if (isAgent) {
  //     set_agent_mobile_cache(pmobile);
  //     session = obj.session;
  //     apiHelper.sessionId = session;
  //   } else {
  //     var isMobileChanged = get_mobile_cache() != pmobile;
  //     if (isMobileChanged) {
  //       clearCache();
  //     }
  //     log!.d('set_mobile_cache($pmobile) called ');
  //     set_mobile_cache(pmobile!);
  //     set_pin_cache(ppin);
  //     set_rememberMe_cache(prememberMe);
  //     // }
  //
  //     mobile = pmobile;
  //     pin = ppin;
  //     rememberMe = prememberMe;
  //
  //     session = obj.session;
  //     apiHelper.sessionId = session;
  //
  //     custCode = obj.custCode;
  //     lastAccessDate = obj.lastAccessDate;
  //     isBiometricLogin = obj.isBiometricLogin;
  //     credStatus = obj.credStatus;
  //     expireTimeout = obj.expireTimeout;
  //   }
  // }

  void clear() {
    /// clear cust data

    session = '';
    custCode = '';
    credStatus = '';
    expireTimeout = 0;

    /// internal members can change

    pin = '';
    loggedIn = false;
  }

  void clearCache() {
    clear();
    mobile = '';
  }
}
