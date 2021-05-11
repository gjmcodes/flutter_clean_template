import 'package:clean_resources/features/resources/domain/entities/resource.dart';
import 'package:flutter/widgets.dart';

class ResourcesBloc extends ChangeNotifier {
  List<Resource> _resources = <Resource>[];

  List<Resource> get() {
    return _resources;
  }

  void add(Resource resource) {
    _resources.add(resource);

    notifyListeners();
  }
}
