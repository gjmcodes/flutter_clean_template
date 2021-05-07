
[![Clean Flutter Architecture](https://i.imgur.com/Qe2FT1D.jpg)](https://github.com/gjmcodes/flutter_clean_template)


# Clean Architecture
The main purpose of this template is to bring my own view and implementation on top of the Clean Architecture written by Bob Martin. The final goal is to have the project working with fully isolated layers, internationalization (**i18ln**), returning validations from the domain back to the UI, and features implemented in a folder structure which will make it easy to turn into modules in the future.





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

[![Clean Use Case Folder Structure](https://i.imgur.com/hN1JTvC.png)](https://i.imgur.com/29gWhQv.png)

 For this template we have the entity *"Resource"* and an **Use Case** implementation that holds logic and validation to add a new resource, therefore: **AddResourceUseCase**.

The Use Case itself represents the DTO (*Data Transfer Object*) to send a request to its **Handler** which will be responsible for handling all logic such as: validating the entity, calling events in case of success or failure, returning results for its caller.

For every Use Case we have a Handler on top of it. In this template we have a single Handler for context which implements all UseCases logic. This handler is **ResourceUseCaseHandler**.

## Validations

## Returning Validations to the Presentation Layer

## Internationalization

