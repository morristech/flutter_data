import 'package:flutter_data/flutter_data.dart';
import 'package:test/test.dart';

import '_support/person.dart';

void main() async {
  test('getType', () {
    expect(DataHelpers.getType(), isNull);
    expect(DataHelpers.getType<Person>(), 'people');
    expect(DataHelpers.getType('Family'), 'families');
    // `type` argument takes precedence
    expect(DataHelpers.getType<Person>('animal'), 'animals');
  });

  test('generateKey', () {
    expect(DataHelpers.generateKey<Person>(), isNotNull);
    expect(DataHelpers.generateKey('robots'), isNotNull);
    expect(DataHelpers.generateKey(), isNull);
  });

  test('string utils', () {
    expect('family'.capitalize(), 'Family');
    expect('people'.singularize(), 'person');
    expect('zebra'.pluralize(), 'zebras');
  });

  test('repo init args', () {
    final args = RepositoryInitializerArgs(false, true, () async {});
    expect(args.remote, false);
    expect(args.verbose, true);
    expect(args.alsoAwait, isNotNull);
    expect(RepositoryInitializerArgs(false, true, null),
        equals(RepositoryInitializerArgs(false, true, null)));
  });
}