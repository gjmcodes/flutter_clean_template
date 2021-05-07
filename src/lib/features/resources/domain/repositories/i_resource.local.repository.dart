import 'package:clean_resources/features/resources/domain/entities/resource.dart';

abstract class IResourceLocalRepository{
  Future<Resource> addResourceAsync(Resource model);
  Future<List<Resource>> getResourcesAsync();
}