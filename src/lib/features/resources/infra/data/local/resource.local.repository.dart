import 'package:clean_resources/features/resources/domain/entities/resource.dart';
import 'package:clean_resources/features/resources/domain/repositories/i_resource.local.repository.dart';

class ResourceLocalRepository implements IResourceLocalRepository {
  static int lastId = 0;
  static List<Resource> _resources;
  ResourceLocalRepository() {
    if (_resources == null) _resources = <Resource>[];
  }

  @override
  Future<Resource> addResourceAsync(Resource model) async {
    lastId++;
    model.id = lastId.toString();
    _resources.add(model);

    return model;
  }

  @override
  Future<List<Resource>> getResourcesAsync() async {
    return _resources;
  }
}
