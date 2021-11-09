#!/bin/bash
set -e

raw_file="${1}"
output_file="${raw_file%.*}-summary.har"

jq '.log.entries | [.[] | { 
  url: .request.url,
  dns: .timings.dns,
  ssl: .timings.ssl,
  connect: .timings.connect,
  blocked: .timings.blocked,
  send: .timings.send,
  wait: .timings.wait,
  receive: .timings.receive,
  blocked_queueing: .timings._blocked_queueing
}]' ${raw_file} > ${output_file}

echo ${output_file}