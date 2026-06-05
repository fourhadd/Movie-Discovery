// features/profile/data/datasources/profile_local_data_source.dart
import 'package:get_storage/get_storage.dart';
import '../models/followed_actor_model.dart';

abstract class ProfileLocalDataSource {
  List<FollowedActorModel> getFollowedActors();
  bool toggleFollowActor(FollowedActorModel actor);
  bool isActorFollowed(int actorId);
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  late final GetStorage _storage;
  static const String _storageKey = 'followed_actors_list';

  final List<FollowedActorModel> _followedActors = [];

  ProfileLocalDataSourceImpl() {
    _storage = GetStorage();
    _loadFromStorage();
  }

  void _loadFromStorage() {
    final rawData = _storage.read<List<dynamic>>(_storageKey);
    if (rawData != null) {
      _followedActors.clear();
      for (var item in rawData) {
        _followedActors.add(
          FollowedActorModel.fromJson(Map<String, dynamic>.from(item)),
        );
      }
    }
  }

  void _saveToStorage() {
    final dataToWrite = _followedActors.map((e) => e.toJson()).toList();
    _storage.write(_storageKey, dataToWrite);
  }

  @override
  List<FollowedActorModel> getFollowedActors() => _followedActors;

  @override
  bool toggleFollowActor(FollowedActorModel actor) {
    final index = _followedActors.indexWhere((a) => a.id == actor.id);
    bool isFollowed;

    if (index >= 0) {
      _followedActors.removeAt(index);
      isFollowed = false;
    } else {
      _followedActors.add(actor);
      isFollowed = true;
    }

    _saveToStorage();
    return isFollowed;
  }

  @override
  bool isActorFollowed(int actorId) {
    return _followedActors.any((a) => a.id == actorId);
  }
}
