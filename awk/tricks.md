# Tricky stuff

## Quoutes in awk

*	In bash scripting awk commands that take in arguments as a variables need to access them. This is where double and single quoutes might trip you.

```bash
	# in bash script
	var=10
	conditon=5
	echo "Working" | awk '$var > $condition {print $0}' # This will NOT WORK, you need to access variables with ""
	#NO OUPTU

	echo "Working" | awk "$var > $conditon {print \$0}" #since we use "{}" we need to use \$0 with so it CAN be interpreted by awk and NOT printed as "$0". 
	#Working

```