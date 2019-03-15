#!/bin/bash

this_month=`date +%m`
this_date=`date +%d`


if [[ ( $this_month -eq 3 && $this_date -ge 21 ) ||
  ($this_month -eq 4 && $this_date -le 20) ]]; then
  sign='♈'
elif [[ ($this_month -eq 4 && $this_date -ge 21) ||
  ($this_month -eq 5 && $this_date -le 21) ]]; then
  sign='♉'
elif [[ ($this_month -eq 5 && $this_date -ge 22) ||
  ($this_month -eq 6 && $this_date -le 21) ]]; then
  sign='♊'
elif [[ ($this_month -eq 6 && $this_date -ge 22) ||
  ($this_month -eq 7 && $this_date -le 23) ]]; then
  sign='♋'
elif [[ ($this_month -eq 7 && $this_date -ge 24) ||
  ($this_month -eq 8 && $this_date -le 22) ]]; then
  sign='♌'
elif [[ ($this_month -eq 8 && $this_date -ge 23) ||
  ($this_month -eq 9 && $this_date -le 23) ]]; then
  sign='♍'
elif [[ ($this_month -eq 9 && $this_date -ge 24) ||
  ($this_month -eq 10 && $this_date -le 22) ]]; then
  sign='♎'
elif [[ ($this_month -eq 10 && $this_date -ge 23) ||
  ($this_month -eq 11 && $this_date -le 22) ]]; then
  sign='♏'
elif [[ ($this_month -eq 11 && $this_date -ge 23) ||
  ($this_month -eq 12 && $this_date -le 21) ]]; then
  sign='♐'
elif [[ ($this_month -eq 12 && $this_date -ge 22) ||
  ($this_month -eq 1 && $this_date -le 19) ]]; then
  sign='♑'
elif [[ ($this_month -eq 1 && $this_date -ge 20) ||
  ($this_month -eq 2 && $this_date -le 18) ]]; then
  sign='♒'
elif [[ ($this_month -eq 2 && $this_date -ge 19) ||
  ($this_month -eq 3 && $this_date -le 20) ]]; then
  sign='♓'
fi

echo $sign
