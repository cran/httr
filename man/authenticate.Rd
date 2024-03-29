% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/authenticate.r
\name{authenticate}
\alias{authenticate}
\title{Use http authentication.}
\usage{
authenticate(user, password, type = "basic")
}
\arguments{
\item{user}{user name}

\item{password}{password}

\item{type}{type of HTTP authentication.  Should be one of the following
types supported by Curl: basic, digest, digest_ie, gssnegotiate,
ntlm, any.  It defaults to "basic", the most common type.}
}
\description{
It's not obvious how to turn authentication off after using it, so
I recommend using custom handles with authentication.
}
\examples{
\dontrun{
GET("http://httpbin.org/basic-auth/user/passwd")
GET(
  "http://httpbin.org/basic-auth/user/passwd",
  authenticate("user", "passwd")
)
}
}
\seealso{
Other config: 
\code{\link{add_headers}()},
\code{\link{config}()},
\code{\link{set_cookies}()},
\code{\link{timeout}()},
\code{\link{use_proxy}()},
\code{\link{user_agent}()},
\code{\link{verbose}()}
}
\concept{config}
