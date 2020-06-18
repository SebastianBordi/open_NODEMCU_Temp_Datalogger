print('init.lua ver 1.2.2')
wifi.setmode(wifi.STATION)
print('set mode=STATION (mode='..wifi.getmode()..')')
print('MAC:  ',wifi.sta.getmac())
print('chip: ',node.chipid())
print('heap: ',node.heap())
print('Sebastian A. Bordi')
-- wifi config start
station_cfg={}
station_cfg.ssid="SSID"                     --aqui va el nombre de la red wifi
station_cfg.pwd="password "                 --aqui va la cotraseña (valga la redundancia)
wifi.setmode(wifi.STATION)
wifi.sta.config(station_cfg)
wifi.sta.connect()
print('Conecting to WifiTomas')
-- wifi config end
-- inicia main.lua--
if file.open("main.lua") then
    print('Opening File main.lua')
    file.close()
    dofile("main.lua")
else
    print('main.lua could not be opened')
end
