class ErrorInfo {
  final String title;
  final String message;
  final String cta;

  ErrorInfo(this.title, this.message, {this.cta = 'Refresh'});
}

ErrorInfo getErrorInfo(String errorType) {
  switch (errorType) {
    case "error_server":
      return ErrorInfo(
        "Server Error",
        "Sorry, our server is under construction and we are fixing it",
      );
    case "no_connection":
      return ErrorInfo(
        "No internet connection",
        "Please check your internet connection and try again.",
        cta: "Try Again",
      );
    case "not_found":
      return ErrorInfo(
        "Page not found or maybe it will coming soon!",
        "But don't worry, you can still find plenty of great stuff here.",
      );
    default:
      return ErrorInfo("Unknown Error", "An Unexpected error occurred.");
  }
}
