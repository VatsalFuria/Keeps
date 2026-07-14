// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allProductsHash() => r'3e51635f0366c5ef863dec5c28086e21398d187f';

/// See also [allProducts].
@ProviderFor(allProducts)
final allProductsProvider = AutoDisposeStreamProvider<List<Product>>.internal(
  allProducts,
  name: r'allProductsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllProductsRef = AutoDisposeStreamProviderRef<List<Product>>;
String _$productHash() => r'566705a24690367672c708c46b2cce1ff5f467a3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [product].
@ProviderFor(product)
const productProvider = ProductFamily();

/// See also [product].
class ProductFamily extends Family<AsyncValue<Product?>> {
  /// See also [product].
  const ProductFamily();

  /// See also [product].
  ProductProvider call(
    String id,
  ) {
    return ProductProvider(
      id,
    );
  }

  @override
  ProductProvider getProviderOverride(
    covariant ProductProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productProvider';
}

/// See also [product].
class ProductProvider extends AutoDisposeStreamProvider<Product?> {
  /// See also [product].
  ProductProvider(
    String id,
  ) : this._internal(
          (ref) => product(
            ref as ProductRef,
            id,
          ),
          from: productProvider,
          name: r'productProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productHash,
          dependencies: ProductFamily._dependencies,
          allTransitiveDependencies: ProductFamily._allTransitiveDependencies,
          id: id,
        );

  ProductProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    Stream<Product?> Function(ProductRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductProvider._internal(
        (ref) => create(ref as ProductRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Product?> createElement() {
    return _ProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductRef on AutoDisposeStreamProviderRef<Product?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ProductProviderElement extends AutoDisposeStreamProviderElement<Product?>
    with ProductRef {
  _ProductProviderElement(super.provider);

  @override
  String get id => (origin as ProductProvider).id;
}

String _$productEventsHash() => r'3f746aae4c4dc1db7c572ef928014b8361f4d281';

/// See also [productEvents].
@ProviderFor(productEvents)
const productEventsProvider = ProductEventsFamily();

/// See also [productEvents].
class ProductEventsFamily extends Family<AsyncValue<List<Event>>> {
  /// See also [productEvents].
  const ProductEventsFamily();

  /// See also [productEvents].
  ProductEventsProvider call(
    String productId,
  ) {
    return ProductEventsProvider(
      productId,
    );
  }

  @override
  ProductEventsProvider getProviderOverride(
    covariant ProductEventsProvider provider,
  ) {
    return call(
      provider.productId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productEventsProvider';
}

/// See also [productEvents].
class ProductEventsProvider extends AutoDisposeStreamProvider<List<Event>> {
  /// See also [productEvents].
  ProductEventsProvider(
    String productId,
  ) : this._internal(
          (ref) => productEvents(
            ref as ProductEventsRef,
            productId,
          ),
          from: productEventsProvider,
          name: r'productEventsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productEventsHash,
          dependencies: ProductEventsFamily._dependencies,
          allTransitiveDependencies:
              ProductEventsFamily._allTransitiveDependencies,
          productId: productId,
        );

  ProductEventsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final String productId;

  @override
  Override overrideWith(
    Stream<List<Event>> Function(ProductEventsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductEventsProvider._internal(
        (ref) => create(ref as ProductEventsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Event>> createElement() {
    return _ProductEventsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductEventsProvider && other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductEventsRef on AutoDisposeStreamProviderRef<List<Event>> {
  /// The parameter `productId` of this provider.
  String get productId;
}

class _ProductEventsProviderElement
    extends AutoDisposeStreamProviderElement<List<Event>>
    with ProductEventsRef {
  _ProductEventsProviderElement(super.provider);

  @override
  String get productId => (origin as ProductEventsProvider).productId;
}

String _$journalHistoryHash() => r'cd4f493a566f8e1967f3e274ce93e981d6a3e54c';

/// See also [journalHistory].
@ProviderFor(journalHistory)
const journalHistoryProvider = JournalHistoryFamily();

/// See also [journalHistory].
class JournalHistoryFamily extends Family<AsyncValue<List<JournalRevision>>> {
  /// See also [journalHistory].
  const JournalHistoryFamily();

  /// See also [journalHistory].
  JournalHistoryProvider call(
    String productId,
  ) {
    return JournalHistoryProvider(
      productId,
    );
  }

  @override
  JournalHistoryProvider getProviderOverride(
    covariant JournalHistoryProvider provider,
  ) {
    return call(
      provider.productId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'journalHistoryProvider';
}

/// See also [journalHistory].
class JournalHistoryProvider
    extends AutoDisposeStreamProvider<List<JournalRevision>> {
  /// See also [journalHistory].
  JournalHistoryProvider(
    String productId,
  ) : this._internal(
          (ref) => journalHistory(
            ref as JournalHistoryRef,
            productId,
          ),
          from: journalHistoryProvider,
          name: r'journalHistoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$journalHistoryHash,
          dependencies: JournalHistoryFamily._dependencies,
          allTransitiveDependencies:
              JournalHistoryFamily._allTransitiveDependencies,
          productId: productId,
        );

  JournalHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final String productId;

  @override
  Override overrideWith(
    Stream<List<JournalRevision>> Function(JournalHistoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: JournalHistoryProvider._internal(
        (ref) => create(ref as JournalHistoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<JournalRevision>> createElement() {
    return _JournalHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is JournalHistoryProvider && other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin JournalHistoryRef on AutoDisposeStreamProviderRef<List<JournalRevision>> {
  /// The parameter `productId` of this provider.
  String get productId;
}

class _JournalHistoryProviderElement
    extends AutoDisposeStreamProviderElement<List<JournalRevision>>
    with JournalHistoryRef {
  _JournalHistoryProviderElement(super.provider);

  @override
  String get productId => (origin as JournalHistoryProvider).productId;
}

String _$productStatsHash() => r'38b7d93a0fdc60e8b8403a40c88610307faa0892';

/// See also [productStats].
@ProviderFor(productStats)
const productStatsProvider = ProductStatsFamily();

/// See also [productStats].
class ProductStatsFamily extends Family<AsyncValue<ProductStats>> {
  /// See also [productStats].
  const ProductStatsFamily();

  /// See also [productStats].
  ProductStatsProvider call(
    String productId,
  ) {
    return ProductStatsProvider(
      productId,
    );
  }

  @override
  ProductStatsProvider getProviderOverride(
    covariant ProductStatsProvider provider,
  ) {
    return call(
      provider.productId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productStatsProvider';
}

/// See also [productStats].
class ProductStatsProvider extends AutoDisposeFutureProvider<ProductStats> {
  /// See also [productStats].
  ProductStatsProvider(
    String productId,
  ) : this._internal(
          (ref) => productStats(
            ref as ProductStatsRef,
            productId,
          ),
          from: productStatsProvider,
          name: r'productStatsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productStatsHash,
          dependencies: ProductStatsFamily._dependencies,
          allTransitiveDependencies:
              ProductStatsFamily._allTransitiveDependencies,
          productId: productId,
        );

  ProductStatsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final String productId;

  @override
  Override overrideWith(
    FutureOr<ProductStats> Function(ProductStatsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductStatsProvider._internal(
        (ref) => create(ref as ProductStatsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ProductStats> createElement() {
    return _ProductStatsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductStatsProvider && other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductStatsRef on AutoDisposeFutureProviderRef<ProductStats> {
  /// The parameter `productId` of this provider.
  String get productId;
}

class _ProductStatsProviderElement
    extends AutoDisposeFutureProviderElement<ProductStats>
    with ProductStatsRef {
  _ProductStatsProviderElement(super.provider);

  @override
  String get productId => (origin as ProductStatsProvider).productId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
