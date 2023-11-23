// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parcel.collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetParcelCollection on Isar {
  IsarCollection<Parcel> get parcels => this.collection();
}

const ParcelSchema = CollectionSchema(
  name: r'Parcel',
  id: 5510806458604258610,
  properties: {
    r'date_creation': PropertySchema(
      id: 0,
      name: r'date_creation',
      type: IsarType.string,
    ),
    r'date_maj': PropertySchema(
      id: 1,
      name: r'date_maj',
      type: IsarType.string,
    ),
    r'etat': PropertySchema(
      id: 2,
      name: r'etat',
      type: IsarType.string,
    ),
    r'id_parcelle': PropertySchema(
      id: 3,
      name: r'id_parcelle',
      type: IsarType.string,
    ),
    r'id_proprietaire': PropertySchema(
      id: 4,
      name: r'id_proprietaire',
      type: IsarType.string,
    ),
    r'nom_parcelle': PropertySchema(
      id: 5,
      name: r'nom_parcelle',
      type: IsarType.string,
    )
  },
  estimateSize: _parcelEstimateSize,
  serialize: _parcelSerialize,
  deserialize: _parcelDeserialize,
  deserializeProp: _parcelDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'id_parcelle': IndexSchema(
      id: 3240647825806218078,
      name: r'id_parcelle',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'id_parcelle',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _parcelGetId,
  getLinks: _parcelGetLinks,
  attach: _parcelAttach,
  version: '3.1.0+1',
);

int _parcelEstimateSize(
  Parcel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.creationDate.length * 3;
  bytesCount += 3 + object.updateDate.length * 3;
  bytesCount += 3 + object.state.length * 3;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.ownerId.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _parcelSerialize(
  Parcel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.creationDate);
  writer.writeString(offsets[1], object.updateDate);
  writer.writeString(offsets[2], object.state);
  writer.writeString(offsets[3], object.id);
  writer.writeString(offsets[4], object.ownerId);
  writer.writeString(offsets[5], object.name);
}

Parcel _parcelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Parcel();
  object.creationDate = reader.readString(offsets[0]);
  object.updateDate = reader.readString(offsets[1]);
  object.state = reader.readString(offsets[2]);
  object.id = reader.readString(offsets[3]);
  object.ownerId = reader.readString(offsets[4]);
  object.name = reader.readString(offsets[5]);
  return object;
}

P _parcelDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _parcelGetId(Parcel object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _parcelGetLinks(Parcel object) {
  return [];
}

void _parcelAttach(IsarCollection<dynamic> col, Id id, Parcel object) {}

extension ParcelByIndex on IsarCollection<Parcel> {
  Future<Parcel?> getById(String id) {
    return getByIndex(r'id_parcelle', [id]);
  }

  Parcel? getByIdSync(String id) {
    return getByIndexSync(r'id_parcelle', [id]);
  }

  Future<bool> deleteById(String id) {
    return deleteByIndex(r'id_parcelle', [id]);
  }

  bool deleteByIdSync(String id) {
    return deleteByIndexSync(r'id_parcelle', [id]);
  }

  Future<List<Parcel?>> getAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndex(r'id_parcelle', values);
  }

  List<Parcel?> getAllByIdSync(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'id_parcelle', values);
  }

  Future<int> deleteAllById(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'id_parcelle', values);
  }

  int deleteAllByIdSync(List<String> idValues) {
    final values = idValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'id_parcelle', values);
  }

  Future<Id> putById(Parcel object) {
    return putByIndex(r'id_parcelle', object);
  }

  Id putByIdSync(Parcel object, {bool saveLinks = true}) {
    return putByIndexSync(r'id_parcelle', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllById(List<Parcel> objects) {
    return putAllByIndex(r'id_parcelle', objects);
  }

  List<Id> putAllByIdSync(List<Parcel> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'id_parcelle', objects, saveLinks: saveLinks);
  }
}

