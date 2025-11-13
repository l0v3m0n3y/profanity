# profanity
api for profanity.dev site for checking hate speech in message
# Example
```nim
import asyncdispatch, profanity, json, strutils
let data = waitFor check_profanity("duck")
echo data
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
