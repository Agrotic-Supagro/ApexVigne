// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCommentCollection on Isar {
  IsarCollection<Comment> get comments => this.collection();
}

const CommentSchema = CollectionSchema(
  name: r'Comment',
  id: -5579229333153709021,
  properties: {
    r'etat': PropertySchema(
      id: 0,
      name: r'etat',
      type: IsarType.long,
    ),
    r'id_session': PropertySchema(
      id: 1,
      name: r'id_session',
      type: IsarType.string,
    ),
    r'txt_comm': PropertySchema(
      id: 2,
      name: r'txt_comm',
      type: IsarType.string,
    )
  },
  estimateSize: _commentEstimateSize,
  serialize: _commentSerialize,
  deserialize: _commentDeserialize,
  deserializeProp: _commentDeserializeProp,
  idName: r'id_comm',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _commentGetId,
  getLinks: _commentGetLinks,
  attach: _commentAttach,
  version: '3.1.0+1',
);

int _commentEstimateSize(
  Comment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.sessionId.length * 3;
  bytesCount += 3 + object.text.length * 3;
  return bytesCount;
}

void _commentSerialize(
  Comment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.state);
  writer.writeString(offsets[1], object.sessionId);
  writer.writeString(offsets[2], object.text);
}

Comment _commentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Comment();
  object.state = reader.readLong(offsets[0]);
  object.id = id;
  object.sessionId = reader.readString(offsets[1]);
  object.text = reader.readString(offsets[2]);
  return object;
}

P _commentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _commentGetId(Comment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _commentGetLinks(Comment object) {
  return [];
}

void _commentAttach(IsarCollection<dynamic> col, Id id, Comment object) {
  object.id = id;
}

extension CommentQueryWhereSort on QueryBuilder<Comment, Comment, QWhere> {
  QueryBuilder<Comment, Comment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CommentQueryWhere on QueryBuilder<Comment, Comment, QWhereClause> {
  QueryBuilder<Comment, Comment, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Comment, Comment, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Comment, Comment, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Comment, Comment, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Comment, Comment, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CommentQueryFilter
    on QueryBuilder<Comment, Comment, QFilterCondition> {
  QueryBuilder<Comment, Comment, QAfterFilterCondition> stateEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'etat',
        value: value,
      ));
    });
  }

  QueryBuilder<Comment, Comment, QAfterFilterCondition> stateGreaterThan(
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

  QueryBuilder<Comment, Comment, QAfterFilterCondition> stateLessThan(
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

  QueryBuilder<Comment, Comment, QAfterFilterCondition> stateBetween(
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

  QueryBuilder<Comment, Comment, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_comm',
        value: value,
      ));
    });
  }

  QueryBuilder<Comment, Comment, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_comm',
        value: value,
      ));
    });
  }

  QueryBuilder<Comment, Comment, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_comm',
        value: value,
      ));
    });
  }

  QueryBuilder<Comment, Comment, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_comm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Comment, Comment, QAfterFilterCondition> sessionIdEqualTo(
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

  QueryBuilder<Comment, Comment, QAfterFilterCondition> sessionIdGreaterThan(
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

  QueryBuilder<Comment, Comment, QAfterFilterCondition> sessionIdLessThan(
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

  QueryBuilder<Comment, Comment, QAfterFilterCondition> sessionIdBetween(
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

  QueryBuilder<Comment, Comment, QAfterFilterCondition> sessionIdStartsWith(
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

  QueryBuilder<Comment, Comment, QAfterFilterCondition> sessionIdEndsWith(
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

  QueryBuilder<Comment, Comment, QAfterFilterCondition> sessionIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id_session',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Comment, Comment, QAfterFilterCondition> sessionIdMatches(
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

  QueryBuilder<Comment, Comment, QAfterFilterCondition> sessionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_session',
        value: '',
      ));
    });
  }

  QueryBuilder<Comment, Comment, QAfterFilterCondition> sessionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id_session',
        value: '',
      ));
    });
  }

  QueryBuilder<Comment, Comment, QAfterFilterCondition> textEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'txt_comm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Comment, Comment, QAfterFilterCondition> textGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'txt_comm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Comment, Comment, QAfterFilterCondition> textLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'txt_comm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Comment, Comment, QAfterFilterCondition> textBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'txt_comm',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Comment, Comment, QAfterFilterCondition> textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'txt_comm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Comment, Comment, QAfterFilterCondition> textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'txt_comm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Comment, Comment, QAfterFilterCondition> textContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'txt_comm',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Comment, Comment, QAfterFilterCondition> textMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'txt_comm',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Comment, Comment, QAfterFilterCondition> textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'txt_comm',
        value: '',
      ));
    });
  }

  QueryBuilder<Comment, Comment, QAfterFilterCondition> textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'txt_comm',
        value: '',
      ));
    });
  }
}

extension CommentQueryObject
    on QueryBuilder<Comment, Comment, QFilterCondition> {}

extension CommentQueryLinks
    on QueryBuilder<Comment, Comment, QFilterCondition> {}

extension CommentQuerySortBy on QueryBuilder<Comment, Comment, QSortBy> {
  QueryBuilder<Comment, Comment, QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.asc);
    });
  }

  QueryBuilder<Comment, Comment, QAfterSortBy> sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.desc);
    });
  }

  QueryBuilder<Comment, Comment, QAfterSortBy> sortBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_session', Sort.asc);
    });
  }

  QueryBuilder<Comment, Comment, QAfterSortBy> sortBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_session', Sort.desc);
    });
  }

  QueryBuilder<Comment, Comment, QAfterSortBy> sortByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'txt_comm', Sort.asc);
    });
  }

  QueryBuilder<Comment, Comment, QAfterSortBy> sortByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'txt_comm', Sort.desc);
    });
  }
}

extension CommentQuerySortThenBy
    on QueryBuilder<Comment, Comment, QSortThenBy> {
  QueryBuilder<Comment, Comment, QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.asc);
    });
  }

  QueryBuilder<Comment, Comment, QAfterSortBy> thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.desc);
    });
  }

  QueryBuilder<Comment, Comment, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_comm', Sort.asc);
    });
  }

  QueryBuilder<Comment, Comment, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_comm', Sort.desc);
    });
  }

  QueryBuilder<Comment, Comment, QAfterSortBy> thenBySessionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_session', Sort.asc);
    });
  }

  QueryBuilder<Comment, Comment, QAfterSortBy> thenBySessionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_session', Sort.desc);
    });
  }

  QueryBuilder<Comment, Comment, QAfterSortBy> thenByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'txt_comm', Sort.asc);
    });
  }

  QueryBuilder<Comment, Comment, QAfterSortBy> thenByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'txt_comm', Sort.desc);
    });
  }
}

extension CommentQueryWhereDistinct
    on QueryBuilder<Comment, Comment, QDistinct> {
  QueryBuilder<Comment, Comment, QDistinct> distinctByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'etat');
    });
  }

  QueryBuilder<Comment, Comment, QDistinct> distinctBySessionId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_session', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Comment, Comment, QDistinct> distinctByText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'txt_comm', caseSensitive: caseSensitive);
    });
  }
}

extension CommentQueryProperty
    on QueryBuilder<Comment, Comment, QQueryProperty> {
  QueryBuilder<Comment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_comm');
    });
  }

  QueryBuilder<Comment, int, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'etat');
    });
  }

  QueryBuilder<Comment, String, QQueryOperations> sessionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_session');
    });
  }

  QueryBuilder<Comment, String, QQueryOperations> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'txt_comm');
    });
  }
}