extension ParcelQueryWhereSort on QueryBuilder<Parcel, Parcel, QWhere> {
  QueryBuilder<Parcel, Parcel, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ParcelQueryWhere on QueryBuilder<Parcel, Parcel, QWhereClause> {
  QueryBuilder<Parcel, Parcel, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterWhereClause> isarIdNotEqualTo(Id isarId) {
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

  QueryBuilder<Parcel, Parcel, QAfterWhereClause> isarIdGreaterThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterWhereClause> isarIdBetween(
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

  QueryBuilder<Parcel, Parcel, QAfterWhereClause> idEqualTo(String id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'id_parcelle',
        value: [id],
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterWhereClause> idNotEqualTo(String id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id_parcelle',
              lower: [],
              upper: [id],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id_parcelle',
              lower: [id],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id_parcelle',
              lower: [id],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id_parcelle',
              lower: [],
              upper: [id],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ParcelQueryFilter on QueryBuilder<Parcel, Parcel, QFilterCondition> {
  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> creationDateEqualTo(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> creationDateGreaterThan(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> creationDateLessThan(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> creationDateBetween(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> creationDateStartsWith(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> creationDateEndsWith(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> creationDateContains(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> creationDateMatches(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> creationDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date_creation',
        value: '',
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> creationDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date_creation',
        value: '',
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> updateDateEqualTo(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> updateDateGreaterThan(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> updateDateLessThan(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> updateDateBetween(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> updateDateStartsWith(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> updateDateEndsWith(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> updateDateContains(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> updateDateMatches(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> updateDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date_maj',
        value: '',
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> updateDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'date_maj',
        value: '',
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> stateEqualTo(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> stateGreaterThan(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> stateLessThan(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> stateBetween(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> stateStartsWith(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> stateEndsWith(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> stateContains(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> stateMatches(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> stateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'etat',
        value: '',
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> stateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'etat',
        value: '',
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> idStartsWith(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> idEndsWith(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id_parcelle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> idMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id_parcelle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_parcelle',
        value: '',
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id_parcelle',
        value: '',
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> ownerIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_proprietaire',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> ownerIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_proprietaire',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> ownerIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_proprietaire',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> ownerIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_proprietaire',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> ownerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id_proprietaire',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> ownerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id_proprietaire',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> ownerIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id_proprietaire',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> ownerIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id_proprietaire',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> ownerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_proprietaire',
        value: '',
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> ownerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id_proprietaire',
        value: '',
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> isarIdGreaterThan(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nom_parcelle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nom_parcelle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nom_parcelle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nom_parcelle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nom_parcelle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nom_parcelle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nom_parcelle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nom_parcelle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nom_parcelle',
        value: '',
      ));
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nom_parcelle',
        value: '',
      ));
    });
  }
}

extension ParcelQueryObject on QueryBuilder<Parcel, Parcel, QFilterCondition> {}

extension ParcelQueryLinks on QueryBuilder<Parcel, Parcel, QFilterCondition> {}

extension ParcelQuerySortBy on QueryBuilder<Parcel, Parcel, QSortBy> {
  QueryBuilder<Parcel, Parcel, QAfterSortBy> sortByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_creation', Sort.asc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> sortByCreationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_creation', Sort.desc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> sortByUpdateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_maj', Sort.asc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> sortByUpdateDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_maj', Sort.desc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.asc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.desc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_parcelle', Sort.asc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_parcelle', Sort.desc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> sortByOwnerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_proprietaire', Sort.asc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> sortByOwnerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_proprietaire', Sort.desc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom_parcelle', Sort.asc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom_parcelle', Sort.desc);
    });
  }
}

extension ParcelQuerySortThenBy on QueryBuilder<Parcel, Parcel, QSortThenBy> {
  QueryBuilder<Parcel, Parcel, QAfterSortBy> thenByCreationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_creation', Sort.asc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> thenByCreationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_creation', Sort.desc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> thenByUpdateDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_maj', Sort.asc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> thenByUpdateDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date_maj', Sort.desc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.asc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.desc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_parcelle', Sort.asc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_parcelle', Sort.desc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> thenByOwnerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_proprietaire', Sort.asc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> thenByOwnerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_proprietaire', Sort.desc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom_parcelle', Sort.asc);
    });
  }

  QueryBuilder<Parcel, Parcel, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nom_parcelle', Sort.desc);
    });
  }
}

extension ParcelQueryWhereDistinct on QueryBuilder<Parcel, Parcel, QDistinct> {
  QueryBuilder<Parcel, Parcel, QDistinct> distinctByCreationDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date_creation',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Parcel, Parcel, QDistinct> distinctByUpdateDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date_maj', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Parcel, Parcel, QDistinct> distinctByState(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'etat', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Parcel, Parcel, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_parcelle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Parcel, Parcel, QDistinct> distinctByOwnerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_proprietaire',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Parcel, Parcel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nom_parcelle', caseSensitive: caseSensitive);
    });
  }
}

extension ParcelQueryProperty on QueryBuilder<Parcel, Parcel, QQueryProperty> {
  QueryBuilder<Parcel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<Parcel, String, QQueryOperations> creationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date_creation');
    });
  }

  QueryBuilder<Parcel, String, QQueryOperations> updateDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date_maj');
    });
  }

  QueryBuilder<Parcel, String, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'etat');
    });
  }

  QueryBuilder<Parcel, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_parcelle');
    });
  }

  QueryBuilder<Parcel, String, QQueryOperations> ownerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_proprietaire');
    });
  }

  QueryBuilder<Parcel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nom_parcelle');
    });
  }
}
