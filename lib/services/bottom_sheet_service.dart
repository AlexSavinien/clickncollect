import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';

final bottomSheetProvider = Provider<BottomSheetService>((ref) {
  return BottomSheetService();
});
