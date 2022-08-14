BEGIN { FS=";" }
NR == 1 { 
    print "Begining of balance: " $1 
    balance = $1
}

NR >= 2 {   
    print $1,$2,$3 
    balance +=$3 
    print "Balance: " balance

}