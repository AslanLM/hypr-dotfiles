#!/bin/bash

# API Key de OpenWeatherMap
API_KEY="a0515d13a76272183dab9a6851d2ca23"
# liberia costa rica miher
CITY="Liberia"
COUNTRY="CR"

# los datos en JSON
weather_data=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=${CITY},${COUNTRY}&appid=${API_KEY}&units=metric")

# extrae el clima y la temperatura
weather_description=$(echo "$weather_data" | jq -r '.weather[0].description')
temperature=$(echo "$weather_data" | jq -r '.main.temp')

# case para definir el icono segun el clima
case "$weather_description" in
    *clear*) icon="🌤️" ;;         # Soleado
    *cloud*) icon="☁️" ;;         # Nublado
    *rain*) icon="🌧️" ;;          # Lluvia
    *storm*) icon="⛈️" ;;         # Tormenta
    *snow*) icon="❄️" ;;           # Nieve
    *) icon="🌤️" ;;                # Icono por defecto
esac


# salida
if [ -n "$temperature" ]; then
    echo "${icon} +${temperature}°C"
else
    echo "No weather data"
fi

# salida del tooltip
if [ -n "$weather_description" ]; then
    echo "$weather_description"
else
    echo "No weather data"
fi