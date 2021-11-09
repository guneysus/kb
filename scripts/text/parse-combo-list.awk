#!/bin/env awk
# splits txt files with the format `<username>:<password>`

BEGIN {
  FS=":"
} 

{
  print $2
}

END {}
