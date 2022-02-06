import 'package:equatable/equatable.dart';

class SpeciesEntity extends Equatable {
  const SpeciesEntity(this.count, this.next, this.previous, this.results);

  final int? count;
  final String? next;
  final String? previous;
  final List<SpeciesResultEntity>? results;

  bool isLast(int previouslyFetchedItems) {
    final newItems = results?.length ?? 0;
    final totalItems = newItems + previouslyFetchedItems;

    return count == totalItems;
  }

  @override
  List<Object?> get props => [count, next, previous, results];
}

class SpeciesResultEntity extends Equatable {
  const SpeciesResultEntity(
      this.name,
      this.classification,
      this.designation,
      this.averageHeight,
      this.skinColors,
      this.hairColors,
      this.eyeColors,
      this.averageLifespan,
      this.homeworld,
      this.language,
      this.people,
      this.films,
      this.created,
      this.edited,
      this.url);

  final String? name;
  final String? classification;
  final String? designation;
  final String? averageHeight;
  final String? skinColors;
  final String? hairColors;
  final String? eyeColors;
  final String? averageLifespan;
  final String? homeworld;
  final String? language;
  final List<String>? people;
  final List<String>? films;
  final String? created;
  final String? edited;
  final String? url;

  @override
  List<Object?> get props => [
        name,
        classification,
        designation,
        averageHeight,
        skinColors,
        hairColors,
        eyeColors,
        averageLifespan,
        homeworld,
        language,
        people,
        films,
        created,
        edited,
        url
      ];
}
