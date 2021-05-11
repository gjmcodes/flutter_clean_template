import 'package:clean_resources/features/resources/domain/entities/resource.dart';
import 'package:clean_resources/features/resources/ui/blocs/resources.bloc.dart';
import 'package:clean_resources/features/resources/ui/mobile/pages/resource_create.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ResourcesIndex extends StatefulWidget {
  @override
  _ResourcesIndexState createState() => _ResourcesIndexState();
}

class _ResourcesIndexState extends State<ResourcesIndex> {
  ResourcesBloc bloc;
  var resources = <Resource>[];

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<ResourcesBloc>(context);
    this.resources = bloc.get();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (ctx) => ResourceCreate(bloc)));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(child: const Text('ALOU?')),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: resources.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text(resources[index].name));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
