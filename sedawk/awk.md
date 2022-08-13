## Regula expressions with //

* `awk '/MA/' text2.txt` - matches ewery line that has "MA" in it.

## Change field separator

* `-F` - this changes field separator
    * `awk -F, '{ print $1 }' text2.txt`
