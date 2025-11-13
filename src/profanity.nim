import asyncdispatch, httpclient, json, strutils, uri

const api = "https://vector.profanity.dev"
var headers = newHttpHeaders({
    "Connection": "keep-alive",
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36",
    "Host": "vector.profanity.dev",
    "Accept": "application/json",
    "Content-Type": "application/json"
})

proc check_profanity*(message: string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let body = %*{"message": message}
    let response = await client.post(api, $body)
    let responseBody = await response.body
    result = parseJson(responseBody)
  finally:
    client.close()
