CD osm2world.old
REM CALL osm2world-windows.bat --performancePrint -i ../bin/map.osm -o ../bin/map.obj
java -Xmx2G -jar OSM2World.jar -c config.properties -i ../bin/map.osm -o ../bin/map.obj
CD ../bin
CALL START data_server.bat
REN map.obj.mtl map.mtl
powershell -Command "(gc map.obj) -replace '\.',','" >> final.obj
powershell -Command "(gc map.mtl) -replace ',','.'" >> final.mtl
DEL map.obj map.mtl
blender empty_world.a --background --python-text load_map.py
car.blend.exe
CD ..