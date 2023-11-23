// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observation.collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetObservationCollection on Isar {
  IsarCollection<Observation> get observations => this.collection();
}

const ObservationSchema = CollectionSchema(
  name: r'Observation',
  id: 7013591097600907058,
  properties: {
    r'apex_value': PropertySchema(
      id: 0,
      name: r'apex_value',
      type: IsarType.long,
    ),
    r'etat': PropertySchema(
      id: 1,
      name: r'etat',
      type: IsarType.long,
    ),
    r'id_observateur': PropertySchema(
      id: 2,
      name: r'id_observateur',
      type: IsarType.string,
    ),
    r'id_session': PropertySchema(
      id: 3,
      name: r'id_session',
      type: IsarType.string,
    ),
    r'latitude': PropertySchema(
      id: 4,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'longitude': PropertySchema(
      id: 5,
      name: r'longitude',
      type: IsarType.double,
    )
  },
  estimateSize: _observationEstimateSize,
  serialize: _observationSerialize,
  deserialize: _observationDeserialize,
  deserializeProp: _observationDeserializeProp,
  idName: r'id_observation',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _observationGetId,
  getLinks: _observationGetLinks,
  attach: _observationAttach,
  version: '3.1.0+1',
);

int _observationEstimateSize(
  Observation object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.observerId.length * 3;
  bytesCount += 3 + object.sessionId.length * 3;
  return bytesCount;
}

void _observationSerialize(
  Observation object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.apexValue);
  writer.writeLong(offsets[1], object.state);
  writer.writeString(offsets[2], object.observerId);
  writer.writeString(offsets[3], object.sessionId);
  writer.writeDouble(offsets[4], object.latitude);
  writer.writeDouble(offsets[5], object.longitude);
}

Observation _observationDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Observation();
  object.apexValue = reader.readLong(offsets[0]);
  object.state = reader.readLong(offsets[1]);
  object.observerId = reader.readString(offsets[2]);
  object.observationId = id;
  object.sessionId = reader.readString(offsets[3]);
  object.latitude = reader.readDouble(offsets[4]);
  object.longitude = reader.readDouble(offsets[5]);
  return object;
}

P _observationDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _observationGetId(Observation object) {
  return object.observationId;
}

List<IsarLinkBase<dynamic>> _observationGetLinks(Observation object) {
  return [];
}

void _observationAttach(
    IsarCollection<dynamic> col, Id id, Observation object) {
  object.observationId = id;
}

extension ObservationQueryWhereSort
    on QueryBuilder<Observation, Observation, QWhere> {
  QueryBuilder<Observation, Observation, QAfterWhere> anyObservationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ObservationQueryWhere
    on QueryBuilder<Observation, Observation, QWhereClause> {
  QueryBuilder<Observation, Observation, QAfterWhereClause>
      observationIdEqualTo(Id observationId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: observationId,
        upper: observationId,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterWhereClause>
      observationIdNotEqualTo(Id observationId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: observationId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(
                  lower: observationId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(
                  lower: observationId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: observationId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Observation, Observation, QAfterWhereClause>
      observationIdGreaterThan(Id observationId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: observationId, includeLower: include),
      );
    });
  }

  QueryBuilder<Observation, Observation, QAfterWhereClause>
      observationIdLessThan(Id observationId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: observationId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Observation, Observation, QAfterWhereClause>
      observationIdBetween(
    Id lowerObservationId,
    Id upperObservationId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerObservationId,
        includeLower: includeLower,
        upper: upperObservationId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ObservationQueryFilter
    on QueryBuilder<Observation, Observation, QFilterCondition> {
  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      apexValueEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apex_value',
        value: value,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      apexValueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apex_value',
        value: value,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      apexValueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apex_value',
        value: value,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      apexValueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apex_value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition> stateEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'etat',
        value: value,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      stateGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'etat',
        value: value,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition> stateLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'etat',
        value: value,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition> stateBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'etat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      observerIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_observateur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      observerIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_observateur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      observerIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_observateur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      observerIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_observateur',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      observerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id_observateur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      observerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id_observateur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      observerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id_observateur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      observerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id_observateur',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      observerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_observateur',
        value: '',
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      observerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id_observateur',
        value: '',
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      observationIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_observation',
        value: value,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      observationIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_observation',
        value: value,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      observationIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_observation',
        value: value,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      observationIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_observation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      sessionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      sessionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      sessionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      sessionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_session',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      sessionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id_session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      sessionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id_session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      sessionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id_session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      sessionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id_session',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      sessionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_session',
        value: '',
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      sessionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id_session',
        value: '',
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition> latitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      latitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      latitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition> latitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      longitudeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      longitudeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      longitudeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Observation, Observation, QAfterFilterCondition>
      longitudeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ObservationQueryObject
    on QueryBuilder<Observation, Observation, QFilterCondition> {}

extension ObservationQueryLinks
    on QueryBuilder<Observation, Observation, QFilterCondition> {}

extension ObservationQuerySortBy
    on QueryBuilder<Observation, Observation, QSortBy> {
  QueryBuilder<Observation, Observation, QAfterSortBy> sortByApexValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apex_value', Sort.asc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> sortByApexValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apex_value', Sort.desc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.asc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.desc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> sortByObserverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_observateur', Sort.asc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> sortByObserverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_observateur', Sort.desc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> sortBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_session', Sort.asc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> sortBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_session', Sort.desc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }
}

extension ObservationQuerySortThenBy
    on QueryBuilder<Observation, Observation, QSortThenBy> {
  QueryBuilder<Observation, Observation, QAfterSortBy> thenByApexValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apex_value', Sort.asc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> thenByApexValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apex_value', Sort.desc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.asc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.desc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> thenByObserverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_observateur', Sort.asc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> thenByObserverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_observateur', Sort.desc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> thenByObservationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_observation', Sort.asc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy>
      thenByObservationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_observation', Sort.desc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> thenBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_session', Sort.asc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> thenBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_session', Sort.desc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<Observation, Observation, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }
}

extension ObservationQueryWhereDistinct
    on QueryBuilder<Observation, Observation, QDistinct> {
  QueryBuilder<Observation, Observation, QDistinct> distinctByApexValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apex_value');
    });
  }

  QueryBuilder<Observation, Observation, QDistinct> distinctByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'etat');
    });
  }

  QueryBuilder<Observation, Observation, QDistinct> distinctByObserverId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_observateur',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Observation, Observation, QDistinct> distinctBySessionId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_session', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Observation, Observation, QDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<Observation, Observation, QDistinct> distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }
}

extension ObservationQueryProperty
    on QueryBuilder<Observation, Observation, QQueryProperty> {
  QueryBuilder<Observation, int, QQueryOperations> observationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_observation');
    });
  }

  QueryBuilder<Observation, int, QQueryOperations> apexValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apex_value');
    });
  }

  QueryBuilder<Observation, int, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'etat');
    });
  }

  QueryBuilder<Observation, String, QQueryOperations> observerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_observateur');
    });
  }

  QueryBuilder<Observation, String, QQueryOperations> sessionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_session');
    });
  }

  QueryBuilder<Observation, double, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<Observation, double, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }
}
