import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../example/examples/few_styling_example.dart';
import '../helpers/run_golden_tests.dart';
import '../helpers/test_variants.dart';
import '../helpers/widget_tester_utils.dart';

void main() {
  runGoldenTests(
    'Few Styling Example',
    (WidgetTester tester, ViewVariant variant) async {
      // GIVEN
      await tester.pumpWidget(const MyApp());
      await tester.precacheImages();

      // THEN
      await expectLater(
        find.byType(MyApp),
        matchesGoldenFile('goldens/few_styling_example/${variant.name}_closed_menu.png'),
      );

      // GIVEN
      final Finder dropdown = find.byType(DropdownButton2<String>);
      await tester.tap(dropdown);
      await tester.pumpAndSettle();

      // THEN
      await expectLater(
        find.byType(MyApp),
        matchesGoldenFile('goldens/few_styling_example/${variant.name}_open_menu.png'),
      );
    },
  );
}
