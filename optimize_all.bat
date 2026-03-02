@echo off
echo Optimizing images...

"C:\Program Files\ImageMagick-7.1.2-Q16-HDRI\magick.exe" CubeMaster.png -resize 256x256 -quality 75 CubeMaster_new.webp
"C:\Program Files\ImageMagick-7.1.2-Q16-HDRI\magick.exe" cheers_man.webp -resize 256x256 -quality 75 cheers_man_new.webp
"C:\Program Files\ImageMagick-7.1.2-Q16-HDRI\magick.exe" cheers_woman.webp -resize 256x256 -quality 75 cheers_woman_new.webp
"C:\Program Files\ImageMagick-7.1.2-Q16-HDRI\magick.exe" deep_man.webp -resize 256x256 -quality 75 deep_man_new.webp
"C:\Program Files\ImageMagick-7.1.2-Q16-HDRI\magick.exe" deep_woman.webp -resize 256x256 -quality 75 deep_woman_new.webp
"C:\Program Files\ImageMagick-7.1.2-Q16-HDRI\magick.exe" wild_man.webp -resize 256x256 -quality 75 wild_man_new.webp
"C:\Program Files\ImageMagick-7.1.2-Q16-HDRI\magick.exe" wild_woman.webp -resize 256x256 -quality 75 wild_woman_new.webp

echo Replacing originals...
del CubeMaster.png
del cheers_man.webp
del cheers_woman.webp
del deep_man.webp
del deep_woman.webp
del wild_man.webp
del wild_woman.webp

ren CubeMaster_new.webp CubeMaster.webp
ren cheers_man_new.webp cheers_man.webp
ren cheers_woman_new.webp cheers_woman.webp
ren deep_man_new.webp deep_man.webp
ren deep_woman_new.webp deep_woman.webp
ren wild_man_new.webp wild_man.webp
ren wild_woman_new.webp wild_woman.webp

echo Done!
