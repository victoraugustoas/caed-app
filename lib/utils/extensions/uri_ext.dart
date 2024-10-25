extension UriFormat on Uri {
  /// Create uri with path and params
  ///
  /// ```dart
  /// url.make(pathJoin: [auth, 'login'], queryParameters: {'query': 'abc'});
  ///
  /// // for path params, the convention is the string stats with ':'
  /// url.make(pathJoin: ["user", "plan", ":id"]);
  /// ```
  Uri make({
    Iterable<String>? pathJoin,
    Map<String, dynamic /*String|Iterable<String>*/ >? queryParameters,
  }) {
    return replace(
      pathSegments: [...pathSegments, ...?pathJoin],
      queryParameters: queryParameters,
    );
  }

  /// Add [queryParameters] in url
  ///
  /// ```dart
  /// url.withQParams({'query': 'abc'});
  /// ```
  Uri withQParams(
    Map<String, dynamic /*String|Iterable<String>*/ > queryParameters,
  ) {
    return replace(
      queryParameters: queryParameters.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );
  }

  /// Replace [pathParameters] in url
  ///
  /// ```dart
  /// url.withPathParams({':id': 'abc', ':proposal_code': '123456'});
  /// ```
  Uri withPathParams(
    Map<String, dynamic /*String|Iterable<String>*/ > pathParameters,
  ) {
    final List<String> newPathSegments = pathSegments.map((segment) {
      return pathParameters.keys.contains(segment)
          ? pathParameters[segment]!.toString()
          : segment;
    }).toList();

    return replace(
      pathSegments: newPathSegments,
    );
  }

  /// to string value
  String get str => toString();
}
