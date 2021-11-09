#!/bin/bash

set -e

csv_header='url, dns, ssl, connect, blocked, send, wait, receive, blocked_queueing'
raw_file="${1}"
output_file="${raw_file%.*}.csv"

echo ${csv_header} > $output_file

jq -r '.log.entries[] | [ 
  .request.url,
  .timings.dns,
  .timings.ssl,
  .timings.connect,
  .timings.blocked,
  .timings.send,
  .timings.wait,
  .timings.receive,
  .timings._blocked_queueing    
] | @csv' ${raw_file} >> ${output_file}

echo ${output_file}