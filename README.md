# Clean Architecture

## Core

## Domain

## Infra

## UI

## Entities

## Use Cases

Use Cases are responsible do contain application and business validation for a specific request/flow. For this template we have the entity *"Resource"* and an **Use Case** implementation that holds logic and validation to add a new resource, therefore: **AddResourceUseCase**.

The Use Case itself represents the DTO (*Data Transfer Object*) to send a request to its **Handler** which will be responsible for handling all logic such as: validating the entity, calling events in case of success or failure, returning results for its caller.

For every Use Case we have a Handler on top of it. In this template we have a single Handler for context which implements all UseCases logic. This handler is **ResourceUseCaseHandler**.

## Validations

## Returning Validations to the Presentation Layer

## Internationalization

