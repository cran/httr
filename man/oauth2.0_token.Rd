% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/oauth-token.r
\name{oauth2.0_token}
\alias{oauth2.0_token}
\title{Generate an oauth2.0 token.}
\usage{
oauth2.0_token(
  endpoint,
  app,
  scope = NULL,
  user_params = NULL,
  type = NULL,
  use_oob = getOption("httr_oob_default"),
  oob_value = NULL,
  as_header = TRUE,
  use_basic_auth = FALSE,
  cache = getOption("httr_oauth_cache"),
  config_init = list(),
  client_credentials = FALSE,
  credentials = NULL,
  query_authorize_extra = list()
)
}
\arguments{
\item{endpoint}{An OAuth endpoint, created by \code{\link[=oauth_endpoint]{oauth_endpoint()}}}

\item{app}{An OAuth consumer application, created by
\code{\link[=oauth_app]{oauth_app()}}}

\item{scope}{a character vector of scopes to request.}

\item{user_params}{Named list holding endpoint specific parameters to pass to
the server when posting the request for obtaining or refreshing the
access token.}

\item{type}{content type used to override incorrect server response}

\item{use_oob}{if FALSE, use a local webserver for the OAuth dance.
Otherwise, provide a URL to the user and prompt for a validation
code. Defaults to the of the \code{"httr_oob_default"} default,
or \code{TRUE} if \code{httpuv} is not installed.}

\item{oob_value}{if provided, specifies the value to use for the redirect_uri
parameter when retrieving an authorization URL. Defaults to "urn:ietf:wg:oauth:2.0:oob".
Requires \code{use_oob = TRUE}.}

\item{as_header}{If \code{TRUE}, the default, configures the token to add
itself to the bearer header of subsequent requests. If \code{FALSE},
configures the token to add itself as a url parameter of subsequent
requests.}

\item{use_basic_auth}{if \code{TRUE} use http basic authentication to
retrieve the token. Some authorization servers require this.
If \code{FALSE}, the default, retrieve the token by including the
app key and secret in the request body.}

\item{cache}{A logical value or a string. \code{TRUE} means to cache
using the default cache file \code{.httr-oauth}, \code{FALSE} means
don't cache, and \code{NA} means to guess using some sensible heuristics.
A string means use the specified path as the cache file.}

\item{config_init}{Additional configuration settings sent to
\code{\link[=POST]{POST()}}, e.g. \code{\link[=user_agent]{user_agent()}}.}

\item{client_credentials}{Default to \code{FALSE}. Set to \code{TRUE} to use
\emph{Client Credentials Grant} instead of \emph{Authorization
Code Grant}. See \url{https://www.rfc-editor.org/rfc/rfc6749#section-4.4}.}

\item{credentials}{Advanced use only: allows you to completely customise
token generation.}

\item{query_authorize_extra}{Default to \code{list()}. Set to named list
holding query parameters to append to initial auth page query. Useful for
some APIs.}
}
\value{
A \code{Token2.0} reference class (RC) object.
}
\description{
This is the final object in the OAuth dance - it encapsulates the app,
the endpoint, other parameters and the received credentials. It is a
reference class so that it can be seamlessly updated (e.g. using
\verb{$refresh()}) when access expires.
}
\details{
See \code{\link[=Token]{Token()}} for full details about the token object, and the
caching policies used to store credentials across sessions.
}
\seealso{
Other OAuth: 
\code{\link{oauth1.0_token}()},
\code{\link{oauth_app}()},
\code{\link{oauth_endpoint}()},
\code{\link{oauth_service_token}()}
}
\concept{OAuth}
