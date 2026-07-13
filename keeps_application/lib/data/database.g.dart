// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
      'brand', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
      'model', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _serialNumberMeta =
      const VerificationMeta('serialNumber');
  @override
  late final GeneratedColumn<String> serialNumber = GeneratedColumn<String>(
      'serial_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sellerMeta = const VerificationMeta('seller');
  @override
  late final GeneratedColumn<String> seller = GeneratedColumn<String>(
      'seller', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _purchaseLocationMeta =
      const VerificationMeta('purchaseLocation');
  @override
  late final GeneratedColumn<String> purchaseLocation = GeneratedColumn<String>(
      'purchase_location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _purchasePriceMeta =
      const VerificationMeta('purchasePrice');
  @override
  late final GeneratedColumn<double> purchasePrice = GeneratedColumn<double>(
      'purchase_price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _purchaseDateMeta =
      const VerificationMeta('purchaseDate');
  @override
  late final GeneratedColumn<DateTime> purchaseDate = GeneratedColumn<DateTime>(
      'purchase_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _warrantyExpiryMeta =
      const VerificationMeta('warrantyExpiry');
  @override
  late final GeneratedColumn<DateTime> warrantyExpiry =
      GeneratedColumn<DateTime>('warranty_expiry', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Active'));
  static const VerificationMeta _expectedLifetimeMonthsMeta =
      const VerificationMeta('expectedLifetimeMonths');
  @override
  late final GeneratedColumn<int> expectedLifetimeMonths = GeneratedColumn<int>(
      'expected_lifetime_months', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        category,
        brand,
        model,
        serialNumber,
        seller,
        purchaseLocation,
        purchasePrice,
        purchaseDate,
        warrantyExpiry,
        status,
        expectedLifetimeMonths,
        tags,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('brand')) {
      context.handle(
          _brandMeta, brand.isAcceptableOrUnknown(data['brand']!, _brandMeta));
    }
    if (data.containsKey('model')) {
      context.handle(
          _modelMeta, model.isAcceptableOrUnknown(data['model']!, _modelMeta));
    }
    if (data.containsKey('serial_number')) {
      context.handle(
          _serialNumberMeta,
          serialNumber.isAcceptableOrUnknown(
              data['serial_number']!, _serialNumberMeta));
    }
    if (data.containsKey('seller')) {
      context.handle(_sellerMeta,
          seller.isAcceptableOrUnknown(data['seller']!, _sellerMeta));
    }
    if (data.containsKey('purchase_location')) {
      context.handle(
          _purchaseLocationMeta,
          purchaseLocation.isAcceptableOrUnknown(
              data['purchase_location']!, _purchaseLocationMeta));
    }
    if (data.containsKey('purchase_price')) {
      context.handle(
          _purchasePriceMeta,
          purchasePrice.isAcceptableOrUnknown(
              data['purchase_price']!, _purchasePriceMeta));
    }
    if (data.containsKey('purchase_date')) {
      context.handle(
          _purchaseDateMeta,
          purchaseDate.isAcceptableOrUnknown(
              data['purchase_date']!, _purchaseDateMeta));
    } else if (isInserting) {
      context.missing(_purchaseDateMeta);
    }
    if (data.containsKey('warranty_expiry')) {
      context.handle(
          _warrantyExpiryMeta,
          warrantyExpiry.isAcceptableOrUnknown(
              data['warranty_expiry']!, _warrantyExpiryMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('expected_lifetime_months')) {
      context.handle(
          _expectedLifetimeMonthsMeta,
          expectedLifetimeMonths.isAcceptableOrUnknown(
              data['expected_lifetime_months']!, _expectedLifetimeMonthsMeta));
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      brand: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}brand']),
      model: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}model']),
      serialNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}serial_number']),
      seller: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}seller']),
      purchaseLocation: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}purchase_location']),
      purchasePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}purchase_price'])!,
      purchaseDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}purchase_date'])!,
      warrantyExpiry: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}warranty_expiry']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      expectedLifetimeMonths: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}expected_lifetime_months']),
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final String id;
  final String name;
  final String? category;
  final String? brand;
  final String? model;
  final String? serialNumber;
  final String? seller;
  final String? purchaseLocation;
  final double purchasePrice;
  final DateTime purchaseDate;
  final DateTime? warrantyExpiry;
  final String status;
  final int? expectedLifetimeMonths;
  final String? tags;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Product(
      {required this.id,
      required this.name,
      this.category,
      this.brand,
      this.model,
      this.serialNumber,
      this.seller,
      this.purchaseLocation,
      required this.purchasePrice,
      required this.purchaseDate,
      this.warrantyExpiry,
      required this.status,
      this.expectedLifetimeMonths,
      this.tags,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    if (!nullToAbsent || model != null) {
      map['model'] = Variable<String>(model);
    }
    if (!nullToAbsent || serialNumber != null) {
      map['serial_number'] = Variable<String>(serialNumber);
    }
    if (!nullToAbsent || seller != null) {
      map['seller'] = Variable<String>(seller);
    }
    if (!nullToAbsent || purchaseLocation != null) {
      map['purchase_location'] = Variable<String>(purchaseLocation);
    }
    map['purchase_price'] = Variable<double>(purchasePrice);
    map['purchase_date'] = Variable<DateTime>(purchaseDate);
    if (!nullToAbsent || warrantyExpiry != null) {
      map['warranty_expiry'] = Variable<DateTime>(warrantyExpiry);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || expectedLifetimeMonths != null) {
      map['expected_lifetime_months'] = Variable<int>(expectedLifetimeMonths);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      name: Value(name),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      brand:
          brand == null && nullToAbsent ? const Value.absent() : Value(brand),
      model:
          model == null && nullToAbsent ? const Value.absent() : Value(model),
      serialNumber: serialNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(serialNumber),
      seller:
          seller == null && nullToAbsent ? const Value.absent() : Value(seller),
      purchaseLocation: purchaseLocation == null && nullToAbsent
          ? const Value.absent()
          : Value(purchaseLocation),
      purchasePrice: Value(purchasePrice),
      purchaseDate: Value(purchaseDate),
      warrantyExpiry: warrantyExpiry == null && nullToAbsent
          ? const Value.absent()
          : Value(warrantyExpiry),
      status: Value(status),
      expectedLifetimeMonths: expectedLifetimeMonths == null && nullToAbsent
          ? const Value.absent()
          : Value(expectedLifetimeMonths),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String?>(json['category']),
      brand: serializer.fromJson<String?>(json['brand']),
      model: serializer.fromJson<String?>(json['model']),
      serialNumber: serializer.fromJson<String?>(json['serialNumber']),
      seller: serializer.fromJson<String?>(json['seller']),
      purchaseLocation: serializer.fromJson<String?>(json['purchaseLocation']),
      purchasePrice: serializer.fromJson<double>(json['purchasePrice']),
      purchaseDate: serializer.fromJson<DateTime>(json['purchaseDate']),
      warrantyExpiry: serializer.fromJson<DateTime?>(json['warrantyExpiry']),
      status: serializer.fromJson<String>(json['status']),
      expectedLifetimeMonths:
          serializer.fromJson<int?>(json['expectedLifetimeMonths']),
      tags: serializer.fromJson<String?>(json['tags']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String?>(category),
      'brand': serializer.toJson<String?>(brand),
      'model': serializer.toJson<String?>(model),
      'serialNumber': serializer.toJson<String?>(serialNumber),
      'seller': serializer.toJson<String?>(seller),
      'purchaseLocation': serializer.toJson<String?>(purchaseLocation),
      'purchasePrice': serializer.toJson<double>(purchasePrice),
      'purchaseDate': serializer.toJson<DateTime>(purchaseDate),
      'warrantyExpiry': serializer.toJson<DateTime?>(warrantyExpiry),
      'status': serializer.toJson<String>(status),
      'expectedLifetimeMonths': serializer.toJson<int?>(expectedLifetimeMonths),
      'tags': serializer.toJson<String?>(tags),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Product copyWith(
          {String? id,
          String? name,
          Value<String?> category = const Value.absent(),
          Value<String?> brand = const Value.absent(),
          Value<String?> model = const Value.absent(),
          Value<String?> serialNumber = const Value.absent(),
          Value<String?> seller = const Value.absent(),
          Value<String?> purchaseLocation = const Value.absent(),
          double? purchasePrice,
          DateTime? purchaseDate,
          Value<DateTime?> warrantyExpiry = const Value.absent(),
          String? status,
          Value<int?> expectedLifetimeMonths = const Value.absent(),
          Value<String?> tags = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category.present ? category.value : this.category,
        brand: brand.present ? brand.value : this.brand,
        model: model.present ? model.value : this.model,
        serialNumber:
            serialNumber.present ? serialNumber.value : this.serialNumber,
        seller: seller.present ? seller.value : this.seller,
        purchaseLocation: purchaseLocation.present
            ? purchaseLocation.value
            : this.purchaseLocation,
        purchasePrice: purchasePrice ?? this.purchasePrice,
        purchaseDate: purchaseDate ?? this.purchaseDate,
        warrantyExpiry:
            warrantyExpiry.present ? warrantyExpiry.value : this.warrantyExpiry,
        status: status ?? this.status,
        expectedLifetimeMonths: expectedLifetimeMonths.present
            ? expectedLifetimeMonths.value
            : this.expectedLifetimeMonths,
        tags: tags.present ? tags.value : this.tags,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      brand: data.brand.present ? data.brand.value : this.brand,
      model: data.model.present ? data.model.value : this.model,
      serialNumber: data.serialNumber.present
          ? data.serialNumber.value
          : this.serialNumber,
      seller: data.seller.present ? data.seller.value : this.seller,
      purchaseLocation: data.purchaseLocation.present
          ? data.purchaseLocation.value
          : this.purchaseLocation,
      purchasePrice: data.purchasePrice.present
          ? data.purchasePrice.value
          : this.purchasePrice,
      purchaseDate: data.purchaseDate.present
          ? data.purchaseDate.value
          : this.purchaseDate,
      warrantyExpiry: data.warrantyExpiry.present
          ? data.warrantyExpiry.value
          : this.warrantyExpiry,
      status: data.status.present ? data.status.value : this.status,
      expectedLifetimeMonths: data.expectedLifetimeMonths.present
          ? data.expectedLifetimeMonths.value
          : this.expectedLifetimeMonths,
      tags: data.tags.present ? data.tags.value : this.tags,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('brand: $brand, ')
          ..write('model: $model, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('seller: $seller, ')
          ..write('purchaseLocation: $purchaseLocation, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('warrantyExpiry: $warrantyExpiry, ')
          ..write('status: $status, ')
          ..write('expectedLifetimeMonths: $expectedLifetimeMonths, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      category,
      brand,
      model,
      serialNumber,
      seller,
      purchaseLocation,
      purchasePrice,
      purchaseDate,
      warrantyExpiry,
      status,
      expectedLifetimeMonths,
      tags,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.brand == this.brand &&
          other.model == this.model &&
          other.serialNumber == this.serialNumber &&
          other.seller == this.seller &&
          other.purchaseLocation == this.purchaseLocation &&
          other.purchasePrice == this.purchasePrice &&
          other.purchaseDate == this.purchaseDate &&
          other.warrantyExpiry == this.warrantyExpiry &&
          other.status == this.status &&
          other.expectedLifetimeMonths == this.expectedLifetimeMonths &&
          other.tags == this.tags &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> category;
  final Value<String?> brand;
  final Value<String?> model;
  final Value<String?> serialNumber;
  final Value<String?> seller;
  final Value<String?> purchaseLocation;
  final Value<double> purchasePrice;
  final Value<DateTime> purchaseDate;
  final Value<DateTime?> warrantyExpiry;
  final Value<String> status;
  final Value<int?> expectedLifetimeMonths;
  final Value<String?> tags;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.brand = const Value.absent(),
    this.model = const Value.absent(),
    this.serialNumber = const Value.absent(),
    this.seller = const Value.absent(),
    this.purchaseLocation = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.warrantyExpiry = const Value.absent(),
    this.status = const Value.absent(),
    this.expectedLifetimeMonths = const Value.absent(),
    this.tags = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String id,
    required String name,
    this.category = const Value.absent(),
    this.brand = const Value.absent(),
    this.model = const Value.absent(),
    this.serialNumber = const Value.absent(),
    this.seller = const Value.absent(),
    this.purchaseLocation = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    required DateTime purchaseDate,
    this.warrantyExpiry = const Value.absent(),
    this.status = const Value.absent(),
    this.expectedLifetimeMonths = const Value.absent(),
    this.tags = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        purchaseDate = Value(purchaseDate),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Product> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? brand,
    Expression<String>? model,
    Expression<String>? serialNumber,
    Expression<String>? seller,
    Expression<String>? purchaseLocation,
    Expression<double>? purchasePrice,
    Expression<DateTime>? purchaseDate,
    Expression<DateTime>? warrantyExpiry,
    Expression<String>? status,
    Expression<int>? expectedLifetimeMonths,
    Expression<String>? tags,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (brand != null) 'brand': brand,
      if (model != null) 'model': model,
      if (serialNumber != null) 'serial_number': serialNumber,
      if (seller != null) 'seller': seller,
      if (purchaseLocation != null) 'purchase_location': purchaseLocation,
      if (purchasePrice != null) 'purchase_price': purchasePrice,
      if (purchaseDate != null) 'purchase_date': purchaseDate,
      if (warrantyExpiry != null) 'warranty_expiry': warrantyExpiry,
      if (status != null) 'status': status,
      if (expectedLifetimeMonths != null)
        'expected_lifetime_months': expectedLifetimeMonths,
      if (tags != null) 'tags': tags,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? category,
      Value<String?>? brand,
      Value<String?>? model,
      Value<String?>? serialNumber,
      Value<String?>? seller,
      Value<String?>? purchaseLocation,
      Value<double>? purchasePrice,
      Value<DateTime>? purchaseDate,
      Value<DateTime?>? warrantyExpiry,
      Value<String>? status,
      Value<int?>? expectedLifetimeMonths,
      Value<String?>? tags,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return ProductsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      serialNumber: serialNumber ?? this.serialNumber,
      seller: seller ?? this.seller,
      purchaseLocation: purchaseLocation ?? this.purchaseLocation,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      warrantyExpiry: warrantyExpiry ?? this.warrantyExpiry,
      status: status ?? this.status,
      expectedLifetimeMonths:
          expectedLifetimeMonths ?? this.expectedLifetimeMonths,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (serialNumber.present) {
      map['serial_number'] = Variable<String>(serialNumber.value);
    }
    if (seller.present) {
      map['seller'] = Variable<String>(seller.value);
    }
    if (purchaseLocation.present) {
      map['purchase_location'] = Variable<String>(purchaseLocation.value);
    }
    if (purchasePrice.present) {
      map['purchase_price'] = Variable<double>(purchasePrice.value);
    }
    if (purchaseDate.present) {
      map['purchase_date'] = Variable<DateTime>(purchaseDate.value);
    }
    if (warrantyExpiry.present) {
      map['warranty_expiry'] = Variable<DateTime>(warrantyExpiry.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (expectedLifetimeMonths.present) {
      map['expected_lifetime_months'] =
          Variable<int>(expectedLifetimeMonths.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('brand: $brand, ')
          ..write('model: $model, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('seller: $seller, ')
          ..write('purchaseLocation: $purchaseLocation, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('warrantyExpiry: $warrantyExpiry, ')
          ..write('status: $status, ')
          ..write('expectedLifetimeMonths: $expectedLifetimeMonths, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventsTable extends Events with TableInfo<$EventsTable, Event> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (id)'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<double> cost = GeneratedColumn<double>(
      'cost', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _warrantyExpiryMeta =
      const VerificationMeta('warrantyExpiry');
  @override
  late final GeneratedColumn<DateTime> warrantyExpiry =
      GeneratedColumn<DateTime>('warranty_expiry', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _markdownNoteMeta =
      const VerificationMeta('markdownNote');
  @override
  late final GeneratedColumn<String> markdownNote = GeneratedColumn<String>(
      'markdown_note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        productId,
        date,
        type,
        cost,
        warrantyExpiry,
        markdownNote,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events';
  @override
  VerificationContext validateIntegrity(Insertable<Event> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('cost')) {
      context.handle(
          _costMeta, cost.isAcceptableOrUnknown(data['cost']!, _costMeta));
    }
    if (data.containsKey('warranty_expiry')) {
      context.handle(
          _warrantyExpiryMeta,
          warrantyExpiry.isAcceptableOrUnknown(
              data['warranty_expiry']!, _warrantyExpiryMeta));
    }
    if (data.containsKey('markdown_note')) {
      context.handle(
          _markdownNoteMeta,
          markdownNote.isAcceptableOrUnknown(
              data['markdown_note']!, _markdownNoteMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Event map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Event(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      cost: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cost']),
      warrantyExpiry: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}warranty_expiry']),
      markdownNote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}markdown_note']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $EventsTable createAlias(String alias) {
    return $EventsTable(attachedDatabase, alias);
  }
}

class Event extends DataClass implements Insertable<Event> {
  final String id;
  final String productId;
  final DateTime date;
  final String type;
  final double? cost;
  final DateTime? warrantyExpiry;
  final String? markdownNote;
  final DateTime createdAt;
  const Event(
      {required this.id,
      required this.productId,
      required this.date,
      required this.type,
      this.cost,
      this.warrantyExpiry,
      this.markdownNote,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['product_id'] = Variable<String>(productId);
    map['date'] = Variable<DateTime>(date);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || cost != null) {
      map['cost'] = Variable<double>(cost);
    }
    if (!nullToAbsent || warrantyExpiry != null) {
      map['warranty_expiry'] = Variable<DateTime>(warrantyExpiry);
    }
    if (!nullToAbsent || markdownNote != null) {
      map['markdown_note'] = Variable<String>(markdownNote);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  EventsCompanion toCompanion(bool nullToAbsent) {
    return EventsCompanion(
      id: Value(id),
      productId: Value(productId),
      date: Value(date),
      type: Value(type),
      cost: cost == null && nullToAbsent ? const Value.absent() : Value(cost),
      warrantyExpiry: warrantyExpiry == null && nullToAbsent
          ? const Value.absent()
          : Value(warrantyExpiry),
      markdownNote: markdownNote == null && nullToAbsent
          ? const Value.absent()
          : Value(markdownNote),
      createdAt: Value(createdAt),
    );
  }

  factory Event.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Event(
      id: serializer.fromJson<String>(json['id']),
      productId: serializer.fromJson<String>(json['productId']),
      date: serializer.fromJson<DateTime>(json['date']),
      type: serializer.fromJson<String>(json['type']),
      cost: serializer.fromJson<double?>(json['cost']),
      warrantyExpiry: serializer.fromJson<DateTime?>(json['warrantyExpiry']),
      markdownNote: serializer.fromJson<String?>(json['markdownNote']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'productId': serializer.toJson<String>(productId),
      'date': serializer.toJson<DateTime>(date),
      'type': serializer.toJson<String>(type),
      'cost': serializer.toJson<double?>(cost),
      'warrantyExpiry': serializer.toJson<DateTime?>(warrantyExpiry),
      'markdownNote': serializer.toJson<String?>(markdownNote),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Event copyWith(
          {String? id,
          String? productId,
          DateTime? date,
          String? type,
          Value<double?> cost = const Value.absent(),
          Value<DateTime?> warrantyExpiry = const Value.absent(),
          Value<String?> markdownNote = const Value.absent(),
          DateTime? createdAt}) =>
      Event(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        date: date ?? this.date,
        type: type ?? this.type,
        cost: cost.present ? cost.value : this.cost,
        warrantyExpiry:
            warrantyExpiry.present ? warrantyExpiry.value : this.warrantyExpiry,
        markdownNote:
            markdownNote.present ? markdownNote.value : this.markdownNote,
        createdAt: createdAt ?? this.createdAt,
      );
  Event copyWithCompanion(EventsCompanion data) {
    return Event(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      date: data.date.present ? data.date.value : this.date,
      type: data.type.present ? data.type.value : this.type,
      cost: data.cost.present ? data.cost.value : this.cost,
      warrantyExpiry: data.warrantyExpiry.present
          ? data.warrantyExpiry.value
          : this.warrantyExpiry,
      markdownNote: data.markdownNote.present
          ? data.markdownNote.value
          : this.markdownNote,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Event(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('cost: $cost, ')
          ..write('warrantyExpiry: $warrantyExpiry, ')
          ..write('markdownNote: $markdownNote, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, productId, date, type, cost, warrantyExpiry, markdownNote, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Event &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.date == this.date &&
          other.type == this.type &&
          other.cost == this.cost &&
          other.warrantyExpiry == this.warrantyExpiry &&
          other.markdownNote == this.markdownNote &&
          other.createdAt == this.createdAt);
}

class EventsCompanion extends UpdateCompanion<Event> {
  final Value<String> id;
  final Value<String> productId;
  final Value<DateTime> date;
  final Value<String> type;
  final Value<double?> cost;
  final Value<DateTime?> warrantyExpiry;
  final Value<String?> markdownNote;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const EventsCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.date = const Value.absent(),
    this.type = const Value.absent(),
    this.cost = const Value.absent(),
    this.warrantyExpiry = const Value.absent(),
    this.markdownNote = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventsCompanion.insert({
    required String id,
    required String productId,
    required DateTime date,
    required String type,
    this.cost = const Value.absent(),
    this.warrantyExpiry = const Value.absent(),
    this.markdownNote = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        productId = Value(productId),
        date = Value(date),
        type = Value(type),
        createdAt = Value(createdAt);
  static Insertable<Event> custom({
    Expression<String>? id,
    Expression<String>? productId,
    Expression<DateTime>? date,
    Expression<String>? type,
    Expression<double>? cost,
    Expression<DateTime>? warrantyExpiry,
    Expression<String>? markdownNote,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (date != null) 'date': date,
      if (type != null) 'type': type,
      if (cost != null) 'cost': cost,
      if (warrantyExpiry != null) 'warranty_expiry': warrantyExpiry,
      if (markdownNote != null) 'markdown_note': markdownNote,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventsCompanion copyWith(
      {Value<String>? id,
      Value<String>? productId,
      Value<DateTime>? date,
      Value<String>? type,
      Value<double?>? cost,
      Value<DateTime?>? warrantyExpiry,
      Value<String?>? markdownNote,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return EventsCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      date: date ?? this.date,
      type: type ?? this.type,
      cost: cost ?? this.cost,
      warrantyExpiry: warrantyExpiry ?? this.warrantyExpiry,
      markdownNote: markdownNote ?? this.markdownNote,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (cost.present) {
      map['cost'] = Variable<double>(cost.value);
    }
    if (warrantyExpiry.present) {
      map['warranty_expiry'] = Variable<DateTime>(warrantyExpiry.value);
    }
    if (markdownNote.present) {
      map['markdown_note'] = Variable<String>(markdownNote.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('cost: $cost, ')
          ..write('warrantyExpiry: $warrantyExpiry, ')
          ..write('markdownNote: $markdownNote, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $JournalRevisionsTable extends JournalRevisions
    with TableInfo<$JournalRevisionsTable, JournalRevision> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalRevisionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (id)'));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, productId, content, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_revisions';
  @override
  VerificationContext validateIntegrity(Insertable<JournalRevision> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JournalRevision map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalRevision(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $JournalRevisionsTable createAlias(String alias) {
    return $JournalRevisionsTable(attachedDatabase, alias);
  }
}

class JournalRevision extends DataClass implements Insertable<JournalRevision> {
  final String id;
  final String productId;
  final String content;
  final DateTime createdAt;
  const JournalRevision(
      {required this.id,
      required this.productId,
      required this.content,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['product_id'] = Variable<String>(productId);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  JournalRevisionsCompanion toCompanion(bool nullToAbsent) {
    return JournalRevisionsCompanion(
      id: Value(id),
      productId: Value(productId),
      content: Value(content),
      createdAt: Value(createdAt),
    );
  }

  factory JournalRevision.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalRevision(
      id: serializer.fromJson<String>(json['id']),
      productId: serializer.fromJson<String>(json['productId']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'productId': serializer.toJson<String>(productId),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  JournalRevision copyWith(
          {String? id,
          String? productId,
          String? content,
          DateTime? createdAt}) =>
      JournalRevision(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
      );
  JournalRevision copyWithCompanion(JournalRevisionsCompanion data) {
    return JournalRevision(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalRevision(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, content, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalRevision &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.content == this.content &&
          other.createdAt == this.createdAt);
}

class JournalRevisionsCompanion extends UpdateCompanion<JournalRevision> {
  final Value<String> id;
  final Value<String> productId;
  final Value<String> content;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const JournalRevisionsCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JournalRevisionsCompanion.insert({
    required String id,
    required String productId,
    required String content,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        productId = Value(productId),
        content = Value(content),
        createdAt = Value(createdAt);
  static Insertable<JournalRevision> custom({
    Expression<String>? id,
    Expression<String>? productId,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JournalRevisionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? productId,
      Value<String>? content,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return JournalRevisionsCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalRevisionsCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AttachmentsTable extends Attachments
    with TableInfo<$AttachmentsTable, Attachment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (id)'));
  static const VerificationMeta _eventIdMeta =
      const VerificationMeta('eventId');
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
      'event_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES events (id)'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _thumbnailPathMeta =
      const VerificationMeta('thumbnailPath');
  @override
  late final GeneratedColumn<String> thumbnailPath = GeneratedColumn<String>(
      'thumbnail_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, productId, eventId, type, filePath, thumbnailPath, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attachments';
  @override
  VerificationContext validateIntegrity(Insertable<Attachment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('thumbnail_path')) {
      context.handle(
          _thumbnailPathMeta,
          thumbnailPath.isAcceptableOrUnknown(
              data['thumbnail_path']!, _thumbnailPathMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Attachment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Attachment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id']),
      eventId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}event_id']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path'])!,
      thumbnailPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail_path']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $AttachmentsTable createAlias(String alias) {
    return $AttachmentsTable(attachedDatabase, alias);
  }
}

class Attachment extends DataClass implements Insertable<Attachment> {
  final String id;
  final String? productId;
  final String? eventId;
  final String type;
  final String filePath;
  final String? thumbnailPath;
  final DateTime createdAt;
  const Attachment(
      {required this.id,
      this.productId,
      this.eventId,
      required this.type,
      required this.filePath,
      this.thumbnailPath,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<String>(productId);
    }
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<String>(eventId);
    }
    map['type'] = Variable<String>(type);
    map['file_path'] = Variable<String>(filePath);
    if (!nullToAbsent || thumbnailPath != null) {
      map['thumbnail_path'] = Variable<String>(thumbnailPath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AttachmentsCompanion toCompanion(bool nullToAbsent) {
    return AttachmentsCompanion(
      id: Value(id),
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      type: Value(type),
      filePath: Value(filePath),
      thumbnailPath: thumbnailPath == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailPath),
      createdAt: Value(createdAt),
    );
  }

  factory Attachment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Attachment(
      id: serializer.fromJson<String>(json['id']),
      productId: serializer.fromJson<String?>(json['productId']),
      eventId: serializer.fromJson<String?>(json['eventId']),
      type: serializer.fromJson<String>(json['type']),
      filePath: serializer.fromJson<String>(json['filePath']),
      thumbnailPath: serializer.fromJson<String?>(json['thumbnailPath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'productId': serializer.toJson<String?>(productId),
      'eventId': serializer.toJson<String?>(eventId),
      'type': serializer.toJson<String>(type),
      'filePath': serializer.toJson<String>(filePath),
      'thumbnailPath': serializer.toJson<String?>(thumbnailPath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Attachment copyWith(
          {String? id,
          Value<String?> productId = const Value.absent(),
          Value<String?> eventId = const Value.absent(),
          String? type,
          String? filePath,
          Value<String?> thumbnailPath = const Value.absent(),
          DateTime? createdAt}) =>
      Attachment(
        id: id ?? this.id,
        productId: productId.present ? productId.value : this.productId,
        eventId: eventId.present ? eventId.value : this.eventId,
        type: type ?? this.type,
        filePath: filePath ?? this.filePath,
        thumbnailPath:
            thumbnailPath.present ? thumbnailPath.value : this.thumbnailPath,
        createdAt: createdAt ?? this.createdAt,
      );
  Attachment copyWithCompanion(AttachmentsCompanion data) {
    return Attachment(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      type: data.type.present ? data.type.value : this.type,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      thumbnailPath: data.thumbnailPath.present
          ? data.thumbnailPath.value
          : this.thumbnailPath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Attachment(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('eventId: $eventId, ')
          ..write('type: $type, ')
          ..write('filePath: $filePath, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, productId, eventId, type, filePath, thumbnailPath, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Attachment &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.eventId == this.eventId &&
          other.type == this.type &&
          other.filePath == this.filePath &&
          other.thumbnailPath == this.thumbnailPath &&
          other.createdAt == this.createdAt);
}

class AttachmentsCompanion extends UpdateCompanion<Attachment> {
  final Value<String> id;
  final Value<String?> productId;
  final Value<String?> eventId;
  final Value<String> type;
  final Value<String> filePath;
  final Value<String?> thumbnailPath;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AttachmentsCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.eventId = const Value.absent(),
    this.type = const Value.absent(),
    this.filePath = const Value.absent(),
    this.thumbnailPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AttachmentsCompanion.insert({
    required String id,
    this.productId = const Value.absent(),
    this.eventId = const Value.absent(),
    required String type,
    required String filePath,
    this.thumbnailPath = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        type = Value(type),
        filePath = Value(filePath),
        createdAt = Value(createdAt);
  static Insertable<Attachment> custom({
    Expression<String>? id,
    Expression<String>? productId,
    Expression<String>? eventId,
    Expression<String>? type,
    Expression<String>? filePath,
    Expression<String>? thumbnailPath,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (eventId != null) 'event_id': eventId,
      if (type != null) 'type': type,
      if (filePath != null) 'file_path': filePath,
      if (thumbnailPath != null) 'thumbnail_path': thumbnailPath,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AttachmentsCompanion copyWith(
      {Value<String>? id,
      Value<String?>? productId,
      Value<String?>? eventId,
      Value<String>? type,
      Value<String>? filePath,
      Value<String?>? thumbnailPath,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return AttachmentsCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      eventId: eventId ?? this.eventId,
      type: type ?? this.type,
      filePath: filePath ?? this.filePath,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (thumbnailPath.present) {
      map['thumbnail_path'] = Variable<String>(thumbnailPath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentsCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('eventId: $eventId, ')
          ..write('type: $type, ')
          ..write('filePath: $filePath, ')
          ..write('thumbnailPath: $thumbnailPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WarrantiesTable extends Warranties
    with TableInfo<$WarrantiesTable, Warranty> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WarrantiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (id)'));
  static const VerificationMeta _eventIdMeta =
      const VerificationMeta('eventId');
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
      'event_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES events (id)'));
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
      'kind', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _expiryDateMeta =
      const VerificationMeta('expiryDate');
  @override
  late final GeneratedColumn<DateTime> expiryDate = GeneratedColumn<DateTime>(
      'expiry_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _reminderDaysBeforeMeta =
      const VerificationMeta('reminderDaysBefore');
  @override
  late final GeneratedColumn<String> reminderDaysBefore =
      GeneratedColumn<String>('reminder_days_before', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('30,7,0'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, productId, eventId, kind, expiryDate, reminderDaysBefore];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'warranties';
  @override
  VerificationContext validateIntegrity(Insertable<Warranty> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta));
    }
    if (data.containsKey('kind')) {
      context.handle(
          _kindMeta, kind.isAcceptableOrUnknown(data['kind']!, _kindMeta));
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('expiry_date')) {
      context.handle(
          _expiryDateMeta,
          expiryDate.isAcceptableOrUnknown(
              data['expiry_date']!, _expiryDateMeta));
    } else if (isInserting) {
      context.missing(_expiryDateMeta);
    }
    if (data.containsKey('reminder_days_before')) {
      context.handle(
          _reminderDaysBeforeMeta,
          reminderDaysBefore.isAcceptableOrUnknown(
              data['reminder_days_before']!, _reminderDaysBeforeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Warranty map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Warranty(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id']),
      eventId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}event_id']),
      kind: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}kind'])!,
      expiryDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expiry_date'])!,
      reminderDaysBefore: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}reminder_days_before'])!,
    );
  }

  @override
  $WarrantiesTable createAlias(String alias) {
    return $WarrantiesTable(attachedDatabase, alias);
  }
}

class Warranty extends DataClass implements Insertable<Warranty> {
  final String id;
  final String? productId;
  final String? eventId;
  final String kind;
  final DateTime expiryDate;
  final String reminderDaysBefore;
  const Warranty(
      {required this.id,
      this.productId,
      this.eventId,
      required this.kind,
      required this.expiryDate,
      required this.reminderDaysBefore});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<String>(productId);
    }
    if (!nullToAbsent || eventId != null) {
      map['event_id'] = Variable<String>(eventId);
    }
    map['kind'] = Variable<String>(kind);
    map['expiry_date'] = Variable<DateTime>(expiryDate);
    map['reminder_days_before'] = Variable<String>(reminderDaysBefore);
    return map;
  }

  WarrantiesCompanion toCompanion(bool nullToAbsent) {
    return WarrantiesCompanion(
      id: Value(id),
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
      eventId: eventId == null && nullToAbsent
          ? const Value.absent()
          : Value(eventId),
      kind: Value(kind),
      expiryDate: Value(expiryDate),
      reminderDaysBefore: Value(reminderDaysBefore),
    );
  }

  factory Warranty.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Warranty(
      id: serializer.fromJson<String>(json['id']),
      productId: serializer.fromJson<String?>(json['productId']),
      eventId: serializer.fromJson<String?>(json['eventId']),
      kind: serializer.fromJson<String>(json['kind']),
      expiryDate: serializer.fromJson<DateTime>(json['expiryDate']),
      reminderDaysBefore:
          serializer.fromJson<String>(json['reminderDaysBefore']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'productId': serializer.toJson<String?>(productId),
      'eventId': serializer.toJson<String?>(eventId),
      'kind': serializer.toJson<String>(kind),
      'expiryDate': serializer.toJson<DateTime>(expiryDate),
      'reminderDaysBefore': serializer.toJson<String>(reminderDaysBefore),
    };
  }

  Warranty copyWith(
          {String? id,
          Value<String?> productId = const Value.absent(),
          Value<String?> eventId = const Value.absent(),
          String? kind,
          DateTime? expiryDate,
          String? reminderDaysBefore}) =>
      Warranty(
        id: id ?? this.id,
        productId: productId.present ? productId.value : this.productId,
        eventId: eventId.present ? eventId.value : this.eventId,
        kind: kind ?? this.kind,
        expiryDate: expiryDate ?? this.expiryDate,
        reminderDaysBefore: reminderDaysBefore ?? this.reminderDaysBefore,
      );
  Warranty copyWithCompanion(WarrantiesCompanion data) {
    return Warranty(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      kind: data.kind.present ? data.kind.value : this.kind,
      expiryDate:
          data.expiryDate.present ? data.expiryDate.value : this.expiryDate,
      reminderDaysBefore: data.reminderDaysBefore.present
          ? data.reminderDaysBefore.value
          : this.reminderDaysBefore,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Warranty(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('eventId: $eventId, ')
          ..write('kind: $kind, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('reminderDaysBefore: $reminderDaysBefore')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, productId, eventId, kind, expiryDate, reminderDaysBefore);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Warranty &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.eventId == this.eventId &&
          other.kind == this.kind &&
          other.expiryDate == this.expiryDate &&
          other.reminderDaysBefore == this.reminderDaysBefore);
}

class WarrantiesCompanion extends UpdateCompanion<Warranty> {
  final Value<String> id;
  final Value<String?> productId;
  final Value<String?> eventId;
  final Value<String> kind;
  final Value<DateTime> expiryDate;
  final Value<String> reminderDaysBefore;
  final Value<int> rowid;
  const WarrantiesCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.eventId = const Value.absent(),
    this.kind = const Value.absent(),
    this.expiryDate = const Value.absent(),
    this.reminderDaysBefore = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WarrantiesCompanion.insert({
    required String id,
    this.productId = const Value.absent(),
    this.eventId = const Value.absent(),
    required String kind,
    required DateTime expiryDate,
    this.reminderDaysBefore = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        kind = Value(kind),
        expiryDate = Value(expiryDate);
  static Insertable<Warranty> custom({
    Expression<String>? id,
    Expression<String>? productId,
    Expression<String>? eventId,
    Expression<String>? kind,
    Expression<DateTime>? expiryDate,
    Expression<String>? reminderDaysBefore,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (eventId != null) 'event_id': eventId,
      if (kind != null) 'kind': kind,
      if (expiryDate != null) 'expiry_date': expiryDate,
      if (reminderDaysBefore != null)
        'reminder_days_before': reminderDaysBefore,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WarrantiesCompanion copyWith(
      {Value<String>? id,
      Value<String?>? productId,
      Value<String?>? eventId,
      Value<String>? kind,
      Value<DateTime>? expiryDate,
      Value<String>? reminderDaysBefore,
      Value<int>? rowid}) {
    return WarrantiesCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      eventId: eventId ?? this.eventId,
      kind: kind ?? this.kind,
      expiryDate: expiryDate ?? this.expiryDate,
      reminderDaysBefore: reminderDaysBefore ?? this.reminderDaysBefore,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (expiryDate.present) {
      map['expiry_date'] = Variable<DateTime>(expiryDate.value);
    }
    if (reminderDaysBefore.present) {
      map['reminder_days_before'] = Variable<String>(reminderDaysBefore.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WarrantiesCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('eventId: $eventId, ')
          ..write('kind: $kind, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('reminderDaysBefore: $reminderDaysBefore, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $EventsTable events = $EventsTable(this);
  late final $JournalRevisionsTable journalRevisions =
      $JournalRevisionsTable(this);
  late final $AttachmentsTable attachments = $AttachmentsTable(this);
  late final $WarrantiesTable warranties = $WarrantiesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [products, events, journalRevisions, attachments, warranties];
}

typedef $$ProductsTableCreateCompanionBuilder = ProductsCompanion Function({
  required String id,
  required String name,
  Value<String?> category,
  Value<String?> brand,
  Value<String?> model,
  Value<String?> serialNumber,
  Value<String?> seller,
  Value<String?> purchaseLocation,
  Value<double> purchasePrice,
  required DateTime purchaseDate,
  Value<DateTime?> warrantyExpiry,
  Value<String> status,
  Value<int?> expectedLifetimeMonths,
  Value<String?> tags,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$ProductsTableUpdateCompanionBuilder = ProductsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> category,
  Value<String?> brand,
  Value<String?> model,
  Value<String?> serialNumber,
  Value<String?> seller,
  Value<String?> purchaseLocation,
  Value<double> purchasePrice,
  Value<DateTime> purchaseDate,
  Value<DateTime?> warrantyExpiry,
  Value<String> status,
  Value<int?> expectedLifetimeMonths,
  Value<String?> tags,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$ProductsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductsTable,
    Product,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder> {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ProductsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ProductsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<String?> brand = const Value.absent(),
            Value<String?> model = const Value.absent(),
            Value<String?> serialNumber = const Value.absent(),
            Value<String?> seller = const Value.absent(),
            Value<String?> purchaseLocation = const Value.absent(),
            Value<double> purchasePrice = const Value.absent(),
            Value<DateTime> purchaseDate = const Value.absent(),
            Value<DateTime?> warrantyExpiry = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int?> expectedLifetimeMonths = const Value.absent(),
            Value<String?> tags = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductsCompanion(
            id: id,
            name: name,
            category: category,
            brand: brand,
            model: model,
            serialNumber: serialNumber,
            seller: seller,
            purchaseLocation: purchaseLocation,
            purchasePrice: purchasePrice,
            purchaseDate: purchaseDate,
            warrantyExpiry: warrantyExpiry,
            status: status,
            expectedLifetimeMonths: expectedLifetimeMonths,
            tags: tags,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> category = const Value.absent(),
            Value<String?> brand = const Value.absent(),
            Value<String?> model = const Value.absent(),
            Value<String?> serialNumber = const Value.absent(),
            Value<String?> seller = const Value.absent(),
            Value<String?> purchaseLocation = const Value.absent(),
            Value<double> purchasePrice = const Value.absent(),
            required DateTime purchaseDate,
            Value<DateTime?> warrantyExpiry = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int?> expectedLifetimeMonths = const Value.absent(),
            Value<String?> tags = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductsCompanion.insert(
            id: id,
            name: name,
            category: category,
            brand: brand,
            model: model,
            serialNumber: serialNumber,
            seller: seller,
            purchaseLocation: purchaseLocation,
            purchasePrice: purchasePrice,
            purchaseDate: purchaseDate,
            warrantyExpiry: warrantyExpiry,
            status: status,
            expectedLifetimeMonths: expectedLifetimeMonths,
            tags: tags,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
        ));
}

class $$ProductsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get brand => $state.composableBuilder(
      column: $state.table.brand,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get model => $state.composableBuilder(
      column: $state.table.model,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get serialNumber => $state.composableBuilder(
      column: $state.table.serialNumber,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get seller => $state.composableBuilder(
      column: $state.table.seller,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get purchaseLocation => $state.composableBuilder(
      column: $state.table.purchaseLocation,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get purchasePrice => $state.composableBuilder(
      column: $state.table.purchasePrice,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get purchaseDate => $state.composableBuilder(
      column: $state.table.purchaseDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get warrantyExpiry => $state.composableBuilder(
      column: $state.table.warrantyExpiry,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get expectedLifetimeMonths => $state.composableBuilder(
      column: $state.table.expectedLifetimeMonths,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get tags => $state.composableBuilder(
      column: $state.table.tags,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter eventsRefs(
      ComposableFilter Function($$EventsTableFilterComposer f) f) {
    final $$EventsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.events,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder, parentComposers) => $$EventsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.events, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter journalRevisionsRefs(
      ComposableFilter Function($$JournalRevisionsTableFilterComposer f) f) {
    final $$JournalRevisionsTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.journalRevisions,
            getReferencedColumn: (t) => t.productId,
            builder: (joinBuilder, parentComposers) =>
                $$JournalRevisionsTableFilterComposer(ComposerState($state.db,
                    $state.db.journalRevisions, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter attachmentsRefs(
      ComposableFilter Function($$AttachmentsTableFilterComposer f) f) {
    final $$AttachmentsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.attachments,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder, parentComposers) =>
            $$AttachmentsTableFilterComposer(ComposerState($state.db,
                $state.db.attachments, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter warrantiesRefs(
      ComposableFilter Function($$WarrantiesTableFilterComposer f) f) {
    final $$WarrantiesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.warranties,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder, parentComposers) =>
            $$WarrantiesTableFilterComposer(ComposerState($state.db,
                $state.db.warranties, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get brand => $state.composableBuilder(
      column: $state.table.brand,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get model => $state.composableBuilder(
      column: $state.table.model,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get serialNumber => $state.composableBuilder(
      column: $state.table.serialNumber,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get seller => $state.composableBuilder(
      column: $state.table.seller,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get purchaseLocation => $state.composableBuilder(
      column: $state.table.purchaseLocation,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get purchasePrice => $state.composableBuilder(
      column: $state.table.purchasePrice,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get purchaseDate => $state.composableBuilder(
      column: $state.table.purchaseDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get warrantyExpiry => $state.composableBuilder(
      column: $state.table.warrantyExpiry,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get expectedLifetimeMonths => $state.composableBuilder(
      column: $state.table.expectedLifetimeMonths,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tags => $state.composableBuilder(
      column: $state.table.tags,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$EventsTableCreateCompanionBuilder = EventsCompanion Function({
  required String id,
  required String productId,
  required DateTime date,
  required String type,
  Value<double?> cost,
  Value<DateTime?> warrantyExpiry,
  Value<String?> markdownNote,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$EventsTableUpdateCompanionBuilder = EventsCompanion Function({
  Value<String> id,
  Value<String> productId,
  Value<DateTime> date,
  Value<String> type,
  Value<double?> cost,
  Value<DateTime?> warrantyExpiry,
  Value<String?> markdownNote,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$EventsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EventsTable,
    Event,
    $$EventsTableFilterComposer,
    $$EventsTableOrderingComposer,
    $$EventsTableCreateCompanionBuilder,
    $$EventsTableUpdateCompanionBuilder> {
  $$EventsTableTableManager(_$AppDatabase db, $EventsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$EventsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$EventsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<double?> cost = const Value.absent(),
            Value<DateTime?> warrantyExpiry = const Value.absent(),
            Value<String?> markdownNote = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EventsCompanion(
            id: id,
            productId: productId,
            date: date,
            type: type,
            cost: cost,
            warrantyExpiry: warrantyExpiry,
            markdownNote: markdownNote,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String productId,
            required DateTime date,
            required String type,
            Value<double?> cost = const Value.absent(),
            Value<DateTime?> warrantyExpiry = const Value.absent(),
            Value<String?> markdownNote = const Value.absent(),
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              EventsCompanion.insert(
            id: id,
            productId: productId,
            date: date,
            type: type,
            cost: cost,
            warrantyExpiry: warrantyExpiry,
            markdownNote: markdownNote,
            createdAt: createdAt,
            rowid: rowid,
          ),
        ));
}

class $$EventsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $EventsTable> {
  $$EventsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get cost => $state.composableBuilder(
      column: $state.table.cost,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get warrantyExpiry => $state.composableBuilder(
      column: $state.table.warrantyExpiry,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get markdownNote => $state.composableBuilder(
      column: $state.table.markdownNote,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $state.db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProductsTableFilterComposer(ComposerState(
                $state.db, $state.db.products, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter attachmentsRefs(
      ComposableFilter Function($$AttachmentsTableFilterComposer f) f) {
    final $$AttachmentsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.attachments,
        getReferencedColumn: (t) => t.eventId,
        builder: (joinBuilder, parentComposers) =>
            $$AttachmentsTableFilterComposer(ComposerState($state.db,
                $state.db.attachments, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter warrantiesRefs(
      ComposableFilter Function($$WarrantiesTableFilterComposer f) f) {
    final $$WarrantiesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.warranties,
        getReferencedColumn: (t) => t.eventId,
        builder: (joinBuilder, parentComposers) =>
            $$WarrantiesTableFilterComposer(ComposerState($state.db,
                $state.db.warranties, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$EventsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $EventsTable> {
  $$EventsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get cost => $state.composableBuilder(
      column: $state.table.cost,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get warrantyExpiry => $state.composableBuilder(
      column: $state.table.warrantyExpiry,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get markdownNote => $state.composableBuilder(
      column: $state.table.markdownNote,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $state.db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProductsTableOrderingComposer(ComposerState(
                $state.db, $state.db.products, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$JournalRevisionsTableCreateCompanionBuilder
    = JournalRevisionsCompanion Function({
  required String id,
  required String productId,
  required String content,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$JournalRevisionsTableUpdateCompanionBuilder
    = JournalRevisionsCompanion Function({
  Value<String> id,
  Value<String> productId,
  Value<String> content,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$JournalRevisionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $JournalRevisionsTable,
    JournalRevision,
    $$JournalRevisionsTableFilterComposer,
    $$JournalRevisionsTableOrderingComposer,
    $$JournalRevisionsTableCreateCompanionBuilder,
    $$JournalRevisionsTableUpdateCompanionBuilder> {
  $$JournalRevisionsTableTableManager(
      _$AppDatabase db, $JournalRevisionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$JournalRevisionsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$JournalRevisionsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> productId = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              JournalRevisionsCompanion(
            id: id,
            productId: productId,
            content: content,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String productId,
            required String content,
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              JournalRevisionsCompanion.insert(
            id: id,
            productId: productId,
            content: content,
            createdAt: createdAt,
            rowid: rowid,
          ),
        ));
}

class $$JournalRevisionsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $JournalRevisionsTable> {
  $$JournalRevisionsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $state.db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProductsTableFilterComposer(ComposerState(
                $state.db, $state.db.products, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$JournalRevisionsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $JournalRevisionsTable> {
  $$JournalRevisionsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $state.db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProductsTableOrderingComposer(ComposerState(
                $state.db, $state.db.products, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$AttachmentsTableCreateCompanionBuilder = AttachmentsCompanion
    Function({
  required String id,
  Value<String?> productId,
  Value<String?> eventId,
  required String type,
  required String filePath,
  Value<String?> thumbnailPath,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$AttachmentsTableUpdateCompanionBuilder = AttachmentsCompanion
    Function({
  Value<String> id,
  Value<String?> productId,
  Value<String?> eventId,
  Value<String> type,
  Value<String> filePath,
  Value<String?> thumbnailPath,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$AttachmentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AttachmentsTable,
    Attachment,
    $$AttachmentsTableFilterComposer,
    $$AttachmentsTableOrderingComposer,
    $$AttachmentsTableCreateCompanionBuilder,
    $$AttachmentsTableUpdateCompanionBuilder> {
  $$AttachmentsTableTableManager(_$AppDatabase db, $AttachmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AttachmentsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AttachmentsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> productId = const Value.absent(),
            Value<String?> eventId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> filePath = const Value.absent(),
            Value<String?> thumbnailPath = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AttachmentsCompanion(
            id: id,
            productId: productId,
            eventId: eventId,
            type: type,
            filePath: filePath,
            thumbnailPath: thumbnailPath,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> productId = const Value.absent(),
            Value<String?> eventId = const Value.absent(),
            required String type,
            required String filePath,
            Value<String?> thumbnailPath = const Value.absent(),
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              AttachmentsCompanion.insert(
            id: id,
            productId: productId,
            eventId: eventId,
            type: type,
            filePath: filePath,
            thumbnailPath: thumbnailPath,
            createdAt: createdAt,
            rowid: rowid,
          ),
        ));
}

class $$AttachmentsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get filePath => $state.composableBuilder(
      column: $state.table.filePath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get thumbnailPath => $state.composableBuilder(
      column: $state.table.thumbnailPath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $state.db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProductsTableFilterComposer(ComposerState(
                $state.db, $state.db.products, joinBuilder, parentComposers)));
    return composer;
  }

  $$EventsTableFilterComposer get eventId {
    final $$EventsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.eventId,
        referencedTable: $state.db.events,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$EventsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.events, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$AttachmentsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get filePath => $state.composableBuilder(
      column: $state.table.filePath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get thumbnailPath => $state.composableBuilder(
      column: $state.table.thumbnailPath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $state.db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProductsTableOrderingComposer(ComposerState(
                $state.db, $state.db.products, joinBuilder, parentComposers)));
    return composer;
  }

  $$EventsTableOrderingComposer get eventId {
    final $$EventsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.eventId,
        referencedTable: $state.db.events,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$EventsTableOrderingComposer(ComposerState(
                $state.db, $state.db.events, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$WarrantiesTableCreateCompanionBuilder = WarrantiesCompanion Function({
  required String id,
  Value<String?> productId,
  Value<String?> eventId,
  required String kind,
  required DateTime expiryDate,
  Value<String> reminderDaysBefore,
  Value<int> rowid,
});
typedef $$WarrantiesTableUpdateCompanionBuilder = WarrantiesCompanion Function({
  Value<String> id,
  Value<String?> productId,
  Value<String?> eventId,
  Value<String> kind,
  Value<DateTime> expiryDate,
  Value<String> reminderDaysBefore,
  Value<int> rowid,
});

class $$WarrantiesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WarrantiesTable,
    Warranty,
    $$WarrantiesTableFilterComposer,
    $$WarrantiesTableOrderingComposer,
    $$WarrantiesTableCreateCompanionBuilder,
    $$WarrantiesTableUpdateCompanionBuilder> {
  $$WarrantiesTableTableManager(_$AppDatabase db, $WarrantiesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WarrantiesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WarrantiesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> productId = const Value.absent(),
            Value<String?> eventId = const Value.absent(),
            Value<String> kind = const Value.absent(),
            Value<DateTime> expiryDate = const Value.absent(),
            Value<String> reminderDaysBefore = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WarrantiesCompanion(
            id: id,
            productId: productId,
            eventId: eventId,
            kind: kind,
            expiryDate: expiryDate,
            reminderDaysBefore: reminderDaysBefore,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> productId = const Value.absent(),
            Value<String?> eventId = const Value.absent(),
            required String kind,
            required DateTime expiryDate,
            Value<String> reminderDaysBefore = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WarrantiesCompanion.insert(
            id: id,
            productId: productId,
            eventId: eventId,
            kind: kind,
            expiryDate: expiryDate,
            reminderDaysBefore: reminderDaysBefore,
            rowid: rowid,
          ),
        ));
}

class $$WarrantiesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $WarrantiesTable> {
  $$WarrantiesTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get kind => $state.composableBuilder(
      column: $state.table.kind,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get expiryDate => $state.composableBuilder(
      column: $state.table.expiryDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get reminderDaysBefore => $state.composableBuilder(
      column: $state.table.reminderDaysBefore,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $state.db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProductsTableFilterComposer(ComposerState(
                $state.db, $state.db.products, joinBuilder, parentComposers)));
    return composer;
  }

  $$EventsTableFilterComposer get eventId {
    final $$EventsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.eventId,
        referencedTable: $state.db.events,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$EventsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.events, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$WarrantiesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $WarrantiesTable> {
  $$WarrantiesTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get kind => $state.composableBuilder(
      column: $state.table.kind,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get expiryDate => $state.composableBuilder(
      column: $state.table.expiryDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get reminderDaysBefore => $state.composableBuilder(
      column: $state.table.reminderDaysBefore,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $state.db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProductsTableOrderingComposer(ComposerState(
                $state.db, $state.db.products, joinBuilder, parentComposers)));
    return composer;
  }

  $$EventsTableOrderingComposer get eventId {
    final $$EventsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.eventId,
        referencedTable: $state.db.events,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$EventsTableOrderingComposer(ComposerState(
                $state.db, $state.db.events, joinBuilder, parentComposers)));
    return composer;
  }
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$EventsTableTableManager get events =>
      $$EventsTableTableManager(_db, _db.events);
  $$JournalRevisionsTableTableManager get journalRevisions =>
      $$JournalRevisionsTableTableManager(_db, _db.journalRevisions);
  $$AttachmentsTableTableManager get attachments =>
      $$AttachmentsTableTableManager(_db, _db.attachments);
  $$WarrantiesTableTableManager get warranties =>
      $$WarrantiesTableTableManager(_db, _db.warranties);
}
