% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/response-status.r
\name{http_error}
\alias{http_error}
\alias{url_success}
\alias{url_ok}
\title{Check for an http error.}
\usage{
http_error(x, ...)
}
\arguments{
\item{x}{Object to check. Default methods are provided for strings
(which perform an \code{\link[=HEAD]{HEAD()}} request), responses, and
integer status codes.}

\item{...}{Other arguments passed on to methods.}
}
\value{
\code{TRUE} if the request fails (status code 400 or above),
otherwise \code{FALSE}.
}
\description{
Check for an http error.
}
\examples{
\dontrun{
# You can pass a url:
http_error("http://www.google.com")
http_error("http://httpbin.org/status/404")

# Or a request
r <- GET("http://httpbin.org/status/201")
http_error(r)
}

# Or an (integer) status code
http_error(200L)
http_error(404L)
}
\seealso{
Other response methods: 
\code{\link{content}()},
\code{\link{http_status}()},
\code{\link{response}()},
\code{\link{stop_for_status}()}
}
\concept{response methods}
