library(httr)

# 1. Find OAuth settings for facebook:
#    http://developers.facebook.com/docs/authentication/server-side/
facebook <- oauth_endpoint(
  authorize = "https://www.facebook.com/dialog/oauth",
  access = "https://graph.facebook.com/oauth/access_token")

# 2. Register an application at https://developers.facebook.com/apps/
#    Insert your values below - if secret is omitted, it will look it up in
#    the FACEBOOK_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("facebook", "353609681364760")

# 3. Get OAuth credentials
facebook_token <- oauth2.0_token(facebook, myapp,
  type = "application/x-www-form-urlencoded")
facebook_sig <- sign_oauth2.0(facebook_token$access_token)
