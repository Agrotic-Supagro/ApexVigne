// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSessionCollection on Isar {
  IsarCollection<Session> get sessions => this.collection();
}

const SessionSchema = CollectionSchema(
  name: r'Session',
  id: 4817823809690647594,
  properties: {
    r'apex0': PropertySchema(
      id: 0,
      name: r'apex0',
      type: IsarType.string,
    ),
    r'apex1': PropertySchema(
      id: 1,
      name: r'apex1',
      type: IsarType.string,
    ),
    r'apex2': PropertySchema(
      id: 2,
      name: r'apex2',
      type: IsarType.string,
    ),
    r'date_creation': PropertySchema(
      id: 3,
      name: r'date_creation',
      type: IsarType.string,
    ),
    r'date_maj': PropertySchema(
      id: 4,
      name: r'date_maj',
      type: IsarType.string,
    ),
    r'date_session': PropertySchema(
      id: 5,
      name: r'date_session',
      type: IsarType.string,
    ),
    r'etat': PropertySchema(
      id: 6,
      name: r'etat',
      type: IsarType.string,
    ),
    r'id_observateur': PropertySchema(
      id: 7,
      name: r'id_observateur',
      type: IsarType.string,
    ),
    r'id_parcelle': PropertySchema(
      id: 8,
      name: r'id_parcelle',
      type: IsarType.string,
    ),
    r'id_session': PropertySchema(
      id: 9,
      name: r'id_session',
      type: IsarType.string,
    )
  },
  estimateSize: _sessionEstimateSize,
  serialize: _sessionSerialize,
  deserialize: _sessionDeserialize,
  deserializeProp: _sessionDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'id_session': IndexSchema(
      id: 6487517710359500948,
      name: r'id_session',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'id_session',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _sessionGetId,
  getLinks: _sessionGetLinks,
  attach: _sessionAttach,
  version: '3.1.0+1',
);

int _sessionEstimateSize(
  Session object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.apex0.length * 3;
  bytesCount += 3 + object.apex1.length * 3;
  bytesCount += 3 + object.apex2.length * 3;
  bytesCount += 3 + object.creationDate.length * 3;
  bytesCount += 3 + object.updateDate.length * 3;
  bytesCount += 3 + object.sessionDate.length * 3;
  bytesCount += 3 + object.state.length * 3;
  bytesCount += 3 + object.observerId.length * 3;
  bytesCount += 3 + object.parcelId.length * 3;
  bytesCount += 3 + object.id.length * 3;
  return bytesCount;
}

void _sessionSerialize(
  Session object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.apex0);
  writer.writeString(offsets[1], object.apex1);
  writer.writeString(offsets[2], object.apex2);
  writer.writeString(offsets[3], object.creationDate);
  writer.writeString(offsets[4], object.updateDate);
  writer.writeString(offsets[5], object.sessionDate);
  writer.writeString(offsets[6], object.state);
  writer.writeString(offsets[7], object.observerId);
  writer.writeString(offsets[8], object.parcelId);
  writer.writeString(offsets[9], object.id);
}

Session _sessionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Session();
  object.apex0 = reader.readString(offsets[0]);
  object.apex1 = reader.readString(offsets[1]);
  object.apex2 = reader.readString(offsets[2]);
  object.creationDate = reader.readString(offsets[3]);
  object.updateDate = reader.readString(offsets[4]);
  object.sessionDate = reader.readString(offsets[5]);
  object.state = reader.readString(offsets[6]);
  object.observerId = reader.readString(offsets[7]);
  object.parcelId = reader.readString(offsets[8]);
  object.id = reader.readString(offsets[9]);
  return object;
}

