#' Create a handle tied to a particular host.
#'
#' This handle preserves settings and cookies across multiple requests. It is
#' the foundation of all requests performed through the httr package, although
#' it will mostly be hidden from the user.
#'
#' @param url full url to site
#' @param cookies if \code{TRUE} (the default), maintain cookies across
#'   requests.
#' @export
#' @examples
#' handle("http://google.com")
#' handle("https://google.com")
#'
#' h <- handle("http://google.com")
#' GET(handle = h)
#' # Should see cookies sent back to server
#' GET(handle = h, config = verbose())
#'
#' h <- handle("http://google.com", cookies = FALSE)
#' GET(handle = h)$cookies
handle <- function(url, cookies = TRUE) {
  stopifnot(is.character(url), length(url) == 1)

  url <- parse_url(url)
  cookie_path <- if (cookies) tempfile() else NULL

  h <- RCurl::getCurlHandle(cookiefile = cookie_path, .defaults = list())
  structure(list(handle = h, url = url), class = "handle")
}

#' @export
print.handle <- function(x, ...) {
  cat("Host: ", build_url(x$url) , " <", ref(x), ">\n", sep = "")
}

ref <- function(x) {
  str_extract(capture.output(print(x$handle@ref)), "0x[0-9a-f]*")
}

is.handle <- function(x) inherits(x, "handle")

reset_handle_config <- function(handle, config) {
  # Calls curl_easy_reset (http://curl.haxx.se/libcurl/c/curl_easy_reset.html)
  # Does not change live connections, session ID cache, DNS cache, cookies
  # or shares.
  RCurl::reset(handle$handle)
  invisible(TRUE)
}

