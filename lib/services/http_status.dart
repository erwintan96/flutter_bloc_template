@Since("2.2")
class Since {
  final String version;
  const Since(this.version);
}
abstract class HttpStatus {
  static const int continue_ = 100;
  static const int switchingProtocols = 101;
  @Since("2.1")
  static const int processing = 102;
  static const int ok = 200;
  static const int created = 201;
  static const int accepted = 202;
  static const int nonAuthoritativeInformation = 203;
  static const int noContent = 204;
  static const int resetContent = 205;
  static const int partialContent = 206;
  @Since("2.1")
  static const int multiStatus = 207;
  @Since("2.1")
  static const int alreadyReported = 208;
  @Since("2.1")
  static const int imUsed = 226;
  static const int multipleChoices = 300;
  static const int movedPermanently = 301;
  static const int found = 302;
  static const int movedTemporarily = 302; // Common alias for found.
  static const int seeOther = 303;
  static const int notModified = 304;
  static const int useProxy = 305;
  static const int temporaryRedirect = 307;
  @Since("2.1")
  static const int permanentRedirect = 308;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int paymentRequired = 402;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int methodNotAllowed = 405;
  static const int notAcceptable = 406;
  static const int proxyAuthenticationRequired = 407;
  static const int requestTimeout = 408;
  static const int conflict = 409;
  static const int gone = 410;
  static const int lengthRequired = 411;
  static const int preconditionFailed = 412;
  static const int requestEntityTooLarge = 413;
  static const int requestUriTooLong = 414;
  static const int unsupportedMediaType = 415;
  static const int requestedRangeNotSatisfiable = 416;
  static const int expectationFailed = 417;
  @Since("2.1")
  static const int misdirectedRequest = 421;
  @Since("2.1")
  static const int unprocessableEntity = 422;
  @Since("2.1")
  static const int locked = 423;
  @Since("2.1")
  static const int failedDependency = 424;
  static const int upgradeRequired = 426;
  @Since("2.1")
  static const int preconditionRequired = 428;
  @Since("2.1")
  static const int tooManyRequests = 429;
  @Since("2.1")
  static const int requestHeaderFieldsTooLarge = 431;
  @Since("2.1")
  static const int connectionClosedWithoutResponse = 444;
  @Since("2.1")
  static const int unavailableForLegalReasons = 451;
  @Since("2.1")
  static const int clientClosedRequest = 499;
  static const int internalServerError = 500;
  static const int notImplemented = 501;
  static const int badGateway = 502;
  static const int serviceUnavailable = 503;
  static const int gatewayTimeout = 504;
  static const int httpVersionNotSupported = 505;
  @Since("2.1")
  static const int variantAlsoNegotiates = 506;
  @Since("2.1")
  static const int insufficientStorage = 507;
  @Since("2.1")
  static const int loopDetected = 508;
  @Since("2.1")
  static const int notExtended = 510;
  @Since("2.1")
  static const int networkAuthenticationRequired = 511;
  // Client generated status code.
  static const int networkConnectTimeoutError = 599;

