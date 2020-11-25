import 'package:clickncollect_app/ui/views/customer/customer_profile/customer_profile_view.dart';
import 'package:clickncollect_app/ui/views/shop/shops_list/shops_list_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

final indexTrackingProvider = ChangeNotifierProvider<IndexTracking>((ref) {
  return IndexTracking();
});

class IndexTracking extends ChangeNotifier {}
