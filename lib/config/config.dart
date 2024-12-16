// =============================================================================
//  APP BASE URL: **************************************************************
// =============================================================================

///
/// Prefix URL for Rest API.
///

const appBaseURL = "http://localhost:8080";

// =============================================================================
// STATIC RESOURCE BASE URL: ***************************************************
// =============================================================================

///
/// Prefix URL for Static Resources (Profile Image, Icon,..)
///
const staticResourceBaseURL = "http://localhost:8080";

// =============================================================================
//
// =============================================================================

String? getStaticResourceURL(String? path) {
  if (path == null || path.isEmpty) {
    return null;
  }
  if (path.startsWith("http://") || path.startsWith("https://")) {
    return path;
  }
  return "$staticResourceBaseURL$path";
}
