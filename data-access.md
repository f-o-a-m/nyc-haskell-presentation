---
# Querying Data

---

## Haxl Interlude

<center>
<img src="images/free-dsl.png" height="450" width="350">
</center>

---

## What is Haxl?

- Originally developed at Facebook, led by Simon Marlow
- Kind of like a scheduler for monadic computation
  - input "sequential" monadic computation
  - will optimally rewrite to parallalelize
  - sophisticated caching
- Really great for time indexed databases where you really don't want to do more work than you have to.
- Perfect for us. 

---