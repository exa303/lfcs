# Examples

## 1.
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

## 2.

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
## 3. Calculating averages

Data: 

```bash
Name Grades
Beth;8;8;9;7;9;
John;2;4;8;9;
Joe;1;4;5;6;4;
```
Script:
* here it is importaint to not that on line 7 and 8 we reset the values back to zero. Otherwise it would just keep incrementing with data from next line. Variables ar global in awk.

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

## 4. Summation algorithm 

Data: 

```bash
JOB NAME;TIME;
test;100
job1;5;
job2;10
job3;20;
job1;5;
job2;10;
job3;20;
jobx;5
test;100


```
Script:

```bash
#!/usr/bin/awk -f

BEGIN { FS = ";"; indx = 0  }

function total(){
                for(i =0; i<indx;i++){
                        printf("%s - %d\n", name[i], time[name[i]])
                        }
        }

NR > 1 {
        if($0 !~ /^$/){ #ignore empty lines

        if (time[$1] < 1) 
        {
        time[$1] = $2;
        name[indx] = $1;
        indx++; # ++ works in awk
        }
        else 
        time[$1] += $2;
        }
}

END {
        total()

        }

```
Output:

```bash
test - 200
job1 - 10
job2 - 20
job3 - 40
jobx - 5

```

## 5. each `{}` executes on each line seperately if the is no condition. Loading array

Data: 

```bash
Name;Age;
Jim;22;
Johny;35;
Tim;41;
Diego;44;
Tony;18;

```
Script:

```bash
#!/usr/bin/awk -f

BEGIN { print "Starting script...", FS = ";"}

{
        arr[NR] = $1; # this is how to load all results in to array
        }

NR > 1 {
        print arr[NR]
        }


END {
        print "Finished with data from:" FILENAME
        print "Number of rows processed:" NR 
        }

```
Output:

```bash
Starting script... ;
Jim
Johny
Tim
Diego
Tony

Finished with data from:data.txt
Number of rows processed:7

```


## 6.Append(to array)


Data: 

```bash
Name;Age;
Jim;22;
Johny;35;
Tim;41;
Diego;44;
Tony;18;

```
Script:

```bash
#!/usr/bin/awk -f

function append(Arr,Data){
        newArr = Arr[length(Arr)+1] = Data
        return newArr
        }

BEGIN { print "Starting script...", FS = ";"}

{
        arr[NR] = $1;
        }

{
        append(arr,"A-p-p-e-n-d-e-d")

        }

NR > 1 {
        print arr[NR]
        }



END {
        print "Finished with data from:" FILENAME
        print "Number of rows processed:" NR 
        print arr[NR+1]
        exit 1
        }

```
Output:

```bash
Starting script... ;
Jim
Johny
Tim
Diego
Tony

Finished with data from:data.txt
Number of rows processed:7
A-p-p-e-n-d-e-d

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