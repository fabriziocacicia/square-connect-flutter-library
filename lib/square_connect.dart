import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:square_connect/src/catalog/catalog.dart';

export 'package:square_connect/src/catalog/catalog-return-objects.dart';
export 'package:square_connect/src/catalog/catalog-objects.dart';
export 'package:square_connect/src/catalog/catalog-enums.dart';

class SquareConnect {

  String _authToken;
  Client _client;

  /// Object containing all API access. To obtain one, use `SquareConnect.instance`.
  SquareConnect() {
    this._client = IOClient();
  }

  /// Entry point for API. Creates an API client to be reused for calls.
  static SquareConnect get instance {
    return SquareConnect();
  }

  /// Sets the authorization token of the client for use in all calls. Must be set before any other calls are made.
  setAuthToken({String token}) {
    this._authToken = token;
  }

  /// Sets the [HttpClient] for use in making API calls. By default, [IOClient] is used.
  setClient({Client client}) {
    this._client = client;
  }

  /// Getter for Catalog API methods.
  CatalogApi get catalogApi {
    return CatalogApi(token: _authToken, client: _client);
  }
}
