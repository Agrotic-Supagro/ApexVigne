// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info.collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDeviceInfoCollection on Isar {
  IsarCollection<DeviceInfo> get deviceInfos => this.collection();
}

const DeviceInfoSchema = CollectionSchema(
  name: r'DeviceInfo',
  id: -3088968630949246988,
  properties: {
    r'device_manufacturer': PropertySchema(
      id: 0,
      name: r'device_manufacturer',
      type: IsarType.string,
    ),
    r'device_model': PropertySchema(
      id: 1,
      name: r'device_model',
      type: IsarType.string,
    ),
    r'device_platform': PropertySchema(
      id: 2,
      name: r'device_platform',
      type: IsarType.string,
    ),
    r'device_serial': PropertySchema(
      id: 3,
      name: r'device_serial',
      type: IsarType.string,
    ),
    r'device_uuid': PropertySchema(
      id: 4,
      name: r'device_uuid',
      type: IsarType.string,
    ),
    r'device_version': PropertySchema(
      id: 5,
      name: r'device_version',
      type: IsarType.string,
    ),
    r'etat': PropertySchema(
      id: 6,
      name: r'etat',
      type: IsarType.long,
    ),
    r'id_utilisateur': PropertySchema(
      id: 7,
      name: r'id_utilisateur',
      type: IsarType.string,
    )
  },
  estimateSize: _deviceInfoEstimateSize,
  serialize: _deviceInfoSerialize,
  deserialize: _deviceInfoDeserialize,
  deserializeProp: _deviceInfoDeserializeProp,
  idName: r'id_config',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _deviceInfoGetId,
  getLinks: _deviceInfoGetLinks,
  attach: _deviceInfoAttach,
  version: '3.1.0+1',
);

int _deviceInfoEstimateSize(
  DeviceInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceManufacturer.length * 3;
  bytesCount += 3 + object.deviceModel.length * 3;
  bytesCount += 3 + object.devicePlatform.length * 3;
  bytesCount += 3 + object.deviceSerial.length * 3;
  bytesCount += 3 + object.deviceUuid.length * 3;
  bytesCount += 3 + object.deviceVersion.length * 3;
  bytesCount += 3 + object.idUser.length * 3;
  return bytesCount;
}

void _deviceInfoSerialize(
  DeviceInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.deviceManufacturer);
  writer.writeString(offsets[1], object.deviceModel);
  writer.writeString(offsets[2], object.devicePlatform);
  writer.writeString(offsets[3], object.deviceSerial);
  writer.writeString(offsets[4], object.deviceUuid);
  writer.writeString(offsets[5], object.deviceVersion);
  writer.writeLong(offsets[6], object.state);
  writer.writeString(offsets[7], object.idUser);
}

DeviceInfo _deviceInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DeviceInfo();
  object.deviceManufacturer = reader.readString(offsets[0]);
  object.deviceModel = reader.readString(offsets[1]);
  object.devicePlatform = reader.readString(offsets[2]);
  object.deviceSerial = reader.readString(offsets[3]);
  object.deviceUuid = reader.readString(offsets[4]);
  object.deviceVersion = reader.readString(offsets[5]);
  object.state = reader.readLong(offsets[6]);
  object.configId = id;
  object.idUser = reader.readString(offsets[7]);
  return object;
}

P _deviceInfoDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _deviceInfoGetId(DeviceInfo object) {
  return object.configId;
}

List<IsarLinkBase<dynamic>> _deviceInfoGetLinks(DeviceInfo object) {
  return [];
}

void _deviceInfoAttach(IsarCollection<dynamic> col, Id id, DeviceInfo object) {
  object.configId = id;
}

extension DeviceInfoQueryWhereSort
    on QueryBuilder<DeviceInfo, DeviceInfo, QWhere> {
  QueryBuilder<DeviceInfo, DeviceInfo, QAfterWhere> anyConfigId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DeviceInfoQueryWhere
    on QueryBuilder<DeviceInfo, DeviceInfo, QWhereClause> {
  QueryBuilder<DeviceInfo, DeviceInfo, QAfterWhereClause> configIdEqualTo(
      Id configId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: configId,
        upper: configId,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterWhereClause> configIdNotEqualTo(
      Id configId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: configId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: configId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: configId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: configId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterWhereClause> configIdGreaterThan(
      Id configId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: configId, includeLower: include),
      );
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterWhereClause> configIdLessThan(
      Id configId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: configId, includeUpper: include),
      );
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterWhereClause> configIdBetween(
    Id lowerConfigId,
    Id upperConfigId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerConfigId,
        includeLower: includeLower,
        upper: upperConfigId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DeviceInfoQueryFilter
    on QueryBuilder<DeviceInfo, DeviceInfo, QFilterCondition> {
  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceManufacturerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'device_manufacturer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceManufacturerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'device_manufacturer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceManufacturerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'device_manufacturer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceManufacturerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'device_manufacturer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceManufacturerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'device_manufacturer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceManufacturerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'device_manufacturer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceManufacturerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'device_manufacturer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceManufacturerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'device_manufacturer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceManufacturerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'device_manufacturer',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceManufacturerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'device_manufacturer',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceModelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'device_model',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceModelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'device_model',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceModelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'device_model',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceModelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'device_model',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceModelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'device_model',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceModelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'device_model',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceModelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'device_model',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceModelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'device_model',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'device_model',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'device_model',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      devicePlatformEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'device_platform',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      devicePlatformGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'device_platform',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      devicePlatformLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'device_platform',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      devicePlatformBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'device_platform',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      devicePlatformStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'device_platform',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      devicePlatformEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'device_platform',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      devicePlatformContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'device_platform',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      devicePlatformMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'device_platform',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      devicePlatformIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'device_platform',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      devicePlatformIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'device_platform',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceSerialEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'device_serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceSerialGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'device_serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceSerialLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'device_serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceSerialBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'device_serial',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceSerialStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'device_serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceSerialEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'device_serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceSerialContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'device_serial',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceSerialMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'device_serial',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceSerialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'device_serial',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceSerialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'device_serial',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> deviceUuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'device_uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'device_uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'device_uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> deviceUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'device_uuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'device_uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'device_uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'device_uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> deviceUuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'device_uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'device_uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'device_uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceVersionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'device_version',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceVersionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'device_version',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceVersionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'device_version',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceVersionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'device_version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceVersionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'device_version',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceVersionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'device_version',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceVersionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'device_version',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceVersionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'device_version',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceVersionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'device_version',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      deviceVersionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'device_version',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> stateEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'etat',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> stateGreaterThan(
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

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> stateLessThan(
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

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> stateBetween(
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

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> configIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_config',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      configIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_config',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> configIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_config',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> configIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_config',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> idUserEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_utilisateur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> idUserGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_utilisateur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> idUserLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_utilisateur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> idUserBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_utilisateur',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> idUserStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id_utilisateur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> idUserEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id_utilisateur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> idUserContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id_utilisateur',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> idUserMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id_utilisateur',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition> idUserIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_utilisateur',
        value: '',
      ));
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterFilterCondition>
      idUserIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id_utilisateur',
        value: '',
      ));
    });
  }
}

