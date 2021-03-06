# checks for
#   extension of existing workspace, numer of extensiosn has to decrease, time has to increase
testname=${0%%test.sh}
printf "%-60s " ${testname%%/}
sudo -u usera ../bin/ws_allocate -m test@mail -x workspace1 0 2> $testname/err.res > $testname/out.res
ret=$?

cmp --quiet $testname/err.res $testname/err.ref
cmp1=$?
cmp --quiet $testname/out.res $testname/out.ref
cmp2=$?

if [ $ret != 0 -o $cmp1 != 0 -o $cmp2 != 0 ]
then
	echo -e "\e[1;31mfailed\e[0m $ret $cmp1 $cmp2"
else	
	echo -e "\e[1;32msuccess\e[0m"
fi
