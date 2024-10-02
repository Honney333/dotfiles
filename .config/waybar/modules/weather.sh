#!/bin/bash

cachedir=~/.cache/rbn
cachefile=${0##*/}-$1

# Check if cache file has more than 6 lines and delete if true
if [ -f $cachedir/$cachefile ] && [ $(wc -l < $cachedir/$cachefile) -gt 6 ]; then
    rm -f $cachedir/$cachefile
fi

if [ ! -d $cachedir ]; then
    mkdir -p $cachedir
fi

if [ ! -f $cachedir/$cachefile ]; then
    touch $cachedir/$cachefile
fi

# Save current IFS
SAVEIFS=$IFS
# Change IFS to new line.
IFS=$'\n'

cacheage=$(($(date +%s) - $(stat -c '%Y' "$cachedir/$cachefile")))
if [ $cacheage -gt 1720 ] || [ ! -s $cachedir/$cachefile ]; then
    data=($(curl -s https://en.wttr.in/Dallgow-Döberitz\?0qnT 2>&1))
    echo ${data[0]} | cut -f1 -d, > $cachedir/$cachefile
    echo ${data[1]} | sed -E 's/^.{15}//' >> $cachedir/$cachefile
    echo ${data[2]} | sed -E 's/^.{15}//' >> $cachedir/$cachefile
    echo ${data[3]} | sed -E 's/^.{15}//' >> $cachedir/$cachefile
    echo ${data[4]} | sed -E 's/^.{15}//' >> $cachedir/$cachefile
    echo ${data[5]} | sed -E 's/^.{15}//' >> $cachedir/$cachefile
fi

weather=($(cat $cachedir/$cachefile))

# Restore IFS
IFS=$SAVEIFS

# Split temperature and condition from weather[2]
city=$(echo ${weather[0]})
condition=$(echo ${weather[1]})
temperature=$(echo ${weather[2]} | awk '{print $1 $2}')
wind-speed=$(echo ${weather[2]} | awk '{print $1 $2}')
visibility=$(echo ${weather[3]} | awk '{print $1 $2}')
precipitation=$(echo ${weather[4]} | awk '{print $1 $2}')

# Debugging: Output temperature and condition
# echo "Temperature: $temperature"
# echo "Condition: $condition"

# https://fontawesome.com/icons?s=solid&c=weather
case $(echo ${weather[1]##*,} | tr '[:upper:]' '[:lower:]') in
"clear" | "sunny")
    condition_icon=" "
    ;;
"partly cloudy")
    condition_icon=" "
    ;;
"cloudy")
    condition_icon=" "
    ;;
"overcast")
    condition_icon=" "
    ;;
"mist" | "fog" | "freezing fog")
    condition_icon=" "
    ;;
"patchy rain possible" | "patchy light drizzle" | "light drizzle" | "patchy light rain" | "light rain" | "light rain shower" | "rain")
    condition_icon=" "
    ;;
"moderate rain at times" | "moderate rain" | "heavy rain at times" | "heavy rain" | "moderate or heavy rain shower" | "torrential rain shower" | "rain shower" | "heavy rain shower")
    condition_icon=" "
    ;;
"patchy snow possible" | "patchy sleet possible" | "patchy freezing drizzle possible" | "freezing drizzle" | "heavy freezing drizzle" | "light freezing rain" | "moderate or heavy freezing rain" | "light sleet" | "ice pellets" | "light sleet showers" | "moderate or heavy sleet showers")
    condition_icon=" "
    ;;
"blowing snow" | "moderate or heavy sleet" | "patchy light snow" | "light snow" | "light snow showers")
    condition_icon=" "
    ;;
"blizzard" | "patchy moderate snow" | "moderate snow" | "patchy heavy snow" | "heavy snow" | "moderate or heavy snow with thunder" | "moderate or heavy snow showers")
    condition_icon=" "
    ;;
"thundery outbreaks possible" | "patchy light rain with thunder" | "moderate or heavy rain with thunder" | "patchy light snow with thunder")
    condition_icon=" "
    ;;
*)
    condition_icon=" "  # Default if no condition matches
    ;;
esac

#echo $temp $condition

# Generate the final output string
output=$(echo -e "{\"text\":\""$temperature $condition_icon $condition"\", \"alt\":\""${weather[0]}"\", \"tooltip\":\""$city:  : ${wind-speed}  : $visibility : $precipitation"\"}")

# Check for invalid UTF-8 characters in the output
if ! echo "$output" | iconv -f UTF-8 -t UTF-8 >/dev/null 2>&1; then
    echo "{\"text\":\""Error"\"}"
    rm -f $cachedir/$cachefile
else
    echo "$output"
fi