  @Deprecated("Use continue_ instead")
  static const int CONTINUE = continue_;
  @Deprecated("Use switchingProtocols instead")
  static const int SWITCHING_PROTOCOLS = switchingProtocols;
  @Deprecated("Use ok instead")
  static const int OK = ok;
  @Deprecated("Use created instead")
  static const int CREATED = created;
  @Deprecated("Use accepted instead")
  static const int ACCEPTED = accepted;
  @Deprecated("Use nonAuthoritativeInformation instead")
  static const int NON_AUTHORITATIVE_INFORMATION = nonAuthoritativeInformation;
  @Deprecated("Use noContent instead")
  static const int NO_CONTENT = noContent;
  @Deprecated("Use resetContent instead")
  static const int RESET_CONTENT = resetContent;
  @Deprecated("Use partialContent instead")
  static const int PARTIAL_CONTENT = partialContent;
  @Deprecated("Use multipleChoices instead")
  static const int MULTIPLE_CHOICES = multipleChoices;
  @Deprecated("Use movedPermanently instead")
  static const int MOVED_PERMANENTLY = movedPermanently;
  @Deprecated("Use found instead")
  static const int FOUND = found;
  @Deprecated("Use movedTemporarily instead")
  static const int MOVED_TEMPORARILY = movedTemporarily;
  @Deprecated("Use seeOther instead")
  static const int SEE_OTHER = seeOther;
  @Deprecated("Use notModified instead")
  static const int NOT_MODIFIED = notModified;
  @Deprecated("Use useProxy instead")
  static const int USE_PROXY = useProxy;
  @Deprecated("Use temporaryRedirect instead")
  static const int TEMPORARY_REDIRECT = temporaryRedirect;
  @Deprecated("Use badRequest instead")
  static const int BAD_REQUEST = badRequest;
  @Deprecated("Use unauthorized instead")
  static const int UNAUTHORIZED = unauthorized;
  @Deprecated("Use paymentRequired instead")
  static const int PAYMENT_REQUIRED = paymentRequired;
  @Deprecated("Use forbidden instead")
  static const int FORBIDDEN = forbidden;
  @Deprecated("Use notFound instead")
  static const int NOT_FOUND = notFound;
  @Deprecated("Use methodNotAllowed instead")
  static const int METHOD_NOT_ALLOWED = methodNotAllowed;
  @Deprecated("Use notAcceptable instead")
  static const int NOT_ACCEPTABLE = notAcceptable;
  @Deprecated("Use proxyAuthenticationRequired instead")
  static const int PROXY_AUTHENTICATION_REQUIRED = proxyAuthenticationRequired;
  @Deprecated("Use requestTimeout instead")
  static const int REQUEST_TIMEOUT = requestTimeout;
  @Deprecated("Use conflict instead")
  static const int CONFLICT = conflict;
  @Deprecated("Use gone instead")
  static const int GONE = gone;
  @Deprecated("Use lengthRequired instead")
  static const int LENGTH_REQUIRED = lengthRequired;
  @Deprecated("Use preconditionFailed instead")
  static const int PRECONDITION_FAILED = preconditionFailed;
  @Deprecated("Use requestEntityTooLarge instead")
  static const int REQUEST_ENTITY_TOO_LARGE = requestEntityTooLarge;
  @Deprecated("Use requestUriTooLong instead")
  static const int REQUEST_URI_TOO_LONG = requestUriTooLong;
  @Deprecated("Use unsupportedMediaType instead")
  static const int UNSUPPORTED_MEDIA_TYPE = unsupportedMediaType;
  @Deprecated("Use requestedRangeNotSatisfiable instead")
  static const int REQUESTED_RANGE_NOT_SATISFIABLE =
      requestedRangeNotSatisfiable;
  @Deprecated("Use expectationFailed instead")
  static const int EXPECTATION_FAILED = expectationFailed;
  @Deprecated("Use upgradeRequired instead")
  static const int UPGRADE_REQUIRED = upgradeRequired;
  @Deprecated("Use internalServerError instead")
  static const int INTERNAL_SERVER_ERROR = internalServerError;
  @Deprecated("Use notImplemented instead")
  static const int NOT_IMPLEMENTED = notImplemented;
  @Deprecated("Use badGateway instead")
  static const int BAD_GATEWAY = badGateway;
  @Deprecated("Use serviceUnavailable instead")
  static const int SERVICE_UNAVAILABLE = serviceUnavailable;
  @Deprecated("Use gatewayTimeout instead")
  static const int GATEWAY_TIMEOUT = gatewayTimeout;
  @Deprecated("Use httpVersionNotSupported instead")
  static const int HTTP_VERSION_NOT_SUPPORTED = httpVersionNotSupported;
  @Deprecated("Use networkConnectTimeoutError instead")
  static const int NETWORK_CONNECT_TIMEOUT_ERROR = networkConnectTimeoutError;
}