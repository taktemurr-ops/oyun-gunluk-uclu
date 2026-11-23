import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_gunluk_uclu/oyun_gunluk_uclu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(gunlukUcluConfig.title.length, 33);
    expect(gunlukUcluConfig.tagline.length, 33);
    for (final s in gunlukUcluConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(gunlukUcluConfig.gameId, gunlukUcluId);
    expect(gunlukUcluRules.gameId, gunlukUcluId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(gunlukUcluRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: gunlukUcluId, optionalMechanics: gunlukUcluRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(gunlukUcluRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