P _sessionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sessionGetId(Session object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _sessionGetLinks(Session object) {
  return [];
}

void _sessionAttach(IsarCollection<dynamic> col, Id id, Session object) {}

extension SessionByIndex on IsarCollection<Session> {
  Future<Session?> getById(String id) {
    return getByIndex(r'id_session', [id]);
  }

  Session? getByIdSync(String id) {
    return getByIndexSync(r'id_session', [id]);
  }

  Future<bool> deleteById(String id) {
    return deleteByIndex(r'id_session', [id]);
  }

  bool deleteByIdSync(String id) {
    return deleteByIndexSync(r'id_session', [id]);
  }

  Future<List<Session?>> getAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndex(r'id_session', values);
  }

  List<Session?> getAllByIdSync(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'id_session', values);
  }

  Future<int> deleteAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'id_session', values);
  }

  int deleteAllByIdSync(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'id_session', values);
  }

  Future<Id> putById(Session object) {
    return putByIndex(r'id_session', object);
  }

  Id putByIdSync(Session object, {bool saveLinks = true}) {
    return putByIndexSync(r'id_session', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllById(List<Session> objects) {
    return putAllByIndex(r'id_session', objects);
  }

  List<Id> putAllByIdSync(List<Session> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'id_session', objects, saveLinks: saveLinks);
  }
}

