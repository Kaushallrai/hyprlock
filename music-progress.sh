#!/bin/bash

player="spotify"

status=$(playerctl -p "$player" status 2>/dev/null)

if [[ "$status" != "Playing" ]]; then
  echo "[ -------------------- ] Paused"
  exit
fi

pos=$(playerctl -p "$player" position 2>/dev/null | cut -d '.' -f1)
length=$(playerctl -p "$player" metadata mpris:length 2>/dev/null | cut -d '.' -f1)
length=$(( length / 1000000 ))  # convert microseconds to seconds

if [[ -z "$pos" || -z "$length" || "$length" -eq 0 ]]; then
  echo "[ -------------------- ] --:--"
  exit
fi

bar_length=20
progress=$(( pos * bar_length / length ))

bar=""
for ((i=0; i<bar_length; i++)); do
  if (( i < progress )); then
   bar+="▓"



  else
    bar+="-"
  fi
done

format_time() {
  local m=$(( $1 / 60 ))
  local s=$(( $1 % 60 ))
  printf "%02d:%02d" "$m" "$s"
}

pos_fmt=$(format_time "$pos")
len_fmt=$(format_time "$length")

echo "[ $bar ] $pos_fmt / $len_fmt"

