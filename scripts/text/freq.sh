#!/bin/bash
# counts occurences of txt files. example output:
# -----------------
# 34559 123456
# 29075 123456789
# 6816 123123
# -----------------

cat "${1}" | uniq -c | sort  -r | awk '{print $1, $2}' | sort -rn
