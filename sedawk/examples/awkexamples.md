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
## 3 

Data: 

```bash
Name Grades
Beth;8;8;9;7;9;
John;2;4;8;9;
Joe;1;4;5;6;4;
```
Script:
* here it is importaint to not that on line 7 and 8 we reset the values back to zero. Becouse other wise it would just keep incrementing with data from new line. Variables ar global in awk.

```bash
     1  #!/usr/bin/awk -f
     2
     3  BEGIN { FS = ";" }
     4
     5  NR >1 { 
     6          f=NF-1; #print $1
     7          sum = 0; #reseting values back to 0 for new loop cycle
     8          num = 0; #reseting values back to 0 for new loop cycle
     9          for (i = 2; i <= f; i++){
    10                  sum += $i;
    11                  #print "DEBUG:", sum;
    12                  num +=1;
    13                  }
    14                  printf("%s Grade avg: %.2f\n", $1, (sum/num));
    15
    16          } 
```
Output:

```bash
Beth Grade avg: 8.20
John Grade avg: 5.75
Joe Grade avg: 4.00
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