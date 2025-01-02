#!/usr/bin/env sh
# rutas de directorios donde se obtienen las imagenes
wallpaper_dir="/home/aslan/imagenes/catppuccin"
cache_img="/home/aslan/.cache/current_wallpaper.png"
rofi_img="/home/aslan/.config/rofi/images/rofi_wallpaper.png"


# lista de las imagenes en el directorio
wallpapers=($(find "$wallpaper_dir" -type f))

# total de imagenes
total_wallpapers=${#wallpapers[@]}

# si hay mas de una imagen, empezamos a recorrerlas
if [ "$total_wallpapers" -gt 1 ]; then
    # intenta leer el archivo donde guardamos la última imagen seleccionada
    last_wallpaper_file="/home/aslan/.cache/last_wallpaper_index"
    if [ -f "$last_wallpaper_file" ]; then
        last_wallpaper=$(cat "$last_wallpaper_file")
    else
        last_wallpaper=-1  # si no existe el archivo, comenzamos desde el índice 0
    fi

    # calcula el índice de la siguiente imagen (no repite la última)
    next_wallpaper=$(( (last_wallpaper + 1) % total_wallpapers ))

    # guarda el indice de la imagen seleccionada
    echo "$next_wallpaper" > "$last_wallpaper_file"
else
    # si solo hay una imagen, la seleccionamos
    next_wallpaper=0
fi

# seleccionar la siguiente imagen
wallpaper="${wallpapers[$next_wallpaper]}"


# aplicar la imagen de fondo
echo ":: Aplicando wallpaper :: $wallpaper"
swww img "$wallpaper" --transition-bezier .43,1.19,1,.4 --transition-type "grow" --transition-duration 0.4 --transition-fps 60 --invert-y --transition-pos "0,0" &

# guardar la imagen seleccionada en cache
cp "$wallpaper" "$cache_img"
cp "$wallpaper" "$rofi_img"

# editar imagen en cache con magick
magick "$cache_img" -evaluate multiply 0.5 -statistic Mean 3x3 "$cache_img"
