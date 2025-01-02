#!/usr/bin/env sh

# Comprueba si hay algún reproductor en ejecución
if playerctl -l | grep -q .; then
    # Si hay un reproductor, muestra el título
    playerctl metadata --format='{{ title }}' 2>/dev/null
else
    # Si no hay reproductor, muestra un mensaje vacío o personalizado
    echo ""  # o puedes usar echo "No player found"
fi