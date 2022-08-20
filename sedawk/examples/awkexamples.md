# Examples

## 1
Data: 

```bash
Name Rate Hours
Beth 5.0 0
Dan 4.75 0
Kathy 4.00 10
Mark 5.00 20
Mary 5.50
```
Script:

```bash
#!/usr/bin/awk -f

NR > 1 {
        if ($3 ~ /^$/ || $3 == "0") # == works
                print "Total hours for", $1, ": None";
        else
                print "Total hours for", $1, ":", $3;
        }


```

## 2

Data: 

```bash
Name Rate Hours
Beth 5.0 0
Dan 4.75 0
Kathy 4.00 10
Mark 5.00 20
Mary 5.50
```
Script:

```bash
NR > 1 {
        if($3 ~ /^$/ || $3 == "0")
                print $1, "earned: Nothing";
        else 
                print $1, "earned:", $2 * $3
        }

```
Output:

```bash
Beth earned: Nothing
Dan earned: Nothing
Kathy earned: 40
Mark earned: 100
Mary earned: Nothing
```



---

Data: 

```bash

```
Script:

```bash

```
Output:
```bash

```