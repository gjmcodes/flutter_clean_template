# Disclaimer
Currently this project uses BloC and Provider. As work in progress it's intended to implement Internationalization (i18n).

# Clean Architecture
The main purpose of this template is to bring my own view and implementation on top of the [Clean Architecture written by Bob Martin](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html). The final goal is to have the project working with fully isolated layers, internationalization (**i18ln**), returning validations from the domain back to the UI, and features implemented in a folder structure which will make it easy to turn into modules in the future. 

[![Clean Flutter Architecture](https://i.imgur.com/aPBJQP4.jpg)](https://github.com/gjmcodes/flutter_clean_template)




[![Clean Architecture Folder Structure](https://i.imgur.com/hN1JTvC.png)](https://github.com/gjmcodes/flutter_clean_template)



## Core
The whole application has a major layer named **core** which responsabilities are to declare abstract objects, shared and common implementations from *base classes* to common widgets.

- blocs
- operations
- use_cases
- validations
- widgets

Each feature will replicate the same folder structure which consists of:
- blocs
- domain
- infra
- ui

## Domain
The domain layer is responsible for holding business logic through entities and use cases. Therefore it's the layer responsible for telling how an application must work accordingly with it's business rules and known objects. This layer **must not** have any reference of objects that are related to other feature layers such as ui, infra nor blocs. It may declare abstract classes (or interfaces for those coming from TypeScript or C#) that will be implemented in any other layer. In other words, the Domain Layer **cannot depend** on any other layer apart from shared objects in the core that will help to compose the domain.

## Entities
## Infra
## Presenters
## UI



## Use Cases
Use Cases are responsible to contain application and business validation for a specific request/flow.

For Use Cases implementation I decided to use 4 different objects to deal with the use case workflow.

- **Use Case Model**: Working as a DTO for a specific Use Case.
- **Use Case Request**: An abstract class which enforces how an Use Case must be implemented in a Handler
- **Use Case Handler**: A class which will work as the orchestrator of the use case. It's responsability is to call any required entity from the domain model and return to it's caller whether the Use Case Model sent is valid or not.
- **Use Case Response**: Another DTO which will be returned to the Use Case Handler caller with information that tells whether the data sent was valid or not.

[![Clean Use Case Folder Structure](https://i.imgur.com/29gWhQv.png)](https://github.com/gjmcodes/flutter_clean_template)

 For this template we have the entity *"Resource"* and an **Use Case** implementation that holds logic and validation to add a new resource, therefore: **AddResourceUseCase**.

The Use Case itself represents the DTO (*Data Transfer Object*) to send a request to its **Handler** which will be responsible for handling all logic such as: validating the entity, calling events in case of success or failure, returning results for its caller.

For every Use Case we have a Handler on top of it. In this template we have a single Handler for context which implements all UseCases logic. This handler is **ResourceUseCaseHandler**.

## Validations
For validations we're using the **specifications** pattern which will be called by entities accordingly to exposed functions for specific flows/validations. A specification is composed by multiple business rules that can be reused by several specifications with different validation responsabilities.

In our case we have the **new_resource.specification.dart** file which groups all business rules to validate whether a new resource can be created or not.

[![Business Rules and Validations](https://i.imgur.com/jmq2snP.png)](https://github.com/gjmcodes/flutter_clean_template)


## Returning Validations to the Presentation Layer
To reveal a validation message for a field we must extend a BloC specific for forms that inherits *"BaseFormBloc"*. Once extending this class, its implementation will required an override of the function *"setValidations()"*

[![Returning Validations](https://i.imgur.com/duFd9MI.png)](https://github.com/gjmcodes/flutter_clean_template)

In the Resources example above we can see we're providing a value for a Map of the type *Map<String, StreamController<String>>*. The key to this Map is the located in the constants file at the root of our feature domain folder.
 
 [![Domain Constants](https://i.imgur.com/VJJbSh3.png)](https://github.com/gjmcodes/flutter_clean_template)

This same Key is also used as the Key to return our Business Validation mentioned in the previous topic.

[![Domain Constants](https://i.imgur.com/erlaNUv.png)](https://github.com/gjmcodes/flutter_clean_template)

Both Map and validations will know each other through their common keys. At the implementation of our BaseFormBloc we can call the function *addValidations* in case a Validation Result returns invalid from an Use Case Handler.

[![Domain Constants](https://i.imgur.com/erlaNUv.png)](https://github.com/gjmcodes/flutter_clean_template)

Once triggered, the stream will send the message to our *FormTextInput* which *must* be listening to streams defined to our BaseFormBloc implementations streams.

[![Domain Constants](https://i.imgur.com/Sg4FCj5.png)](https://github.com/gjmcodes/flutter_clean_template)


## Internationalization
*Work in Progress*

