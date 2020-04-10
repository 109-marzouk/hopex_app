import 'package:flutter/material.dart';
import 'package:hopex_progx/app_localizations.dart';
import 'package:hopex_progx/responsive/screen_type_layout.dart';
import 'package:hopex_progx/views/trades/trades_mobile.dart';
import 'package:hopex_progx/views/trades/trades_tablet.dart';

import '../page_handler/page_handler_mobile.dart';
import '../page_handler/page_handler_tablet.dart';

class Trades extends StatefulWidget {
  Trades({Key key}) : super(key: key);

  @override
  _TradesState createState() => _TradesState();
}

class _TradesState extends State<Trades> {
  @override
  Widget build(BuildContext context) {
    final String pageTitle = AppLocalizations.of(context).translate("trades");
    return ScreenTypeLayout(
      mobile: PageHandlerMobile(pageTitle: pageTitle, pageHandlerMobileContent: TradesMobile(),),
      tablet: PageHandlerTablet(pageHandlerTabletContent: TradesTablet()),
      desktop: PageHandlerTablet(pageHandlerTabletContent: TradesTablet()),
    );
  }
}
