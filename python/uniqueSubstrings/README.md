## Question of the Week

Write script for a function uniqueSubstrings(s: string, k: int) -> List<string> that returns all distinct substrings of length k from the input string s. 
Something like
def uniqueSubstrings(s: str, k: int) -> List[str]:
Behavior
Slide a window of size k over s.
Collect each substring of length k, but only include it once in the result.
Preserve the order in which each new substring first appears.

```
Input:  s = "Passw0rd", k = 4

Windows:
  "Pass"  (indices 0–3)
  "assw"  (1–4)
  "ssw0"  (2–5)
  "sw0r"  (3–6)
  "w0rd"  (4–7)

Distinct result: ["Pass", "assw", "ssw0", "sw0r", "w0rd"]
```