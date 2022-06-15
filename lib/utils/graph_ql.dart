import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:utilities/utilities.dart';

GraphQLClient _getGraphQlClient({required String url, String? accessToken}) {
  Link link = HttpLink(url);
  if (accessToken != null) link = AuthLink(getToken: () async => accessToken).concat(HttpLink(url));
  GraphQLClient client = GraphQLClient(link: link, cache: GraphQLCache(store: InMemoryStore()));
  return client;
}

Future<void> query({
  required String url,
  required String query,
  required Function(Map<String, dynamic>?) error,
  required Function(Map<String, dynamic>? result) action,
  FetchPolicy fetchPolicy = FetchPolicy.networkOnly,
}) async {
  QueryResult res = await _getGraphQlClient(
    url: url,
    accessToken: getString(UtilitiesConstants.token),
  ).query(QueryOptions(document: gql(query), fetchPolicy: fetchPolicy));
  if (res.hasException)
    error(res.data);
  else
    action(res.data);
}

Future<void> mutation({
  required String mainPath,
  required String query,
  required Function(Map<String, dynamic>?) error,
  required Function(Map<String, dynamic>? result) action,
  FetchPolicy fetchPolicy = FetchPolicy.networkOnly,
}) async {
  QueryResult res = await _getGraphQlClient(
    url: mainPath,
    accessToken: getString(UtilitiesConstants.token),
  ).mutate(MutationOptions(document: gql(query), fetchPolicy: fetchPolicy));
  if (res.hasException)
    error(res.data);
  else
    action(res.data);
}