extension SessionQueryWhereSort on QueryBuilder<Session, Session, QWhere> {
  QueryBuilder<Session, Session, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SessionQueryWhere on QueryBuilder<Session, Session, QWhereClause> {
  QueryBuilder<Session, Session, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Session, Session, QAfterWhereClause> isarIdGreaterThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Session, Session, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Session, Session, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterWhereClause> idEqualTo(String id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'id_session',
        value: [id],
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterWhereClause> idNotEqualTo(String id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id_session',
              lower: [],
              upper: [id],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id_session',
              lower: [id],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id_session',
              lower: [id],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id_session',
              lower: [],
              upper: [id],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SessionQueryFilter
    on QueryBuilder<Session, Session, QFilterCondition> {
  QueryBuilder<Session, Session, QAfterFilterCondition> apex0EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apex0',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex0GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apex0',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex0LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apex0',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex0Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apex0',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex0StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'apex0',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex0EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'apex0',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex0Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'apex0',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex0Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'apex0',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex0IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apex0',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex0IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'apex0',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex1EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apex1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex1GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apex1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex1LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apex1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex1Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apex1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'apex1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'apex1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex1Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'apex1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'apex1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apex1',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'apex1',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex2EqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apex2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex2GreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apex2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex2LessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apex2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex2Between(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apex2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'apex2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'apex2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex2Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'apex2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex2Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'apex2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apex2',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> apex2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'apex2',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> creationDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date_creation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> creationDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date_creation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> creationDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date_creation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> creationDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date_creation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> creationDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date_creation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> creationDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date_creation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> creationDateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date_creation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> creationDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date_creation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> creationDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date_creation',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition>
      creationDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date_creation',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> updateDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date_maj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> updateDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date_maj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> updateDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date_maj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> updateDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date_maj',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> updateDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date_maj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> updateDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date_maj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> updateDateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date_maj',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> updateDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date_maj',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> updateDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date_maj',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> updateDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date_maj',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> sessionDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date_session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> sessionDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date_session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> sessionDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date_session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> sessionDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date_session',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> sessionDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'date_session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> sessionDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'date_session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> sessionDateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'date_session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> sessionDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'date_session',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> sessionDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date_session',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition>
      sessionDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date_session',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> stateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'etat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> stateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'etat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> stateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'etat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> stateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'etat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> stateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'etat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> stateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'etat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> stateContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'etat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> stateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'etat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> stateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'etat',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> stateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'etat',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> observerIdEqualTo(
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

  QueryBuilder<Session, Session, QAfterFilterCondition> observerIdGreaterThan(
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

  QueryBuilder<Session, Session, QAfterFilterCondition> observerIdLessThan(
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

  QueryBuilder<Session, Session, QAfterFilterCondition> observerIdBetween(
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

  QueryBuilder<Session, Session, QAfterFilterCondition> observerIdStartsWith(
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

  QueryBuilder<Session, Session, QAfterFilterCondition> observerIdEndsWith(
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

  QueryBuilder<Session, Session, QAfterFilterCondition> observerIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id_observateur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> observerIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id_observateur',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> observerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_observateur',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> observerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id_observateur',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> parcelIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_parcelle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> parcelIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_parcelle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> parcelIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_parcelle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> parcelIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_parcelle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> parcelIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id_parcelle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> parcelIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id_parcelle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> parcelIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id_parcelle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> parcelIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id_parcelle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> parcelIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_parcelle',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> parcelIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id_parcelle',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<Session, Session, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Session, Session, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Session, Session, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Session, Session, QAfterFilterCondition> idStartsWith(
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

  QueryBuilder<Session, Session, QAfterFilterCondition> idEndsWith(
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

  QueryBuilder<Session, Session, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id_session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id_session',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_session',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id_session',
        value: '',
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Session, Session, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SessionQueryObject
    on QueryBuilder<Session, Session, QFilterCondition> {}

extension SessionQueryLinks
    on QueryBuilder<Session, Session, QFilterCondition> {}

extension SessionQuerySortBy on QueryBuilder<Session, Session, QSortBy> {
  QueryBuilder<Session, Session, QAfterSortBy> sortByApex0() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apex0', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortByApex0Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apex0', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortByApex1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apex1', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortByApex1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apex1', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortByApex2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apex2', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortByApex2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apex2', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_creation', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortByCreationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_creation', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortByUpdateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_maj', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortByUpdateDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_maj', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortBySessionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_session', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortBySessionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_session', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortByObserverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_observateur', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortByObserverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_observateur', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortByParcelId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_parcelle', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortByParcelIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_parcelle', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_session', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_session', Sort.desc);
    });
  }
}

extension SessionQuerySortThenBy
    on QueryBuilder<Session, Session, QSortThenBy> {
  QueryBuilder<Session, Session, QAfterSortBy> thenByApex0() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apex0', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenByApex0Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apex0', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenByApex1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apex1', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenByApex1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apex1', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenByApex2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apex2', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenByApex2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apex2', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_creation', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenByCreationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_creation', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenByUpdateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_maj', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenByUpdateDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_maj', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenBySessionDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_session', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenBySessionDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_session', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenByObserverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_observateur', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenByObserverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_observateur', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenByParcelId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_parcelle', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenByParcelIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_parcelle', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_session', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_session', Sort.desc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<Session, Session, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }
}

extension SessionQueryWhereDistinct
    on QueryBuilder<Session, Session, QDistinct> {
  QueryBuilder<Session, Session, QDistinct> distinctByApex0(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apex0', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Session, Session, QDistinct> distinctByApex1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apex1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Session, Session, QDistinct> distinctByApex2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apex2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Session, Session, QDistinct> distinctByCreationDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date_creation',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Session, Session, QDistinct> distinctByUpdateDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date_maj', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Session, Session, QDistinct> distinctBySessionDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date_session', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Session, Session, QDistinct> distinctByState(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'etat', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Session, Session, QDistinct> distinctByObserverId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_observateur',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Session, Session, QDistinct> distinctByParcelId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_parcelle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Session, Session, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_session', caseSensitive: caseSensitive);
    });
  }
}

extension SessionQueryProperty
    on QueryBuilder<Session, Session, QQueryProperty> {
  QueryBuilder<Session, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<Session, String, QQueryOperations> apex0Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apex0');
    });
  }

  QueryBuilder<Session, String, QQueryOperations> apex1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apex1');
    });
  }

  QueryBuilder<Session, String, QQueryOperations> apex2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apex2');
    });
  }

  QueryBuilder<Session, String, QQueryOperations> creationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date_creation');
    });
  }

  QueryBuilder<Session, String, QQueryOperations> updateDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date_maj');
    });
  }

  QueryBuilder<Session, String, QQueryOperations> sessionDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date_session');
    });
  }

  QueryBuilder<Session, String, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'etat');
    });
  }

  QueryBuilder<Session, String, QQueryOperations> observerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_observateur');
    });
  }

  QueryBuilder<Session, String, QQueryOperations> parcelIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_parcelle');
    });
  }

  QueryBuilder<Session, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_session');
    });
  }
}