extension DeviceInfoQueryObject
    on QueryBuilder<DeviceInfo, DeviceInfo, QFilterCondition> {}

extension DeviceInfoQueryLinks
    on QueryBuilder<DeviceInfo, DeviceInfo, QFilterCondition> {}

extension DeviceInfoQuerySortBy
    on QueryBuilder<DeviceInfo, DeviceInfo, QSortBy> {
  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy>
      sortByDeviceManufacturer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_manufacturer', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy>
      sortByDeviceManufacturerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_manufacturer', Sort.desc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> sortByDeviceModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_model', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> sortByDeviceModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_model', Sort.desc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> sortByDevicePlatform() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_platform', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy>
      sortByDevicePlatformDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_platform', Sort.desc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> sortByDeviceSerial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_serial', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> sortByDeviceSerialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_serial', Sort.desc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> sortByDeviceUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_uuid', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> sortByDeviceUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_uuid', Sort.desc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> sortByDeviceVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_version', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> sortByDeviceVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_version', Sort.desc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> sortByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> sortByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.desc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> sortByIdUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_utilisateur', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> sortByIdUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_utilisateur', Sort.desc);
    });
  }
}

extension DeviceInfoQuerySortThenBy
    on QueryBuilder<DeviceInfo, DeviceInfo, QSortThenBy> {
  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy>
      thenByDeviceManufacturer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_manufacturer', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy>
      thenByDeviceManufacturerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_manufacturer', Sort.desc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> thenByDeviceModel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_model', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> thenByDeviceModelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_model', Sort.desc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> thenByDevicePlatform() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_platform', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy>
      thenByDevicePlatformDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_platform', Sort.desc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> thenByDeviceSerial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_serial', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> thenByDeviceSerialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_serial', Sort.desc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> thenByDeviceUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_uuid', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> thenByDeviceUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_uuid', Sort.desc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> thenByDeviceVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_version', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> thenByDeviceVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'device_version', Sort.desc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> thenByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> thenByStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etat', Sort.desc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> thenByConfigId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_config', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> thenByConfigIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_config', Sort.desc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> thenByIdUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_utilisateur', Sort.asc);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QAfterSortBy> thenByIdUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_utilisateur', Sort.desc);
    });
  }
}

extension DeviceInfoQueryWhereDistinct
    on QueryBuilder<DeviceInfo, DeviceInfo, QDistinct> {
  QueryBuilder<DeviceInfo, DeviceInfo, QDistinct> distinctByDeviceManufacturer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'device_manufacturer',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QDistinct> distinctByDeviceModel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'device_model', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QDistinct> distinctByDevicePlatform(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'device_platform',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QDistinct> distinctByDeviceSerial(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'device_serial',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QDistinct> distinctByDeviceUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'device_uuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QDistinct> distinctByDeviceVersion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'device_version',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QDistinct> distinctByState() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'etat');
    });
  }

  QueryBuilder<DeviceInfo, DeviceInfo, QDistinct> distinctByIdUser(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_utilisateur',
          caseSensitive: caseSensitive);
    });
  }
}

extension DeviceInfoQueryProperty
    on QueryBuilder<DeviceInfo, DeviceInfo, QQueryProperty> {
  QueryBuilder<DeviceInfo, int, QQueryOperations> configIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_config');
    });
  }

  QueryBuilder<DeviceInfo, String, QQueryOperations>
      deviceManufacturerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'device_manufacturer');
    });
  }

  QueryBuilder<DeviceInfo, String, QQueryOperations> deviceModelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'device_model');
    });
  }

  QueryBuilder<DeviceInfo, String, QQueryOperations> devicePlatformProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'device_platform');
    });
  }

  QueryBuilder<DeviceInfo, String, QQueryOperations> deviceSerialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'device_serial');
    });
  }

  QueryBuilder<DeviceInfo, String, QQueryOperations> deviceUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'device_uuid');
    });
  }

  QueryBuilder<DeviceInfo, String, QQueryOperations> deviceVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'device_version');
    });
  }

  QueryBuilder<DeviceInfo, int, QQueryOperations> stateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'etat');
    });
  }

  QueryBuilder<DeviceInfo, String, QQueryOperations> idUserProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_utilisateur');
    });
  }
}
