// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };

// **************************************************************************
// RepositoryGenerator
// **************************************************************************

// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, non_constant_identifier_names

mixin $UserLocalAdapter on LocalAdapter<User> {
  @override
  Map<String, Map<String, Object>> relationshipsFor([User model]) => {};

  @override
  User deserialize(map) {
    for (final key in relationshipsFor().keys) {
      map[key] = {
        '_': [map[key], !map.containsKey(key)],
      };
    }
    return _$UserFromJson(map);
  }

  @override
  Map<String, dynamic> serialize(model) => _$UserToJson(model);
}

// ignore: must_be_immutable
class $UserHiveLocalAdapter = HiveLocalAdapter<User> with $UserLocalAdapter;

class $UserRemoteAdapter = RemoteAdapter<User> with JSONServerAdapter<User>;

//

final userLocalAdapterProvider = RiverpodAlias.provider<LocalAdapter<User>>(
    (ref) => $UserHiveLocalAdapter(
        ref.read(hiveLocalStorageProvider), ref.read(graphProvider)));

final userRemoteAdapterProvider = RiverpodAlias.provider<RemoteAdapter<User>>(
    (ref) => $UserRemoteAdapter(ref.read(userLocalAdapterProvider)));

final userRepositoryProvider =
    RiverpodAlias.provider<Repository<User>>((ref) => Repository<User>(ref));

extension UserX on User {
  /// Initializes "fresh" models (i.e. manually instantiated) to use
  /// [save], [delete] and so on.
  ///
  /// Pass:
  ///  - A `BuildContext` if using Flutter with Riverpod or Provider
  ///  - Nothing if using Flutter with GetIt
  ///  - A Riverpod `ProviderContainer` if using pure Dart
  ///  - Its own [Repository<User>]
  User init([container]) {
    final repository = container is Repository<User>
        ? container
        : internalLocatorFn(userRepositoryProvider, container);
    return repository.internalAdapter.initializeModel(this, save: true) as User;
  }
}
