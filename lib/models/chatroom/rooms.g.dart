// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class RoomCollectionReference
    implements RoomQuery, FirestoreCollectionReference<RoomQuerySnapshot> {
  factory RoomCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$RoomCollectionReference;

  static Room fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Room.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Room value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  RoomDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<RoomDocumentReference> add(Room value);
}

class _$RoomCollectionReference extends _$RoomQuery
    implements RoomCollectionReference {
  factory _$RoomCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$RoomCollectionReference._(
      firestore.collection('rooms').withConverter(
            fromFirestore: RoomCollectionReference.fromFirestore,
            toFirestore: RoomCollectionReference.toFirestore,
          ),
    );
  }

  _$RoomCollectionReference._(
    CollectionReference<Room> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Room> get reference =>
      super.reference as CollectionReference<Room>;

  @override
  RoomDocumentReference doc([String? id]) {
    return RoomDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<RoomDocumentReference> add(Room value) {
    return reference.add(value).then((ref) => RoomDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$RoomCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class RoomDocumentReference
    extends FirestoreDocumentReference<RoomDocumentSnapshot> {
  factory RoomDocumentReference(DocumentReference<Room> reference) =
      _$RoomDocumentReference;

  DocumentReference<Room> get reference;

  /// A reference to the [RoomCollectionReference] containing this document.
  RoomCollectionReference get parent {
    return _$RoomCollectionReference(reference.firestore);
  }

  late final RoomMessageCollectionReference messages =
      _$RoomMessageCollectionReference(
    reference,
  );

  @override
  Stream<RoomDocumentSnapshot> snapshots();

  @override
  Future<RoomDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String id,
    String name,
    String description,
    String lastMessage,
  });

  Future<void> set(Room value);
}

class _$RoomDocumentReference
    extends FirestoreDocumentReference<RoomDocumentSnapshot>
    implements RoomDocumentReference {
  _$RoomDocumentReference(this.reference);

  @override
  final DocumentReference<Room> reference;

  /// A reference to the [RoomCollectionReference] containing this document.
  RoomCollectionReference get parent {
    return _$RoomCollectionReference(reference.firestore);
  }

  late final RoomMessageCollectionReference messages =
      _$RoomMessageCollectionReference(
    reference,
  );

  @override
  Stream<RoomDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return RoomDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<RoomDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return RoomDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? id = _sentinel,
    Object? name = _sentinel,
    Object? description = _sentinel,
    Object? lastMessage = _sentinel,
  }) async {
    final json = {
      if (id != _sentinel) "id": id as String,
      if (name != _sentinel) "name": name as String,
      if (description != _sentinel) "description": description as String,
      if (lastMessage != _sentinel) "lastMessage": lastMessage as String,
    };

    return reference.update(json);
  }

  Future<void> set(Room value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class RoomDocumentSnapshot extends FirestoreDocumentSnapshot {
  RoomDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Room> snapshot;

  @override
  RoomDocumentReference get reference {
    return RoomDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Room? data;
}

abstract class RoomQuery implements QueryReference<RoomQuerySnapshot> {
  @override
  RoomQuery limit(int limit);

  @override
  RoomQuery limitToLast(int limit);

  RoomQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  RoomQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  RoomQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  RoomQuery whereLastMessage({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  RoomQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RoomDocumentSnapshot? startAtDocument,
    RoomDocumentSnapshot? endAtDocument,
    RoomDocumentSnapshot? endBeforeDocument,
    RoomDocumentSnapshot? startAfterDocument,
  });

  RoomQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RoomDocumentSnapshot? startAtDocument,
    RoomDocumentSnapshot? endAtDocument,
    RoomDocumentSnapshot? endBeforeDocument,
    RoomDocumentSnapshot? startAfterDocument,
  });

  RoomQuery orderByDescription({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RoomDocumentSnapshot? startAtDocument,
    RoomDocumentSnapshot? endAtDocument,
    RoomDocumentSnapshot? endBeforeDocument,
    RoomDocumentSnapshot? startAfterDocument,
  });

  RoomQuery orderByLastMessage({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RoomDocumentSnapshot? startAtDocument,
    RoomDocumentSnapshot? endAtDocument,
    RoomDocumentSnapshot? endBeforeDocument,
    RoomDocumentSnapshot? startAfterDocument,
  });
}

class _$RoomQuery extends QueryReference<RoomQuerySnapshot>
    implements RoomQuery {
  _$RoomQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Room> reference;

  RoomQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Room> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return RoomQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<RoomDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: RoomDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return RoomQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<RoomQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<RoomQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  RoomQuery limit(int limit) {
    return _$RoomQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  RoomQuery limitToLast(int limit) {
    return _$RoomQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  RoomQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$RoomQuery(
      reference.where(
        'id',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RoomQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$RoomQuery(
      reference.where(
        'name',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RoomQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$RoomQuery(
      reference.where(
        'description',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RoomQuery whereLastMessage({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$RoomQuery(
      reference.where(
        'lastMessage',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RoomQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RoomDocumentSnapshot? startAtDocument,
    RoomDocumentSnapshot? endAtDocument,
    RoomDocumentSnapshot? endBeforeDocument,
    RoomDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('id', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RoomQuery(query, _collection);
  }

  RoomQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RoomDocumentSnapshot? startAtDocument,
    RoomDocumentSnapshot? endAtDocument,
    RoomDocumentSnapshot? endBeforeDocument,
    RoomDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RoomQuery(query, _collection);
  }

  RoomQuery orderByDescription({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RoomDocumentSnapshot? startAtDocument,
    RoomDocumentSnapshot? endAtDocument,
    RoomDocumentSnapshot? endBeforeDocument,
    RoomDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('description', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RoomQuery(query, _collection);
  }

  RoomQuery orderByLastMessage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RoomDocumentSnapshot? startAtDocument,
    RoomDocumentSnapshot? endAtDocument,
    RoomDocumentSnapshot? endBeforeDocument,
    RoomDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('lastMessage', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RoomQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$RoomQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class RoomQuerySnapshot
    extends FirestoreQuerySnapshot<RoomQueryDocumentSnapshot> {
  RoomQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Room> snapshot;

  @override
  final List<RoomQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<RoomDocumentSnapshot>> docChanges;
}

class RoomQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements RoomDocumentSnapshot {
  RoomQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Room> snapshot;

  @override
  RoomDocumentReference get reference {
    return RoomDocumentReference(snapshot.reference);
  }

  @override
  final Room data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class RoomMessageCollectionReference
    implements
        RoomMessageQuery,
        FirestoreCollectionReference<RoomMessageQuerySnapshot> {
  factory RoomMessageCollectionReference(
    DocumentReference<Room> parent,
  ) = _$RoomMessageCollectionReference;

  static RoomMessage fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return RoomMessage.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    RoomMessage value,
    SetOptions? options,
  ) {
    return _$RoomMessageToJson(value);
  }

  /// A reference to the containing [RoomDocumentReference] if this is a subcollection.
  RoomDocumentReference get parent;

  @override
  RoomMessageDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<RoomMessageDocumentReference> add(RoomMessage value);
}

class _$RoomMessageCollectionReference extends _$RoomMessageQuery
    implements RoomMessageCollectionReference {
  factory _$RoomMessageCollectionReference(
    DocumentReference<Room> parent,
  ) {
    return _$RoomMessageCollectionReference._(
      RoomDocumentReference(parent),
      parent.collection('messages').withConverter(
            fromFirestore: RoomMessageCollectionReference.fromFirestore,
            toFirestore: RoomMessageCollectionReference.toFirestore,
          ),
    );
  }

  _$RoomMessageCollectionReference._(
    this.parent,
    CollectionReference<RoomMessage> reference,
  ) : super(reference, reference);

  @override
  final RoomDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<RoomMessage> get reference =>
      super.reference as CollectionReference<RoomMessage>;

  @override
  RoomMessageDocumentReference doc([String? id]) {
    return RoomMessageDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<RoomMessageDocumentReference> add(RoomMessage value) {
    return reference
        .add(value)
        .then((ref) => RoomMessageDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$RoomMessageCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class RoomMessageDocumentReference
    extends FirestoreDocumentReference<RoomMessageDocumentSnapshot> {
  factory RoomMessageDocumentReference(
          DocumentReference<RoomMessage> reference) =
      _$RoomMessageDocumentReference;

  DocumentReference<RoomMessage> get reference;

  /// A reference to the [RoomMessageCollectionReference] containing this document.
  RoomMessageCollectionReference get parent {
    return _$RoomMessageCollectionReference(
      reference.parent.parent!.withConverter<Room>(
        fromFirestore: RoomCollectionReference.fromFirestore,
        toFirestore: RoomCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<RoomMessageDocumentSnapshot> snapshots();

  @override
  Future<RoomMessageDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String content,
  });

  Future<void> set(RoomMessage value);
}

class _$RoomMessageDocumentReference
    extends FirestoreDocumentReference<RoomMessageDocumentSnapshot>
    implements RoomMessageDocumentReference {
  _$RoomMessageDocumentReference(this.reference);

  @override
  final DocumentReference<RoomMessage> reference;

  /// A reference to the [RoomMessageCollectionReference] containing this document.
  RoomMessageCollectionReference get parent {
    return _$RoomMessageCollectionReference(
      reference.parent.parent!.withConverter<Room>(
        fromFirestore: RoomCollectionReference.fromFirestore,
        toFirestore: RoomCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<RoomMessageDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return RoomMessageDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<RoomMessageDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return RoomMessageDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? content = _sentinel,
  }) async {
    final json = {
      if (content != _sentinel) "content": content as String,
    };

    return reference.update(json);
  }

  Future<void> set(RoomMessage value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomMessageDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class RoomMessageDocumentSnapshot extends FirestoreDocumentSnapshot {
  RoomMessageDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<RoomMessage> snapshot;

  @override
  RoomMessageDocumentReference get reference {
    return RoomMessageDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final RoomMessage? data;
}

abstract class RoomMessageQuery
    implements QueryReference<RoomMessageQuerySnapshot> {
  @override
  RoomMessageQuery limit(int limit);

  @override
  RoomMessageQuery limitToLast(int limit);

  RoomMessageQuery whereContent({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  RoomMessageQuery orderByContent({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RoomMessageDocumentSnapshot? startAtDocument,
    RoomMessageDocumentSnapshot? endAtDocument,
    RoomMessageDocumentSnapshot? endBeforeDocument,
    RoomMessageDocumentSnapshot? startAfterDocument,
  });
}

class _$RoomMessageQuery extends QueryReference<RoomMessageQuerySnapshot>
    implements RoomMessageQuery {
  _$RoomMessageQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<RoomMessage> reference;

  RoomMessageQuerySnapshot _decodeSnapshot(
    QuerySnapshot<RoomMessage> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return RoomMessageQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<RoomMessageDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: RoomMessageDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return RoomMessageQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<RoomMessageQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<RoomMessageQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  RoomMessageQuery limit(int limit) {
    return _$RoomMessageQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  RoomMessageQuery limitToLast(int limit) {
    return _$RoomMessageQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  RoomMessageQuery whereContent({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$RoomMessageQuery(
      reference.where(
        'content',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RoomMessageQuery orderByContent({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RoomMessageDocumentSnapshot? startAtDocument,
    RoomMessageDocumentSnapshot? endAtDocument,
    RoomMessageDocumentSnapshot? endBeforeDocument,
    RoomMessageDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('content', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RoomMessageQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$RoomMessageQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class RoomMessageQuerySnapshot
    extends FirestoreQuerySnapshot<RoomMessageQueryDocumentSnapshot> {
  RoomMessageQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<RoomMessage> snapshot;

  @override
  final List<RoomMessageQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<RoomMessageDocumentSnapshot>> docChanges;
}

class RoomMessageQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements RoomMessageDocumentSnapshot {
  RoomMessageQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<RoomMessage> snapshot;

  @override
  RoomMessageDocumentReference get reference {
    return RoomMessageDocumentReference(snapshot.reference);
  }

  @override
  final RoomMessage data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      lastMessage: json['lastMessage'] as String,
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'lastMessage': instance.lastMessage,
    };

RoomMessage _$RoomMessageFromJson(Map<String, dynamic> json) => RoomMessage(
      sender: User.fromJson(json['sender'] as Map<String, dynamic>),
      timestamp: DateTime.parse(json['timestamp'] as String),
      content: json['content'] as String,
    );

Map<String, dynamic> _$RoomMessageToJson(RoomMessage instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'timestamp': instance.timestamp.toIso8601String(),
      'content': instance.content,
    };
